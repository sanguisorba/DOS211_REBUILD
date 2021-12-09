# DOS211_REBUILD
<img width="320" height="200" align="center" style="float: center; margin: 0 10px 0 0;" alt="MS-DOS SCREENSHOT" src="https://github.com/sanguisorba/DOS211_REBUILD/blob/master/screenshot.png"> 

画像:ビルド例 (NEC PC-9800 Series)

# 概要
MS-DOS 2.11のソースコードをMASM 1.20用に調整・リビルドしました。

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

# 開発環境
* PC-98エミュレータ Neko Project 21/W
* PC-9800シリーズ用 MS-DOS 2.11
* MASM 1.20 + LINK 2.00 (Distribution Diskと同一)
* MASM 1.25 + LINK 2.00 ((Distribution Diskと同一)
* MASM 4.00 日本マイクロソフト版 (EXEMOD付属)

# MS-DOSのソースコードの中身

https://github.com/microsoft/MS-DOS

v20フォルダの中身は2.11のソースコードとMS-DOS Distribution Disks 2.00が合わさったものです。

当時は現代のように「汎用PC」なるものが存在せず、メーカーによって規格が異なったため、当然OSもその規格に併せてカスタマイズする必要がありました。

MS-DOS Distribution Disksはマイクロソフトが開発を請け負っていたIBM PC/AT機向けOS PC-DOS 2.0を他のメーカーが作ったPCへ移植するための開発環境です。

ちなみにオリジナルソースコードのフォルダにはゴミが入っています。WSBAUD.BAS, WSMSGS.OVR, WSOVLY1.OVRはWordStar 3.2のプログラムの一部です。.TXTは全てMS-DOS Distribution Disks内の.DOCと同一です。

# 何をしたか
ソースコードとDistribution Disksを分けました。そしてファイルがそろっているものはビルドも行っています。

# 最終的に何ができるか
ユーティリティはCHKDSK, DEBUG, DISKCOPY, EDLIN, EXE2BIN, FC, FIND, MORE, PRINT, RECOVER, SORT, SYS

OS本体のうちCOMMAND.COMも難なく生成できます

ブートローダ,IO.SYS,MSDOS.SYS,FORMAT.COMはファイルが足りないので自力で書く必要があります。

MSDOS.SYSは有志が書いたものがあります。 (1.xx非対応のため4.00でのみコンパイルしてます)

FORMAT.COMはとりあえず生成できますが、実行するとブートセクタ領域が0で埋められるので自力で書く必要があります。

# とりあえず動かしてみたい人向け

* MS-DOS 2.xでフォーマットされた空のディスクイメージとIO.SYSを用意します

* IO.SYS , MSDOS.SYS , COMMAND.COM , その他のファイルの順でディスクにファイルを書き込みます

* 完成


# 本レポジトリではBOOT.ASM, BIOS.ASM, OEMFOR.ASMを提供しません。

20210722 PC-98上でMSDOS.SYSを動かせるようになりました
20211210 MASM 1.25追加、 旧ビルドの MASM 4.00版のOBJ（BIN含む）を再アップロード