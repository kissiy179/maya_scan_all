# maya_scan_all
Mayaのマルウェア対策としてAutodesk公式が公開したMayaScannerを指定したディレクトリ以下のシーンファイルに対して一括で行うためのスクリプトです。  
[セキュリティツール](https://knowledge.autodesk.com/ja/support/maya/troubleshooting/caas/sfdcarticles/sfdcarticles/JPN/How-to-diagnose-and-clean-Maya-ScriptExploit-issues.html)がインストールされ、プラグインが有効になっている必要があります。

## 使い方
階層内にスキャンしたいMayaシーンがあるディレクトリにmaya_scan_all_<Mayaバージョン>.batを配置し実行してください。  
そのディレクトリをルートとして再帰的にシーンファイルを検索し、自動的に各ファイルにセキュリティツールを使ってスキャンをかけます。
