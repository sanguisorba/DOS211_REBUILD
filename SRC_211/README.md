# 開発環境
* PC-98エミュレータ Neko Project 21/W
* PC-9800シリーズ用 MS-DOS 5.0

# MS-DOS GitHubの説明

https://github.com/microsoft/MS-DOS

v2.0フォルダ内は以下の３つが混在しています。

* Wordstar 3.2のファイル
* MS-DOS 2.00 Distribution Disks
* MS-DOS 2.11 ソースコード

Wordstar 3.2のファイルはsourceフォルダのWSBAUD.BAS, WSMSGS.OVR, WSOVLY1.OVRが該当します。ゴミなので削除してください。

## MS-DOS 2.00 Distribution Disks

ファイルリストなど詳しくはこのサイトを参照
https://www.pcjs.org/software/pcx86/sys/dos/microsoft/2.00/

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/567899/0fbf7f8b-7a93-71d9-e215-32a5930244e9.png)

各OEMベンダーがMS-DOSを自社のコンピュータ用にアレンジするための開発ディスクで、ファイルリストは以下の通り

```
# DISK.1
DEBUG    COM    11764   2-01-83  10:13a
EXE2BIN  EXE     1649   2-01-83   9:19a
CHKDSK   COM     6330   2-01-83   9:16a
COMMAND  COM    15480   2-08-83   7:50p
EDLIN    COM     4389   2-01-83   9:31a
PRINT    COM     3808   2-01-83  12:39p
RECOVER  COM     2277   2-01-83   2:22p
SYS      COM      850   2-01-83   2:26p
MORE     COM     4364   1-14-83   6:42p
DISKCOPY COM     1419   2-14-83   4:39p
LINK     EXE    42368   1-06-83   4:36p
SORT     EXE     1216   2-08-83   7:04p
FIND     EXE     5796   1-14-83   6:35p
FC       EXE     2553   2-01-83   9:36a
MSDOS    SYS    16690   2-08-83   7:48p
README   DOC     8832   1-01-80  12:03a

# DISK.2
MASM     EXE    77440   2-01-83   1:13p
CREF     EXE    13824   6-02-82   6:06p

# DISK.3
DOSMAC   ASM     6656  10-18-82  12:06p
DEVSYM   ASM     2688  10-18-82  12:07p
DOSSYM   ASM    42112   1-01-80  12:07a
GENFOR   ASM     4096   2-03-83   2:45p
PRINT    ASM    48000   2-01-83  12:37p
FORMAT   OBJ     4864   2-03-83   2:18p
DOSPATCH TXT     2546   2-08-83   8:04p
FORMAT   DOC    16640   2-03-83   3:37p
FORMES   OBJ     1152   2-03-83   2:03p

# DISK.4
PROHST   PAS    11520   1-28-83   6:07p
FILBP    PAS     6144   1-28-83   6:08p
SYSIMES  OBJ      384   1-24-83  11:42a
SKELIO   ASM    45056   1-01-80  12:05a
HRDDRV   ASM    17536   1-01-80  12:15a
PROFIL   OBJ     2304  10-28-82   5:32p
PROFIL   ASM    21248  10-28-82   5:31p
PCLOCK   ASM     3200  10-28-82   5:32p
SYSINIT  OBJ     3328   2-08-83   8:24p
PROHST   EXE    41728   1-28-83   5:51p
PROHST   HLP     1536   1-28-83   6:06p

# DISK.5
SYSCALL  DOC    59136   1-27-83   3:18p
DEVDRIV  DOC    37888   1-27-83   3:22p
UTILITY  DOC    27776   1-27-83   3:26p
QUICK    DOC     3456   1-27-83   3:39p
INT24    DOC     4224   1-27-83   3:30p
ANSI     DOC     6784   1-27-83   3:31p
PROFILE  DOC     3968   1-27-83   3:34p
CONFIG   DOC     3456   1-27-83   3:35p
SYSINIT  DOC     3072   1-27-83   3:40p
INCOMP   DOC     2688   1-27-83   3:42p
```

