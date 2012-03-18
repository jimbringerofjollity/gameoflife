neighbors1d :: Int -> [a] -> [a]
neighbors1d j a
   | j == 0 = take 2 a
   | j == (length a)-1 = reverse (take 2 (reverse a))
   | otherwise = take 3 (drop (j-1) a)

neighbors2d :: Int -> Int -> [[a]] -> [[a]]
neighbors2d i j a = neighbors1d i [neighbors1d j b | b <- a]

numliving :: [[Int]] -> Int
numliving a = sum (map sum a)

nextState :: Int -> Int -> [[Int]] -> Int
nextState i j a = if a !! i !! j == 0 && numliving (neighbors2d i j a) == 3 || a !! i !! j == 1 && (numliving (neighbors2d i j a) == 3 || numliving (neighbors2d i j a) == 4) then 1 else 0

nextArray :: [[Int]] -> [[Int]]
nextArray a = [[(nextState i j a) | j <- [0..((length (head a))-1)]] | i <- [0..((length a)-1)]]

clear :: IO ()
clear = putStr "\ESC[H\ESC[2J"

convert :: Int -> Char
convert n = if n == 0 then ' ' else '#'

convertArray :: [[Int]] -> [[Char]]
convertArray a = map (map convert) a

printArrayArray :: [[Int]] -> [IO ()]
printArrayArray a = map putStrLn (convertArray a)

printArray :: [Char] -> IO ()
printArray a = sequence_ [clear,(readFile a)>>=(sequence_.printArrayArray.read)]

writeNextArray :: [Char] -> [Char] -> IO ()
writeNextArray a b = (readFile a) >>= ((writeFile b).show.nextArray.read)

initialize :: IO ()
initialize = getContents >>= (writeFile "./.state.tmp")

step :: [Char] -> [Char] -> IO ()
step a b = sequence_ [printArray a, writeNextArray a b]

twoStep :: [Char] -> [Char] -> IO ()
twoStep a b = sequence_ [step a b, step b a]

loop :: IO ()
loop = sequence_ $ cycle [twoStep "./.state.tmp" "./.state2.tmp"]

main :: IO ()
main = sequence_ [initialize, loop]

