#!/bin/bash

# 引数がない場合はエラーを出す
if [ -z "$1" ]; then
    echo "使い方: ./new-contest.sh <ディレクトリパス> (例: ./new-contest.sh abc/450)"
    exit 1
fi

DIR_PATH=$1
# （abc/450 -> abc450 になるようにする）
PKG_NAME=$(echo "$DIR_PATH" | sed 's/\///g')

# ディレクトリを作成
mkdir -p "$DIR_PATH"

# Cabalファイル（ダミーのライブラリ設定）を直接生成
cat <<EOF >"$DIR_PATH/$PKG_NAME.cabal"
cabal-version:      3.0
name:               $PKG_NAME
version:            0.1.0.0
build-type:         Simple

library
    -- cabal-fmt: expand .
    exposed-modules:

    build-depends:    base, vector, bytestring, containers, array, mtl
    hs-source-dirs:   .
    default-language: Haskell2010
EOF

# A.hs 〜 F.hs のテンプレートを生成
for problem in A B C D E F G; do
    cat <<EOF >"$DIR_PATH/$problem.hs"
module $problem where

import Data.Maybe (fromJust)
import qualified Data.Vector as V
import qualified Data.ByteString.Char8 as BS

readInt :: BS.ByteString -> Int
readInt = fst . fromJust . BS.readInt

main :: IO ()
main = do
    input <- BS.words <$> BS.getContents
    let ints = map readInt input

    -- start from here
    -- let n = head ints

    print ints
EOF
done

echo "✅ $DIR_PATH のセットアップが完了しました！"
