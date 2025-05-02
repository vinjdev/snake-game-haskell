module UI.Draw (
    drawSnake,
    drawFood
) where

import Graphics.Gloss
import Game.State
import Game.Consts (cellSize)


-- Render object
drawCell :: Color -> Position -> Picture
drawCell c (x,y) = 
        translate newX newY $
        color c $
        rectangleSolid size size
    where
        size = fromIntegral cellSize
        newX = fromIntegral (x*cellSize - width `div` 2 + cellSize `div` 2)
        newY = fromIntegral (y*cellSize - height `div` 2 + cellSize `div` 2)


-- Draw food
drawFood :: Position -> Picture
drawFood = drawCell red

-- Draw snake
drawSnake :: Position -> Picture
drawSnake = drawCell green
