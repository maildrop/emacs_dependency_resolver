#!/bin/sh

#emacs ���ÖٓI ���邢�͖����I�Ƀ����N���Ă��� DLL ����́A�o�[�W�����A�b�v�ɔ����ĕς��\��������B
#dependency_dlls="libjpeg-8.dll libXpm-noX4.dll libgif-7.dll libgdk-win32-2.0-0.dll libpng16-16.dll libtiff-5.dll libxml2-2.dll libdbus-1-3.dll librsvg-2-2.dll libgnutls-28.dll"
dependency_dlls="libjpeg-8.dll libXpm-noX4.dll libgif-7.dll libpng16-16.dll libtiff-5.dll libxml2-2.dll librsvg-2-2.dll  libwinpthread-1.dll libgnutls-30.dll"
w32_imeadv_dlls= #"libgcc_s_seh-1.dll libstdc++-6.dll"
# �ˑ��t�@�C���̃��X�g���쐬����B
if [ -d .deplist ] ; then  # ���݂��Ă������蒼��
    rm -r .deplist 
fi

for f in ${dependency_dlls} ${w32_imeadv_dlls}
do
    echo $f;
    # �t���p�X�̎擾
    file=`which $f`
    # ���Y�̃t�@�C����
    if [ -f ${file} ] ; then 
        ./deprslv.sh ${file}
    fi
done;

# .deplist �f�B���N�g���� *.list �ɏ�����Ă���t�@�C���� �܂Ƃ߂āAdest �f�B���N�g���ɃR�s�[����

if [ ! -d ./dest ] ; then
    mkdir ./dest
fi
for f in ` cat .deplist/*.list | sort | uniq `; do
    echo $f
    cp $f ./dest
done

          
