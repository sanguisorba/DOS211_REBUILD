# DOS211_REBUILD
<img width="320" height="200" align="center" style="float: center; margin: 0 10px 0 0;" alt="MS-DOS SCREENSHOT" src="https://github.com/sanguisorba/DOS211_REBUILD/blob/master/screenshot.png"> 

画像:ビルド例 (NEC PC-9800 Series)

# LICENSE
殆ど全てのソースコードはマイクロソフトがMITライセンスで配布したものです。

MSDOS.SYS及びMSDOS211フォルダ内のソースコードはJohn Elliott氏によるものです。
http://www.seasip.info/DOS/

ただビルドしただけなのでsanguisorbaに追加の著作権等はありません。

# 概要
MS-DOS 2.11のソースコードをできる範囲でリビルドしました。

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
ソースコードとDistribution Disksを分けました。そしてファイルがそろっているものはビルドも行っています。

# 最終的に何ができるか
ユーティリティはCHKDSK, DEBUG, DISKCOPY, EDLIN, EXE2BIN, FC, FIND, MORE, PRINT, RECOVER, SORT, SYS

OS本体のうちCOMMAND.COMも難なく生成できます

ブートローダ,IO.SYS,MSDOS.SYS,FORMAT.COMはファイルが足りないので自力で書く必要があります。

MSDOS.SYSは有志が書いたものがあります。

FORMAT.COMはとりあえず生成できますが、実行するとブートセクタ領域が0で埋められるので自力で書く必要があります。

# ブータブルイメージ作成方法

* 本レポジトリはマイクロソフトが本来していたビルド作業は全て行っていますが、メーカーOEMが行うビルド作業はしていません。

* メーカーOEMが書かなければならないのはBOOT.ASM(ブートローダ), BIOS.ASM(for IO.SYS), OEMFOR.ASM(for FORMAT.COM) の3つです。

* Distribution disks付属のMASMはうまく動作してくれないので別途用意する必要があります。PC98用でも動きます。

* BIOS.OBJはSYSINIT.OBJとSYSIMES.OBJと共にLINKする必要があります。この2つのファイルはIO_BUILDフォルダに格納されています。

* OEMFOR.OBJはFORMAT.OBJとFORMES.OBJと共にLINKする必要があります。この2つのファイルはFORMAT_BUILDフォルダに格納されています。

* BOOT.OBJは単独でEXEに吐き出します。ブートセクタですから過不足なく512byteにしなければなりません。

* EXE2BINでBOOT.EXEはBOOT.COM, BIOS.EXEはIO.SYS, FORMAT.EXEはFORMAT.COMにします。

* BOOT.COMの内容をブートセクタに書き込みます。フロッピーディスクイメージをバイナリエディタで上書きすると良いです。

* BINフォルダ内の他のものをフロッピーディスクへ書き込めば完成です。


# 本レポジトリではBOOT.ASM, BIOS.ASM, OEMFOR.ASMを提供しません。

ちなみにPC-9800シリーズで動作させるためにはMSDOS.SYSのソースコード系も生では使えないので改造する必要があります。
