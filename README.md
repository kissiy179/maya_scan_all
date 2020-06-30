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

## ログファイルについて
[セキュリティツール](https://knowledge.autodesk.com/ja/support/maya/troubleshooting/caas/sfdcarticles/sfdcarticles/JPN/How-to-diagnose-and-clean-Maya-ScriptExploit-issues.html)は
```C:\Users\satoshi\AppData\Local\Temp```にログを出力します。  
各シーンファイルごとにログを残しますが、以下のような結果になっていれば問題ないようです。  
```
checking issues in file: <scene_path1>
scriptjob not found
checking issues in file: <scene_path2>
scriptjob not found
checking issues in file: <scene_path3>
scriptjob not found
checking issues in file: <scene_path4>
scriptjob not found
...
```

以下のようにノードやscriptJobを削除したログが残っている場合などはシーンが感染していたということになります。  
感染自体は[セキュリティツール](https://knowledge.autodesk.com/ja/support/maya/troubleshooting/caas/sfdcarticles/sfdcarticles/JPN/How-to-diagnose-and-clean-Maya-ScriptExploit-issues.html)によって駆除されています。
```
checking issues in file: <scene_path5>
Malware : scriptJob present : 148
Removed : scriptJob ID: 148
scriptNode present : MayaMelUIConfigurationFile
Removed : scriptNode: MayaMelUIConfigurationFile
```
