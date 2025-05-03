module Utils.RandomPos (
    randomIntTuple
) where

import System.Random

randomIntTuple :: IO (Int,Int)
randomIntTuple = do
    x <- randomRIO (0,19)
    y <- randomRIO (0,19)
    return (x,y)
