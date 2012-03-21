import System.IO
import System ( getArgs )
import Data.Char

zeroOne :: Char -> Int
zeroOne c = (ord c) `mod` 2

binRow :: Int -> [Char] -> [Int]
binRow n a = map zeroOne (take n a)

binArray :: Int -> Int -> [Char] -> IO ()
binArray m n a = (putStrLn . show) [binRow n (drop (i*n) a) | i <- [0..(m-1)]]

generate :: [[Char]] -> IO ()
generate a = getContents >>= binArray (read (a !! 0)) (read (a !! 1))

main :: IO ()
main = sequence_ [hSetEncoding stdin latin1, getArgs >>= generate]

