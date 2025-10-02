#!/bin/sh

#emacs が暗黙的 あるいは明示的にリンクしている DLL これは、バージョンアップに伴って変わる可能性がある。
#dependency_dlls="libjpeg-8.dll libXpm-noX4.dll libgif-7.dll libgdk-win32-2.0-0.dll libpng16-16.dll libtiff-5.dll libxml2-2.dll libdbus-1-3.dll librsvg-2-2.dll libgnutls-28.dll"

dependency_dlls=$(cat <<EOF
  libXpm-noX4.dll
  libpng16-16.dll
  libtiff-6.dll
  libjpeg-8.dll
  libgif-7.dll
  librsvg-2-2.dll
  libwebp-7.dll
  libsqlite3-0.dll
  libxml2-16.dll
  libgnutls-30.dll
  libgnutlsxx-30.dll
  zlib1.dll
  liblcms2-2.dll
  libgccjit-0.dll
  libwinpthread-1.dll
  libdbus-1-3.dll
EOF
               );

w32_imeadv_dlls= #"libgcc_s_seh-1.dll libstdc++-6.dll"

# 依存ファイルのリストを作成する。
cleanup_depenency_list()
{
    if [ -d .deplist ] ; then  # 存在していたら作り直し
        rm -r .deplist 
    fi
}

dependecy_resolve()
{
    local target_file_path;
    # フルパスの取得
    # echo $("${SYSTEMROOT}\\System32\\where.exe" "$1")
    target_file_path=$(which "$1")
    # 当該のファイルが存在すれば
    if [ -f "${target_file_path}" ] ; then
        ./deprslv.sh "${target_file_path}"
    fi
}

cleanup_depenency_list;
for f in ${dependency_dlls} ${w32_imeadv_dlls} ; do
    echo $f;
    dependecy_resolve "$f";
done;

# .deplist ディレクトリの *.list に書かれているファイルを まとめて、dest ディレクトリにコピーする

if [ ! -d ./dest ] ; then
    mkdir ./dest
fi
for f in $(cat .deplist/*.list | sort | uniq ) ; do
    echo $f
    cp --preserve=timestamps $f ./dest
done

          
