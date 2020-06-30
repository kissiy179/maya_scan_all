# maya_scan_all
Mayaのマルウェア対策としてAutodesk公式が公開したMayaScannerを指定したディレクトリ以下のシーンファイルに対して一括で行うためのスクリプトです。  
[セキュリティツール](https://knowledge.autodesk.com/ja/support/maya/troubleshooting/caas/sfdcarticles/sfdcarticles/JPN/How-to-diagnose-and-clean-Maya-ScriptExploit-issues.html)がインストールされ、プラグインが有効になっている必要があります。

## 使い方
階層内にスキャンしたいMayaシーンがあるディレクトリにmaya_scan_all_<Mayaバージョン>.batを配置し実行してください。  
そのディレクトリをルートとして再帰的にシーンファイルを検索し、自動的に各ファイルにセキュリティツールを使ってスキャンをかけます。

## crulコマンドが使えない環境の場合
バッチファイルのみを対象ディレクトリに配置して実行すれば良いようにしたかったので、バッチファイルないでcurlコマンドを呼んでその場でmaya_scan_all.pyをダウンロードし実行しています。  
windows7以前やwindows10の古いバージョンではcurlが入っていないので何も実行されないことになります。  
またダウンロードが必要なのでインターネットに接続されていない環境でも同様になります。  
  
そういった場合にはmaya_scan_all.pyを実行バッチファイルと同ディレクトリに配置して実行するとそちらを使用するようになります。
