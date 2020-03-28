# DOS211_REBUILD
Rebuild MS-DOS 2.11

# LICENSE
殆ど全てのソースコードはマイクロソフトがMITライセンスで配布したものです。

MSDOS.SYS及びMSDOS211フォルダ内のソースコードはJohn Elliott氏によるものです。
http://www.seasip.info/DOS/

# 概要
MS-DOS 2.11のリビルドについて研究しています。

# 開発環境
* PC-98エミュレータ Neko Project 21/W
* MS-DOS 5.0A 基本機能セット
* MS-DOS 5.0A 拡張機能セット (LINK, EXE2BIN)
* Microsoft MACRO Assembler 4.0 (MASM)

# MS-DOSのソースコードの中身

https://github.com/microsoft/MS-DOS

ここのv20の中身は2.11のソースコードとMS-DOS Distribution Disks 2.00が合わさったものです。

当時は現代のように「汎用PC」なるものが存在せず、メーカーによって規格が異なったため、当然OSもその規格に併せてカスタマイズする必要がありました。

MS-DOS Distribution Disksはマイクロソフトが開発を請け負っていたIBM PC/AT機向けOS PC-DOS 2.0を他のメーカーが作ったPCへ移植するための開発環境です。

ちなみにオリジナルソースコードのフォルダにはゴミが入っています。WSBAUD.BAS, WSMSGS.OVR, WSOVLY1.OVRはWordStar 3.2のプログラムの一部です。.TXTは全てMS-DOS Distribution Disks内の.DOCと同一です。

# 何をしたか
まずこのレポジトリではソースコードとDistribution Disksを分けました。そしてファイルがそろっているものはビルドも行っています。

# 最終的に何ができるか
ユーティリティはCHKDSK, DEBUG, DISKCOPY, EDLIN, EXE2BIN, FC, FIND, MORE, PRINT, RECOVER, SORT, SYS

OS本体のうちCOMMAND.COMも難なく生成できます

ブートローダ,IO.SYS,MSDOS.SYS,FORMAT.COMは自力で書く必要があります。

MSDOS.SYSは有志が書いたものがあります。

FORMAT.COMはとりあえず生成できますが、実行するとブートセクタ領域が0で埋められるので自力で書く必要があります。

# ビルド方法

* BOOT.ASM(ブートローダ), BIOS.ASM(for IO.SYS), OEMFOR.ASM(for FORMAT.COM) の3つを書く

* BIOS.ASMはIO_BUILD,OEMFOR.ASMはFORMAT_BUILDのファイルと共にLINK.EXEでEXEに吐き出す

* EXE2BINでBOOT.EXEはBOOT.COM, BIOS.EXEはIO.SYS, FORMAT.EXEはFORMAT.COMにする。

* BOOT.COMの内容をブートセクタに書き込む

* BINフォルダ内の他のものをフロッピーディスクへ書き込む
