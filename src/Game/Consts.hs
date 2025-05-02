module Game.Consts (
    width,height,offset,
    gridWidth,gridHeight,
    cellSize
) where

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
