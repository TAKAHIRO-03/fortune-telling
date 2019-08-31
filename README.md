
Name
====
Mojoliciousで占いアプリケーション

## Overview
「占う」を押したら、結果ページへ遷移し、僕の好きな馬場ふみかと池田エライザとあいみょんが出てきて、たまにハリセンボンの春菜(好きじゃないです)が出てきます。

txtファイルのデータから、HTML::TreeBuilderを使って、Google検索and画像のsrc取得してます。


## Demo
![FortuneTelling](https://user-images.githubusercontent.com/43311555/62829263-d63aa680-bc34-11e9-8338-f9b9a0be8c12.gif)

## Usage

テキストファイルのパスを見直す必要あり。

実行時は、カレントディレクトリで、「morbo main.pl」で実行。

追加したいグラビアアイドルなどいる場合は、Info.txtに追加して下さい。

## Caution

すべてのOSで検証していません（MacOSのみ動作確認済み）。

Perl 5.30.0のみで動作確認済み。
