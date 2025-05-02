module Renderer (
    runGame 
) where

import Graphics.Gloss
import Game.State

width, height, offset :: Int
width = 600
height = 600
offset = 100

window :: Display
window = InWindow "test" (width,height) (offset,offset)

bg :: Color
bg = black

cellSize :: Int
cellSize = 20

drawCell :: Position -> Picture
drawCell (x,y) = 
    translate (fromIntegral (x * cellSize - 200)) 
              (fromIntegral (y * cellSize - 200)) $ 
    color green $ 
    rectangleSolid (fromIntegral cellSize) (fromIntegral cellSize)

drawGame :: GameState -> Picture
drawGame gs = pictures $ map drawCell (body $ snake gs)

runGame :: IO ()
runGame = display window bg (drawGame initState)

