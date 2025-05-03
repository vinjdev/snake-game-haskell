module Game.Consts (
    width,height,offset,
    gridWidth,gridHeight,
    cellSize,
    bg,
    fps
) where

import Graphics.Gloss

-- general configs for game

-- Window configs
width, height, offset :: Int
width = 600
height = 600
offset = 100

-- Amount of rectanlges per screen size
gridWidth, gridHeight :: Int
gridWidth = 20
gridHeight = 20

-- Object size
cellSize :: Int
cellSize = width `div` gridHeight

-- Background color
bg :: Color
bg = black

-- Frames per second
fps :: Int
fps = 5
