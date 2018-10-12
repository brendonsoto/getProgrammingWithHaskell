subseq start end xs = take range (drop start xs)
  where range = end - start
