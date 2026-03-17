#!/bin/bash

# 引数がない場合はエラーを出す
if [ -z "$1" ]; then
    echo "使い方: ./new-contest.sh <ディレクトリパス> (例: ./new-contest.sh abc/450)"
    exit 1
fi

DIR_PATH=$1
# パスのスラッシュをハイフンに変換して、Cabalのパッケージ名にする (例: abc/450 -> abc-450)
PKG_NAME=$(echo "$DIR_PATH" | sed 's/\//-/g')

# ディレクトリを作成
mkdir -p "$DIR_PATH"

# Cabalファイル（ダミーのライブラリ設定）を直接生成
cat <<EOF >"$DIR_PATH/$PKG_NAME.cabal"
cabal-version:      3.0
name:               $PKG_NAME
version:            0.1.0.0
build-type:         Simple

library
    build-depends:    base, vector, bytestring, containers, array, mtl
    hs-source-dirs:   .
    default-language: Haskell2010
EOF

# a.hs 〜 f.hs のテンプレートを生成
for problem in a b c d e f; do
    cat <<EOF >"$DIR_PATH/$problem.hs"
import qualified Data.Vector as V
import qualified Data.ByteString.Char8 as BS

main :: IO ()
main = do
    -- ここにコードを書く
    return ()
EOF
done

echo "✅ $DIR_PATH のセットアップが完了しました！"
