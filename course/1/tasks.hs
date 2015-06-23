import Data.Char (digitToInt)

even_ :: Int -> Bool
even_ x = x `mod` 2 == 0

odd_ :: Int -> Bool
odd_ x = not (even_ x)

bmi :: Double -> Double -> Double
bmi hight weight = weight / (hight * hight)

deg2rad, rad2deg :: Double -> Double
deg2rad deg = (deg * pi) / 180
rad2deg rad = (rad * 180) / pi

isTriangle :: Double -> Double -> Double -> Bool
isTriangle a b c = a + b > c && a + c > b && b + c > a

perimeter :: Double -> Double -> Double -> Double
perimeter a b c = a + b + c

area :: Double -> Double -> Double -> Double
area a b c = 
    sqrt
    (p *
    (p - a) * 
    (p - b) *
    (p - c))
    where p = perimeter a b c / 2

calculate :: Char -> Double -> Double -> Double
calculate op l r =
    if op == '+' then l + r else
    if op == '-' then l - r else
    if op == '*' then l * r else
    if op == '/' then l / r else
    error "NO!"

lastt :: [Int] -> Int
lastt (x:[]) = x
lastt (x:xs) = lastt xs

double :: [Int] -> [Int]
double (x:xs) = x * 2 : double xs
double [] = []

mult :: Int -> [Int] -> [Int]
mult _ [] = []
mult x (h:t) = x * h : mult x t

nth :: Int -> [list_type] -> list_type
nth 0 (x:_) = x
nth x [] = error "NTH OF EMPTY LITS"
nth x (h:t)
    | x < 0 = error "NTH OF NEGATIVE INDEX"
    | otherwise = nth (x - 1) t


member :: Int -> [Int] -> Bool
member x [] = False
member x (h:xs) = x == h || member x xs

multLists :: [Int] -> [Int] -> [Int]
multLists [] _ = []
multLists _ [] = []
multLists (l:tl) (r:tr) = l * r : multLists tl tr

sum_ :: [Int] -> Int
sum_ [] = 0
sum_ (h:t) = h + sum t

product_ :: [Int] -> Int
product_ [] = 1
product_ (h:t) = h * product_ t


isValidId :: [Char] -> Bool
isValidId id = 
    checksum `mod` 11 == digitToInt (nth 9 id) || digitToInt (nth 9 id) == 0
    where weights = [2, 4, 8, 5, 10, 9, 7, 3, 6]
          checksum = sum_ (multLists weights (toInts id))
          toInts [] = []
          toInts (h:rest) = digitToInt h : toInts rest


listConcat :: [list] -> [list] -> [list]
listConcat [] l = l
listConcat (h:t) l = h : listConcat t l


init_ :: [list] -> [list]
init_ [] = error "INIT_ empty list"
init_ (a:x:[]) = [a]
init_ (h:t) = h : init_ t


take_ :: Int -> [list] -> [list]
take_ _ [] = []
take_ x (h:t) 
    | x < 0 = error "take_ with negative index"
    | x == 0 = []
    | otherwise = h : (take_ (x - 1) t)


drop_ :: Int -> [list] -> [list]
drop_ _ [] = []
drop_ x (h:t)
    | x < 0 = error "drop_ with negative index"
    | x == 0 = h:t
    | otherwise = drop_ (x - 1) t

len_ :: [list] -> Int
len_ [] = 0
len_ (_:t) = 1 + len_ t

zip_ :: [l1] -> [l2] -> [(l1, l2)]
zip_ [] [] = []
zip_ (_:t) [] = []
zip_ [] (_:t) = []
zip_ (lh:lt) (rh:rt)
    | otherwise = (lh, rh) : zip_ lt rt

lastDigits :: [Int] -> [Int]
lastDigits [] = []
lastDigits (h:t) = h `mod` 10 : lastDigits t


listApply :: (x -> x) -> [x] -> [x]
listApply _ [] = []
listApply fn (h:t) = (fn h) : listApply fn t

odds :: [Int] -> [Int]
odds [] = []
odds (h:t)
    | odd_ h = h : odds t
    | otherwise = odds t


divisibles :: Int -> [Int] -> [Int]
divisibles _ [] = []
divisibles dev (h:t)
    | h `mod` dev == 0 = h : divisibles dev t
    | otherwise = divisibles dev t


listFilter :: (x -> Bool) -> [x] -> [x]
listFilter _ [] = []
listFilter filt (h:t)
    | filt h == True = h : listFilter filt t
    | otherwise = listFilter filt t


flatten :: [[a]] -> [a]
flatten [[]] = []
flatten [] = []
flatten [h] = h
flatten (f:s:t) = flatten ((listConcat f s) : t)


foldl_ :: (y -> x -> y) -> y -> [x] -> y
foldl_ fn b (e:es) = foldl_ fn (fn b e) es
foldl_ _  b []     = b

foldr_ :: (y -> x -> y) -> y -> [x] -> y
foldr_ fn b (e:es) = fn b foldr_ b es
foldr_ _  b []     = b

map_ :: (x -> y) -> [x] -> [y]
map_ fn (x:xs) = fn x : map_ fn xs
map_ _  []     = []

filter_ :: (x -> Bool) -> [x] -> [x]
filter_ fn (e:es) 
    | fn e      = e : filter_ fn es
    | otherwise = filter_ fn es
filter_ _  []     = []


