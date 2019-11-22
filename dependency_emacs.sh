#!/bin/sh

#emacs が暗黙的 あるいは明示的にリンクしている DLL これは、バージョンアップに伴って変わる可能性がある。
#dependency_dlls="libjpeg-8.dll libXpm-noX4.dll libgif-7.dll libgdk-win32-2.0-0.dll libpng16-16.dll libtiff-5.dll libxml2-2.dll libdbus-1-3.dll librsvg-2-2.dll libgnutls-28.dll"
dependency_dlls="libjpeg-8.dll libXpm-noX4.dll libgif-7.dll libpng16-16.dll libtiff-5.dll libxml2-2.dll librsvg-2-2.dll libwinpthread-1.dll libgnutls-30.dll libgnutlsxx-28.dll"
w32_imeadv_dlls= #"libgcc_s_seh-1.dll libstdc++-6.dll"
# 依存ファイルのリストを作成する。
if [ -d .deplist ] ; then  # 存在していたら作り直し
    rm -r .deplist 
fi

for f in ${dependency_dlls} ${w32_imeadv_dlls}
do
    echo $f;
    # フルパスの取得
    file=`which $f`
    # 当該のファイルが
    if [ -f ${file} ] ; then 
        ./deprslv.sh ${file}
    fi
done;

# .deplist ディレクトリの *.list に書かれているファイルを まとめて、dest ディレクトリにコピーする

if [ ! -d ./dest ] ; then
    mkdir ./dest
fi
for f in ` cat .deplist/*.list | sort | uniq `; do
    echo $f
    cp $f ./dest
done

          
