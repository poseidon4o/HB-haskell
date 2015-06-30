map_ :: (x -> y) -> [x] -> [y]
map_ fn (x:xs) = fn x : map_ fn xs
map_ _  []     = []

foldl_ :: (y -> x -> y) -> y -> [x] -> y
foldl_ fn b (e:es) = foldl_ fn (fn b e) es
foldl_ _  b []     = b

map2 :: (x -> y) -> [x] -> [y]
map2 fn l = foldl_ (\es e -> es ++ [fn e]) [] l

filter2 :: (x -> Bool) -> [x] -> [x]
filter2 fn l = foldl_ (\es e -> if fn e then es ++ [e] else es) [] l


qsort :: Ord x => [x] -> [x]
qsort [] = []
qsort (h:t) = (qsort $ filter (<= h) t) ++ [h] ++ (qsort $ filter (> h) t)


endl :: x -> [x]
endl s = s : endl s

cycle_ :: [x] -> [x]
cycle_ l = ch l
    where ch [e] = e : ch l
          ch (h:t) = h : ch t


every :: Eq x => Int -> [x] -> [x]
every _ _ = undefined
--every idx l = f $ drop (idx - 1) l
--    where f [] = []
--          f (x:xs) = x : f (drop (idx - 1) xs)

--every idx l
--    | (drop (idx - 1) l) == [] = []
--    | otherwise = (head $ drop (idx - 1) l) : every idx (drop idx l)

--every idx l = map snd $ filter f (zip [1..] l)
--    where
--        f (index, _) = mod index idx == 0

--every idx l
--    | idx < 1 = []
--    | otherwise = eh idx  l
--        where eh _ []    = []
--              eh 1 (h:t) = h : eh idx t
--              eh i (h:t) = eh (i - 1) t


locMax :: Ord a => [a] -> [a]
locMax (a:b:c:t)
    | a < b && b > c = b : locMax ([c] ++ t)
    | otherwise = locMax ([b] ++ [c] ++ t)
locMax _ = []


unit :: Int -> Int -> [[Int]]
unit id sz = map (\i -> row i) [0..sz - 1]
    where row z = (take z $ repeat 0) ++ [id] ++ (take (sz - z - 1) $ repeat 0)


row :: Int -> [[Int]] -> [Int]
row _ [] = []
row i (x:xs)
    | i < 0 = error "invalid row"
    | otherwise = if i == 0 then x else row (i - 1) xs

transpose_ :: [[Int]] -> [[Int]]
transpose_ [] = []
transpose_ (e:es)
    | e == [] = []
    | otherwise = oneRow l : transpose_ (removeOne l)
        where oneRow [] = []
              oneRow (x:xs) = head x : oneRow xs
              removeOne [] = []
              removeOne (x:xs) = tail x : removeOne xs
              l = e:es
