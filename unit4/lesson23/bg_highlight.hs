{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

highlight :: T.Text -> T.Text -> T.Text
highlight query fullText = T.intercalate highlighted pieces
  where pieces = T.splitOn query fullText
        highlighted = mconcat ["{",query,"}"]

-- Replacing sanskirt since my machine does not support unicode currently
needle :: T.Text
needle = "needle"

haystack :: T.Text
haystack = "where could this needle be in this big ol' haystack"

main = do
  TIO.putStrLn (highlight needle haystack)
