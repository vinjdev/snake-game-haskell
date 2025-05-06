module Utils.Utils (
    randomIntTuple,
    safeHead
) where

import System.Random

randomIntTuple :: IO (Int,Int)
randomIntTuple = do
    x <- randomRIO (0,19)
    y <- randomRIO (0,19)
    return (x,y)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x
