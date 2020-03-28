360FAT12について

FAT12のBPBを書く際の注意事項です。基本的にフロッピーディスクといえば1.44MBフォーマットですが、MS-DOS 2.11は1.44MBフォーマットを認識しない筈です。
ネット上にあるBPB資料のほとんどは1.44MBのパラメータで、他のフォーマットのパラメータがネット上に存在しません。
そこで360KBにフォーマットされたフロッピーディスクのブートセクタを読みました。

普通、FAT12の仕様というとマイクロソフトが公式で出しているガイドブックを読む事になります。
http://download.microsoft.com/download/0/8/4/084C452B-B772-4FE5-89BB-A0CBF082286A/fatgen103.doc

ここも参考になります。
http://softwaretechnique.jp/OS_Development/bootloader4.html

しかしながら、MS-DOS 2.11では異なる事に注意してください。
https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system#BPB30


(BPBの解読は逆アセンブルの内に入らないのでセーフでしょ)