ちなみに.DOCのファイルと同じ内容の.TXTファイルも中に入っています。

<b>これらのファイルは全て、2.11のソースコードのビルドに必要のないものです</b>
(MASM, LINK, EXE2BINをここから持ってくる場合を除く)

## MS-DOS 2.11のソースコード

Distribution DisksのファイルとWordstarのファイルを除いたものがMS-DOS 2.11のソースコードとなります。

ここから、MS-DOS 2.11のDistribution Disksのバイナリが生成できます (ブータブルなMS-DOS 2.11ではない)

* CHKDSK
* COMMAND
* DEBUG
* DISKCOPY
* EDLIN
* EXE2BIN
* FC
* FIND
* FORMAT を作るのに必要なオブジェクトファイル
* IO (IO.SYS) を作るのに必要なオブジェクトファイル
* MORE
* MSDOS (MSDOS.SYS)
* PRINT
* RECOVER
* SORT
* SYS

MS-DOSのレポジトリにあるソースコードはそのままだと生成できないので以下のように改変する必要があります

※MASMからENDがおかしいと怒られた場合はテキストエディタでENDの後を改行してあげるとうまくいきます。ENDの後もスペースなどが続いているとエラーが起きます

### CHKDSK

```
○ASM→OBJにする
CHKDSK.ASM (*要改変)
CHKMES.ASM
CHKPROC.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK CHKDSK.OBJ CHKPROC.OBJ CHKMES.OBJ
EXE2BIN CHKDSK.EXE CHKDSK.COM
```

CHKDSK.ASMはそのままコンパイルしようとするとエラーが起きるので次のように訂正する必要があります。

```
859行目
        XCHG    AL,[ERRSUB]
                ↓
        XCHG    AL,BYTE PTR [ERRSUB]
```

### COMMAND
```
○ASM→OBJにする
COMMAND.ASM
COPY.ASM
COPYPROC.ASM
CPARSE.ASM
INIT.ASM
RDATA.ASM
RUCODE.ASM
TCODE.ASM
TCODE2.ASM
TCODE3.ASM
TCODE4.ASM
TCODE5.ASM
TDATA.ASM (*破損)
TSPC.ASM
TUCODE.ASM
UINIT.ASM

○ASM→OBJにしない
COMEQU.ASM
COMSEG.ASM
COMSW.ASM (*要改変)
EXEC.ASM
IFEQU.ASM
DOSSYM.ASM ← 2.11を使う
DOSMAC.ASM ← 2.11を使う
DEVSYM.ASM
```
※リンカ用ファイルCOMLINKがある。

COMSWでIBM PC-DOSからMS-DOSへ切り替える必要があります。

TDATA.ASMは文字化けがあります。正しい内容はこちら

https://raw.githubusercontent.com/jeffpar/pcjs-demo-disks/master/pcx86/dos/microsoft/2.11/src/COMMAND/TDATA.ASM

### DEBUG
```
○ASM→OBJにする
DEBASM.ASM
DEBCOM1.ASM
DEBCOM2.ASM
DEBCONST.ASM
DEBDATA.ASM
DEBMES.ASM
DEBUASM.ASM
DEBUG.ASM

○ASM→OBJにしない
DEBEQU.ASM
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK DEBUG.OBJ DEBCOM1.OBJ DEBCOM2.OBJ DEBUASM.OBJ DEBASM.OBJ DEBCONST.OBJ DEBDATA.OBJ DEBMES.OBJ
EXE2BIN DEBUG.EXE DEBUG.COM
```

### DISKCOPY
```
○ASM→OBJにする
DISKCOPY.ASM
DISKMES.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK DISKCOPY.OBJ DISKMES.OBJ
EXE2BIN DISKCOPY.EXE DISKCOPY.COM
```

