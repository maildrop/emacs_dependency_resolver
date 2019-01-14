MSYS2 環境で、emacs をビルドした際に必要な dll を収集するためのものです。

MSYS2 で pacman -Su してアップデートした際に、dependency walker で、確
認してコピーするのが大変で、dll の収集でミスを防ぐために、作りました。

多分バグ）
emacs の明示的なリンクファイルを収集することが出来ないために、必要と思
われるファイルを一括でとってきます。この明示的なリンクを行うファイルは、
dependency_emacs.sh にハードコードされているので、必要に応じて、変更が
必要です。

問題）
 cp でファイルをコピーするので、タイムスタンプが更新されてしまう。

＝＝ ファイルの説明 ＝＝

Makefile
 make (all) で、emacs.exe に必要な依存dllファイルを探して、 dest ディレクトリにコピーする。
 make clean で、作業用ディレクトリを削除する。

dependency_emacs.sh
 emacs が依存している dll を探してコピーしてくる。 make all 時の実体はこれ。
 deprslv.sh ( dependency resolver のつもり）を使って、依存関係を調べた後、
.deplist ディレクトリの下の *.list ファイルを結合して、 dest ディレクトリに
各dll をコピーする。

deprslv.sh [dllfile]
特定の dll が(暗黙的リンクによって）依存している dll と、それが依存している dll を 再帰的に調べる。
結果は、 .deplist ディレクトリに ファイル名.list の形で保存される。

ldd_filter.pl
deprslv.sh の内部で使用するフィルタ
 deprslv.sh は内部で、 ldd によって、DLL を調査しているが、その結果を
整形して、Windows の System ディレクトリのファイルを除外するフィルタ。 


