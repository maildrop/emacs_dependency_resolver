MSYS2 ���ŁAemacs ���r���h�����ۂɕK�v�� dll �����W���邽�߂̂��̂ł��B

MSYS2 �� pacman -Su ���ăA�b�v�f�[�g�����ۂɁAdependency walker �ŁA�m
�F���ăR�s�[����̂���ςŁAdll �̎��W�Ń~�X��h�����߂ɁA���܂����B

�����o�O�j
emacs �̖����I�ȃ����N�t�@�C�������W���邱�Ƃ��o���Ȃ����߂ɁA�K�v�Ǝv
����t�@�C�����ꊇ�łƂ��Ă��܂��B���̖����I�ȃ����N���s���t�@�C���́A
dependency_emacs.sh �Ƀn�[�h�R�[�h����Ă���̂ŁA�K�v�ɉ����āA�ύX��
�K�v�ł��B

���j
 cp �Ńt�@�C�����R�s�[����̂ŁA�^�C���X�^���v���X�V����Ă��܂��B

���� �t�@�C���̐��� ����

Makefile
 make (all) �ŁAemacs.exe �ɕK�v�Ȉˑ�dll�t�@�C����T���āA dest �f�B���N�g���ɃR�s�[����B
 make clean �ŁA��Ɨp�f�B���N�g�����폜����B

dependency_emacs.sh
 emacs ���ˑ����Ă��� dll ��T���ăR�s�[���Ă���B make all ���̎��̂͂���B
 deprslv.sh ( dependency resolver �̂���j���g���āA�ˑ��֌W�𒲂ׂ���A
.deplist �f�B���N�g���̉��� *.list �t�@�C�����������āA dest �f�B���N�g����
�edll ���R�s�[����B

deprslv.sh [dllfile]
����� dll ��(�ÖٓI�����N�ɂ���āj�ˑ����Ă��� dll �ƁA���ꂪ�ˑ����Ă��� dll �� �ċA�I�ɒ��ׂ�B
���ʂ́A .deplist �f�B���N�g���� �t�@�C����.list �̌`�ŕۑ������B

ldd_filter.pl
deprslv.sh �̓����Ŏg�p����t�B���^
 deprslv.sh �͓����ŁA ldd �ɂ���āADLL �𒲍����Ă��邪�A���̌��ʂ�
���`���āAWindows �� System �f�B���N�g���̃t�@�C�������O����t�B���^�B 