### EDLIN
```
○ASM→OBJにする
EDLIN.ASM
EDLMES.ASM
EDLPROC.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK EDLIN.OBJ EDLMES.OBJ EDLPROC.OBJ
EXE2BIN EDLIN.EXE EDLIN.COM
```

### EXE2BIN
```
○ASM→OBJにする
EXE2BIN.ASM
EXEMES.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK EXE2BIN.OBJ EXEMES.OBJ
```

### FC
```
○ASM→OBJにする
FC.ASM
FCMES.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK FC.OBJ FCMES.OBJ
```

### FIND
```
○ASM→OBJにする
FIND.ASM
FINDMES.ASM

LINK FIND.OBJ FINDMES.OBJ
```

### FORMAT
```
○ASM→OBJにする
FORMAT.ASM
FORMES.ASM
GENFOR.ASM ←本来はメーカー毎に書くもの。これはマイクロソフトのサンプルコード。詳しくはFORMAT.DOCに記載

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK FORMAT.OBJ FORMES.OBJ GENFOR.OBJ
EXE2BIN FORMAT.EXE FORMAT.COM
```

### IO
```
○ASM→OBJにする
(BIOS.ASM) <-自分で書く。　サンプルコード SKELIO.ASM
SYSIMES.ASM <-バージョン不整合
SYSINIT.ASM

LINK BIOS.OBJ SYSIMES.OBJ SYSINIT.OBJ
EXE2BIN BIOS.EXE IO.SYS or IBMBIO.COM
```

SYSIMESで記述されているメッセージとSYSINITで指定されているメッセージの数が違うためリンクする際にエラーが起きます。

SYSIMESについては例えば以下のように記述します（2021年12月13日現在、筆者のレポジトリにあるものです）

```
SYSINITSEG      SEGMENT PUBLIC BYTE 'SYSTEM_INIT'

        PUBLIC  BADOPM,CRLFM,BADSIZ_PRE,BADLD_PRE,BADCOM,SYSSIZE
        PUBLIC  BADSIZ_POST,BADLD_POST,BADCOUNTRY

BADOPM  DB      13,10,"Unrecognized command in CONFIG.SYS"
CRLFM   DB      13,10,'$'

BADSIZ_PRE  DB      13,10,"Sector size too large in file"
BADSIZ_POST DB      " $"

BADLD_PRE   DB      13,10,"Bad or missing"
BADLD_POST   DB      " $"

BADCOM  DB      "Command Interpreter",0

BADCOUNTRY DB   "Invalid country code",13,10,'$'

SYSSIZE LABEL   BYTE

SYSINITSEG      ENDS
        END
```

尚、SKELIOについても不足している部分があり正常にリンクできませんが、後述。

### MORE
```
○ASM→OBJにする
MORE.ASM
MOREMES.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK MORE.OBJ MOREMES.OBJ
EXE2BIN MORE.EXE MORE.COM
```

### MSDOS

```
○ASM→OBJにする
MSDOS.ASM
MSCODE.ASM <-486行目 最後の '>' が一個多い
DOSMES.ASM
MISC.ASM <-432行目 ISSPECの名前でエラー有
GETSET.ASM
DIRCALL.ASM
ALLOC.ASM
DEV.ASM
DIR.ASM
DISK.ASM
FAT.ASM
ROM.ASM
STDBUF.ASM
STDCALL.ASM
STDCTRLC.ASM
STDFCB.ASM
STDPROC.ASM
STDIO.ASM <- IO.ASMがないのでオブジェクトファイルに吐き出せない
TIME.ASM
XENIX.ASM
XENIX2.ASM

○ASM→OBJにしない
BUF.ASM
CTRLC.ASM
DEVSYM.ASM
DOSMAC.ASM ← 2.11を使う
DOSSEG.ASM
DOSSYM.ASM ← 2.11を使う
EXEC.ASM
FCB.ASM
(IO.ASM) <-ない
MSDATA.ASM
MSHEAD.ASM
MSINIT.ASM
PROC.ASM
STDSW.ASM
(STRIN.ASM) <-本来はIO.ASMに呼び出される筈のスクリプトファイル
SYSCALL.ASM

LINK DOSLINK
EXE2BIN MSDOS.EXE MSDOS.SYS or IBMDOS.COM
```
※リンカ用ファイルDOSLINKがある。
John Elliott氏によるMSDOS.SYSの改良版アセンブリが存在し、代替が効きます。他の不具合も解消されています。
http://www.seasip.info/DOS/

