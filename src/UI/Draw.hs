module UI.Draw where

import Graphics.Gloss
import Game.State

cellSize :: Int
cellSize = 20

drawCell :: Position -> Picture
drawCell (x,y) = 
    translate (fromIntegral (x * cellSize - 200)) 
              (fromIntegral (y * cellSize - 200)) $ 
    color green $ 
    rectangleSolid (fromIntegral cellSize) (fromIntegral cellSize)

drawFood :: Position -> Picture
drawFood (x,y) = 
    translate (fromIntegral (x * cellSize - 200)) 
              (fromIntegral (y * cellSize - 200)) $ 
    color red $ 
    rectangleSolid (fromIntegral cellSize) (fromIntegral cellSize)
