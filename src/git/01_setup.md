# Git / GitHub を始める

## Gitのインストール

### Windows･WSL2共通

[こちらのリンク](https://git-scm.com/download/win)からインストーラをダウンロードし、インストーラを実行して画面の指示に従ってください。
なお、途中で使用するテキストエディタを選択する場面がありますが、 **デフォルトではVimが選択されているため** 、別のエディタを選択してください。
(VimはCLI上で動作するテキストエディタですが、扱いが非常に難しいため初心者にはおすすめしません。)おすすめはVSCode(入っていれば)です。

### Ubuntu(WSL2)の場合

以下のコマンド実行でインストールできます。
(余談ですがLinuxは1コマンドで何でもインストールすることができるのが強みです。)

```shell
sudo apt update
sudo apt install git
```

GitではGitHubなどのリモートGitサーバーの認証情報を扱う場面がありますが、WSL上のGitではそれを保持することができないため、
WindowsにインストールしたGit for Windowsを用いて認証情報を保存します。以下のコマンドで設定してください。
(なお、以下の設定はデフォルトのパスにGit for Windowsをインストールした場合のコマンドです。変更した場合は適宜読み替えてください。)

```shell
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
```

### macOSの場合

App StoreからXCodeをイントールすれば勝手についてきます。
しかし、ついてくるものはバージョンが古いためHomebrewからインストールしましょう。

```shell
brew update
brew install git
```
