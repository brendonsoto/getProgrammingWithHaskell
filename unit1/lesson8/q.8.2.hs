fastFib n1 n2 0 = n1 + n2
fastFib n1 n2 counter =
  if counter == 1
     then n2
     else fastFib (n1 + n2) n1 (counter - 1)
