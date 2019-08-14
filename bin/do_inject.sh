
libname=libWeChat.dylib
libpath=./libs
deplibpath=./libs/substitute/libsubstitute.dylib
targetname=WeChat
targetname_tmp=WeChat_tmp
targetname_bk=WeChat_bk
targetpath=./target/WeChat.app/Contents/MacOS

#backup
if [[ ! -f $targetpath/$targetname_bk ]]; then
	cp $targetpath/$targetname $targetpath/$targetname_bk
	echo 'backup original mach-o file success.'
fi

#judge whether inject lib to mach-o
info=`otool -l $targetpath/$targetname`
if [[ $info =~ "@executable_path/"$libname ]]; then
	echo 'target: '$targetpath/$targetname' had inject lib'
	exit 0
fi

./tools/insert_dylib --weak @executable_path/$libname $targetpath/$targetname $targetpath/$targetname_tmp
mv $targetpath/$targetname_tmp $targetpath/$targetname
cp $libpath/$libname $targetpath
cp $deplibpath  $targetpath
