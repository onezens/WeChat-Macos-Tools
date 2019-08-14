src=main.xmi
sp=./wechat-logos/$src
stdir=./WeChat
xctheosp=./include/xctheos.h
python ./tools/mcper.py $xctheosp $sp $stdir
/opt/theos/bin/logos.pl $stdir/main.xm > $stdir/main.m

