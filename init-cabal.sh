#!/bin/bash

# 引数チェック
if [ -z "$1" ]; then
    echo "使い方: ./init-cabal.sh <ディレクトリパス> (例: ./init-cabal.sh seriously-haskell)"
    exit 1
fi

DIR_PATH=$1
# パスの末尾にスラッシュが付いていた場合に取り除く
DIR_PATH=${DIR_PATH%/}
# スラッシュを削除してパッケージ名にする
PKG_NAME=$(echo "$DIR_PATH" | sed 's/\///g')
CABAL_FILE="$DIR_PATH/$PKG_NAME.cabal"

# ディレクトリが存在しない場合は作成
mkdir -p "$DIR_PATH"

# 既に .cabal ファイルが存在する場合は上書き防止のためにスキップ
if [ -f "$CABAL_FILE" ]; then
    echo "⚠️ 既に $CABAL_FILE が存在するため、作成をスキップしました。"
    exit 0
fi

# 2025年仕様の .cabal ファイルを生成
cat <<EOF >"$CABAL_FILE"
cabal-version:      3.0
name:               $PKG_NAME
version:            0.1.0.0
build-type:         Simple

library
    -- cabal-fmt: expand .
    exposed-modules:

    build-depends:    base, vector, bytestring, containers, array, mtl
    hs-source-dirs:   .
    default-language: GHC2021
EOF

echo "✅ $CABAL_FILE を作成しました！ (GHC2021 / Cabal 3.14 仕様)"