ただしMASM 4.00でコンパイルする必要があります。

STDSWでIBM PC-DOSからMS-DOSへ切り替える必要があります。

筆者のレポジトリではPCjsによる改良版があるためそちらを拝借しています。PCjs版もMASM 4.00でコンパイルしないとエラーが起きますが、MASM 1.20でコンパイルできるようにさらに変更を加えています。

### PRINT
```
○ASM→OBJにする
PRINT.ASM ← 2.11を使う

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK PRINT.OBJ
EXE2BIN PRINT.EXE PRINT.COM
```

### RECOVER
```
○ASM→OBJにする
RECMES.ASM
RECOVER.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK RECOVER.OBJ RECMES.OBJ
EXE2BIN RECOVER.EXE RECOVER.COM
```

### SORT
```
○ASM→OBJにする
SORT.ASM
SORTMES.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK SORT.OBJ SORTMES.OBJ

そのままではSORT終了後にフリーズする。
PCjsによればMASM付属のEXEMODを使わないとだめらしい。
EXEMODはMASM 4.0付属のものを使用した。

EXEMOD SORT.EXE /MAX 1 /MIN 1

適用後はちゃんと動くようになった。
```

### SYS
```
○ASM→OBJにする
SYS.ASM
SYSMES.ASM

○ASM→OBJにしない
DOSMAC.ASM ← 2.11を使う
DOSSYM.ASM ← 2.11を使う

LINK SYS.OBJ SYSMES.OBJ
EXE2BIN SYS.EXE SYS.COM
```

## 他のユーティリティについて

### PROFIL
```
○ASM→OBJにする
PCLOCK.ASM
PROFIL.ASM

LINK PROFIL.OBJ PCLOCK.OBJ
EXE2BIN PROFIL.EXE PROFIL.COM
```

### SKELIO
```
○ASM→OBJにする
SKELIO.ASM

○必要なOBJ
SYSIMES.OBJ
SYSINIT.OBJ

LINK BIOS.OBJ SYSIMES.OBJ SYSINIT.OBJ
EXE2BIN BIOS.EXE IO.SYS or IBMBIO.COM
```
スケルトンコードをコンパイルしても何もならない気がしますが、一応。
SKELIOにはRE_INITの処理について記述がなく、リンクする際にエラーが出るので以下のような記述を追加します。

```
PUBLIC  RE_INIT ; CODE SEGMENT の前に

RE_INIT:        ; 他のコードの動作の妨げにならないような所に
        RET
```

### HRDDRV
```
MASM HRDDRV HRDDRV HRDDRV NUL
LINK HRDDRV.OBJ
EXE2BIN HRDDRV.EXE HRDDRV.SYS
```

こちらもスケルトンコードなのでコンパイルしても何もならない気がしますが、一応。

# 足りないもの

純正のファイルという意味ではIO.ASMとSYSIMES.ASMが不足していますが、補完されているのでDistribution Disksとして不足しているコードは無いと思います。

動作させるうえでは、ブートローダ、IO.SYSのOEMモジュール、FORMATのOEMモジュールの3点が必要です。

メーカーによってはモジュールのソースコードをMS-DOSと共に添付して出荷していました。筆者が確認したのは以下２点です。

* SCP MS-DOS 2.00 (IO.SYS関連モジュールとFORMATモジュール。ブートローダはFORMATモジュール内に記述されている)
* NEC A.P.C. MS-DOS 2.11 (IO.SYS関連モジュールのみ)