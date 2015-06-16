_even :: Int -> Bool
_even x = x `mod` 2 == 0

_odd :: Int -> Bool
_odd x = not (_even x)

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
    (perimeter a b c / 2 *
    (perimeter a b c / 2 - a) * 
    (perimeter a b c / 2 - b) *
    (perimeter a b c / 2 - c))

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

nth :: Int -> [Int] -> Int
nth 0 (x:_) = x
nth x [] = error "NO!"
nth x (h:t)
    | x < 0 = error "NO!" 
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
