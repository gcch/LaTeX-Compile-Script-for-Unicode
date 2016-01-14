# LaTeX コンパイルスクリプト (Unicode 版)

Unicode (UTF-8) 版 LaTeX コンパイルスクリプト。


## Overview

upLaTeX でちょっと遊んでみたくなったので作成。

仕様の詳細は、Shift-JIS 版である「[LaTeX コンパイルスクリプト](https://github.com/gcch/LaTeX-Compile-Script)」のページを参照。

ブランチで分けても良かった気がするけど、まぁ……ね。


## Differences between Shift-JIS version and UTF-8 version

大まかな違いは下記の通り。

* コンパイル用スクリプト
  - 文字コードの変更 (Mac OS X / Linux)
  - LaTeX コマンドの変更 (platex -> uplatex)
  - dvipdfmx の kanji オプションの引数 (sjis -> utf-8)
* フォントマップファイル
  - 仮想フォント名の変更 (pTeX のものから upTeX 向けに)
* Windows 用文字置換スクリプト (replace.vbs)
  - UTF-8 対応に書き換え


## License

This is released under the MIT license. See the [LICENSE](LICENSE) file.


## Author

* tag (Blog: [とりとめもないはなし。](http://karat5i.blogspot.jp/) | Twitter: [@tag_ism](https://twitter.com/tag_ism))
