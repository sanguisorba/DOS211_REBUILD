# 概要
MS-DOS 2.11のソースコードをMASM 1.20用に調整・リビルドしました。

詳細は SRC/README.mdをご覧ください。

# LICENSE
殆ど全てのソースコードはマイクロソフトがMITライセンスで配布したものです。

MSDOS.SYS及びMSDOS211フォルダ内のソースコードはJohn Elliott氏によるものです。
http://www.seasip.info/DOS/

ただビルドしただけなのでsanguisorbaに追加の著作権等はありません。

# 中身

* BIN_200 - MS-DOS 2.00のバイナリファイル (Distribution Disksのバイナリをそのまま持ってきたもの)
* BIN_211 - MS-DOS 2.11のバイナリファイル (MASM 1.20)
* DISTRIBUTION_DISKS - 元のソースコードのうち、Distribution Disksに分類されるもの
* OBJ_211_20 - ソースコードをビルドした時に出てきたもの全て (MASM 1.20)
* OBJ_211_25 - ソースコードをビルドした時に出てきたもの全て (MASM 1.25)
* OBJ_211_40 - ソースコードをビルドした時に出てきたもの全て (MASM 4.00)
* SRC_211 - 元のソースコードのうち、MS-DOS 2.11のビルドに関係あるもの全て
* TRASHBOX - ゴミ箱

# とりあえず動かしてみたい人向け

* MS-DOS 2.xでフォーマットされた空のディスクイメージとIO.SYSを用意します

* IO.SYS , MSDOS.SYS , COMMAND.COM , その他のファイルの順でディスクにファイルを書き込みます

* 完成


# Microsoftのレポジトリで配布されていないものはここでは掲載していません

# 更新履歴

20210722 PC-98上でMSDOS.SYSを動かせるようになりました

20211210 MASM 1.25追加、 旧ビルドの MASM 4.00版のOBJ（BIN含む）を再アップロード

20211211 IO.SYSが正常にコンパイルできない不具合 (SYSINITとSYSIMESのバージョンが元から一致していない)を修正 BIOS(ALTOS)をMS-DOS 2.11のものにアップデート