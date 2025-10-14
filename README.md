# hiro language

A minimal toy language and package manager.

## Install locally

```
npm install -g .
```

## Usage

```
hiro -v
hiro -npm path/to/program.hiro
hiro nankapowermorimori path/to/program.hiro  # 別名
hiro install hello
hiro uninstall hello
```

# おしゃべり
Hiro Osyaberi ==> ("hello world")🐧

# 定数・変数とfor（MorningRoutine）
Hiro Hidariude LIMIT = 3🐧
Hiro Migiude i = 0🐧
Hiro MorningRoutine (Hiro Migiude i = 0🐧 Hiro Hikaku i < LIMIT🐧 Hiro Okawari i++) {
  Hiro Hissatsu [print] (i)🐧
}

# 関数定義と呼び出し
Hiro Waza add(a, b) ==> {
  Hiro Reverse (a + b)🐧
}🐧
Hiro Hissatsu [print] (add(3, 4))🐧

# 入力と出力
Hiro Osyaberi ==> ("input please")🐧
Hiro Hissatsu [print] (scan())🐧

# パッケージの読み込み
Hiro Eduke hello/main🐧
```

### Callback 関数の例

```
# コールバックを受け取る関数を定義
Hiro Waza doTwice(callback関数) ==> {
  Hiro Hissatsu [callback] ()🐧
  Hiro Hissatsu [callback] ()🐧
}🐧

# コールバック関数を定義
Hiro Waza callback関数 () ==> {
  Hiro Osyaberi ==> ("called!")🐧
}🐧

# 呼び出し
Hiro Hissatsu [doTwice] ()🐧
```

### 入力の代入（scan into 変数）

```
Hiro Osyaberi ==> ("名前を入力")🐧
Hiro Omimi ==> (&name)🐧
Hiro Osyaberi ==> ("こんにちは ")🐧
Hiro Hissatsu [print] (name)🐧
```

### 変数定義

```
# 代入して定義
Hiro Migiude x = 123🐧

# 空で変数を定義（未初期化は空文字）
Hiro Migiude x🐧
```

### 定数定義

```
Hiro Hidariude LIMIT = 10🐧
# 定数は再代入不可（エラー）
# Hiro Migiude LIMIT = 20🐧  ← エラーになります
```

This will print "hello world" and, if you installed the `hello` package, also run `registry/hello/main.hiro`.

## Local registry

Packages for `install` are sourced from the local `registry/` directory. Only `.hiro` files are copied into `hiro_modules/` under your current working directory.

## macOS 配布 (.pkg/.dmg) とアンインストーラ

### 配布物（Node実行方式）
- `/usr/local/lib/hiro` にプロジェクト一式を展開し、`/usr/local/bin/hiro` は Node で起動するラッパーです。

### .pkg の作成（自動化スクリプト推奨）
```
bash scripts/build-dmg.sh 0.1.0 dev.hiro.lang
# 出力: dist/hiro-0.1.0.pkg, dist/hiro-0.1.0.dmg
```

### アンインストール（CLIから）
- インストール解除は `hiro -a uninstall` を推奨します（管理者権限が必要です）。
```
hiro -a uninstall
```

### .dmg の作成
```
mkdir -p dist/dmg
cp dist/hiro-0.1.0.pkg dist/dmg/
cp scripts/uninstall-hiro.command dist/dmg/
hdiutil create -volname "Hiro Installer" -srcfolder dist/dmg -ov -format UDZO dist/hiro-0.1.0.dmg
```

（配布を本格化する場合は codesign / productsign / notarization の利用を推奨）

### 一括ビルド（.dmgまで）
```
# 0.1.0, dev.hiro.lang は引数で上書き可能
npm run make:dmg

# 直接スクリプトを叩く場合（バージョン/IDを指定）
bash scripts/build-dmg.sh 0.1.0 dev.hiro.lang
```
