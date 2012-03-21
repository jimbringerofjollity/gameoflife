import System.IO
import System ( getArgs )
import Data.Char

zeroOne :: Char -> Int
zeroOne c = (ord c) `mod` 2

intRow :: Int -> [Char] -> [Int]
intRow n a = map zeroOne (take n a)

intArray :: Int -> Int -> [Char] -> IO ()
intArray m n a = (putStrLn . show) [intRow n (drop (i*n) a) | i <- [0..(m-1)]]

generate :: [[Char]] -> IO ()
generate a = getContents >>= intArray (read (a !! 0)) (read (a !! 1))

main :: IO ()
main = sequence_ [hSetEncoding stdin latin1, getArgs >>= generate]

