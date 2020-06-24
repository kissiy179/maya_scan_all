# maya_scan_all
Mayaのマルウェア駆除としてAutodesk公式が公開したMayaScannerを指定したディレクトリ以下のシーンファイルに対して一括で行うためのスクリプト  
[セキュリティツール](https://knowledge.autodesk.com/ja/support/maya/troubleshooting/caas/sfdcarticles/sfdcarticles/JPN/How-to-diagnose-and-clean-Maya-ScriptExploit-issues.html)がインストールされ、プラグインが有効になっている必要があります。

## 使い方
maya_scan_all.batを任意のフォルダに配置し実行してください。  
そのフォルダをルートとして再帰的にシーンファイルを検索し、自動的に各ファイルをセキュリティツールのMayaScanにかけます。
