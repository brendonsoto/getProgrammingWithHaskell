overwrite x = let x = 2
              in
                let x = 3
                in
                  let x = 4
                  in
                    x

-- Below was my original solution
-- overwrite' = (\x -> 4) . (\x -> 3) . (\x -> 2)

-- Book solution
overwrite' = (\x ->
               (\x ->
                 (\x -> x) 4
               ) 3
             ) 2
