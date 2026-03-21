## ByteString / Text
### 概要
通常の`String`型の実態は`[Char]`なので、文字列を扱う際にはリスト操作となってしまい効率が悪い。
文字列にランダムアクセスするなど文字列操作を高速に行うためには`ByteString`型と`Text`型を使用する。

`ByteString`の内部表現はただのバイト列である。
注意点としては、扱える文字がUnicode限定であり、日本語などの範囲外の文字を扱うことはできない。
そのため、日本語など他の文字も扱う際には`Text`型を使用する。

また、両モジュール共に`Prelude`パッケージに同名の関数が複数定義されている。
そのため、これらを利用する際には`as`を用いて明示的に呼び出して使用する。
```hs
import qualified Data.Text as T
```

### 文字列から変換する際の言語拡張設定
以下のように言語拡張を使用することで、通常の文字列リテラルを簡単に`ByteString`, `Text`へ変換することが出来る。
```hs
{-# LANGUAGE OverloadedStrings #-}
import Data.ByteString.Char8

cat :: ByteStringcat = "Meow!"
```

