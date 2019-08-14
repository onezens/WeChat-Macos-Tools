#!/usr/bin/env python
#encoding: utf-8

"""
mcper.py
Created by wz on 2019-07-02.
Copyright © 2019 onezen.cc. All rights reserved.
"""
import sys
import os

macroObjects = []

class MacroObject(object):
	"""docstring for MacroObject"""
	def __init__(self, macro):
		super(MacroObject, self).__init__()
		self.macro = macro
		self.keyword = ''
		self.xckw = ''
		self.pone = ''
		self.ptwo = ''
		self.params = ''
		self.paramsIsFull = True


def parse_macro(macro):
	macro = macro.strip()
	if len(macro) == 0:
		return
	mo = MacroObject(macro)
	compents = macro.split(' ')
	if len(compents) == 3:
		mo.pone = compents[1]
		mo.ptwo = compents[2]
	elif len(compents) > 3:
		part_one_done = False
		for c in compents:
			if part_one_done:
				mo.ptwo = mo.ptwo + ' ' + c
				continue
			if '#define' in c:
				continue
			elif ')' in c:
				part_one_done = True
			mo.pone = mo.pone + ' ' + c
		mo.pone = mo.pone.strip()
		mo.ptwo = mo.ptwo.strip()
	else:
		print 'Error macro invalidate: ', macro
	mo.keyword = mo.pone[0:mo.pone.rfind('(')]
	mo.xckw = mo.ptwo[0:mo.ptwo.rfind('(')]
	mo.params = mo.pone[mo.pone.rfind('(')+1: mo.pone.rfind(')')].split(',')
	for p in mo.params:
		if p.strip() not in mo.ptwo:
			mo.paramsIsFull = False
			# print mo.ptwo, ' --> ', p
			break
	# print 'part_one: ', mo.pone, " part_two: ", mo.ptwo, " keyword: ", mo.keyword, " params: ", mo.params, ' paramsIsFull :', mo.paramsIsFull
	macroObjects.append(mo)


def init_xctheos_macro(xctheos_path):
	xct = open(xctheos_path)
	lineCount = 0
	is_theos_macro = False
	is_op_segment = False
	for line in xct.readlines():
		lineCount=lineCount+1
		if not is_op_segment and '#ifdef XcodeTheos' in line :
			is_op_segment = True
			# print 'is_op_segment', lineCount
			continue
		if is_op_segment and '#else' in line:
			is_theos_macro = True
			# print 'is_theos_macro segment ', lineCount
			continue
		if is_op_segment and is_theos_macro and '#endif' in line:
			is_theos_macro = False
			is_op_segment = False
			# print 'xctheos op segment macro end ', lineCount
			continue
		if is_theos_macro and is_op_segment:
			parse_macro(line)		
	# print "line count: ", lineCount, ' configs: ', len(macroObjects)


def convertMacroLine(line):
	isNeed = False
	obj = None
	for mo in macroObjects:
		if mo.keyword in line:
			isNeed = True
			obj = mo
			break
	cline = line
	if isNeed:
		if "(" in obj.pone and "(" in obj.ptwo and len(obj.params)==1:
			cline = line.replace(obj.keyword, obj.xckw)
		elif ("(" in obj.pone and "(" not in obj.ptwo and len(obj.params)==1) or ("(" in obj.pone and "(" not in obj.ptwo and len(obj.params)>1 and not obj.paramsIsFull):
			linekw = line[line.rfind('(')+1: line.rfind(')')].split(',')[0]
			paramkw = obj.params[0]
			cline = obj.ptwo.replace(paramkw, linekw)
			cline = cline+"\n"
			# print line.strip() , '  ---->  ', cline.strip()
		elif obj.paramsIsFull:
			lineParams = line[line.rfind('(')+1: line.rfind(')')].split(',')
			cline = obj.ptwo
			if len(lineParams) != len(obj.params):
				print 'Error params: ', line, lineParams, obj.params,
				return
			for p in obj.params:
				cline = cline.replace(p, lineParams[obj.params.index(p)])
			if ';' in line:
				cline = cline+';';
			cline = cline+"\n"
			print line.strip(), ' ----> ', cline.strip(), lineParams, obj.params
		else:
			print 'Error line , not support convert : ', line
	return cline


def preprocess(cpTargetPath, cmTargetPath):
	t = open(cpTargetPath)
	w = open(cmTargetPath, 'w')
	for line in t.readlines():
		cline = convertMacroLine(line)
		w.write(cline)
	t.close()
	w.close()	


def main():
	if len(sys.argv)<3:
		print 'Input Params Error! \nUseage: python mcper.py /path/to/xctheos.h /path/to/Tweak.xmi'
		exit(0)
	xctheos_path = os.path.abspath(os.path.join(os.getcwd(), sys.argv[1]))
	cpTargetPath = os.path.abspath(os.path.join(os.getcwd(), sys.argv[2]))
	cmTargetPath = cpTargetPath.replace(cpTargetPath[cpTargetPath.rfind('.')+1: len(cpTargetPath)], 'xm')
	if len(sys.argv)==4:
		cmTargetPath = os.path.abspath(os.path.join(os.getcwd(), sys.argv[3]))
		if os.path.isdir(cmTargetPath):
			cmTargetPath = os.path.join(cmTargetPath, os.path.basename(cpTargetPath).replace('xmi', 'xm'))
	if len(xctheos_path)==0:
		print 'Error xctheos.h path can not empty!'
		exit(0)
	if len(cpTargetPath)==0:
		print 'convert target path can not empty!'
		exit(0)
	print 'xctheos_path: ', xctheos_path
	print 'cpTargetPath: ', cpTargetPath
	print 'cmTargetPath: ', cmTargetPath
	init_xctheos_macro(xctheos_path)
	preprocess(cpTargetPath,cmTargetPath)
	print 'convert marco xctheos file completed!'
	print 'output path: ', cmTargetPath

if __name__ == '__main__':
	main()

