elem' needle haystack =
  let
    matches = filter (== needle) haystack
  in
    1 <= length matches
