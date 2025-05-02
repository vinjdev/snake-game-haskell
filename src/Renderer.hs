module Renderer (
    runGame 
) where

import Graphics.Gloss

width, height, offset :: Int
width = 600
height = 600
offset = 100

window :: Display
window = InWindow "test" (width,height) (offset,offset)

bg :: Color
bg = black

drawing :: Picture
drawing = pictures [ color red $ circleSolid 30, rectangleSolid 10 50]

runGame :: IO ()
runGame = display window bg drawing

