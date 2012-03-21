import System.IO
import System ( getArgs )
import Data.Char

zeroOne :: Char -> Int
zeroOne c = (ord c) `mod` 2

binaryRow :: Int -> [Char] -> [Int]
binaryRow n a = map zeroOne (take n a)

binaryArray :: Int -> Int -> [Char] -> IO ()
binaryArray m n a = (putStrLn . show) [binaryRow n (drop (i*n) a) | i <- [0..(m-1)]]

generate :: [[Char]] -> IO ()
generate a = getContents >>= binaryArray (read (a !! 0)) (read (a !! 1))

main :: IO ()
main = sequence_ [hSetEncoding stdin latin1, getArgs >>= generate]

