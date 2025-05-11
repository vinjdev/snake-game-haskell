module UI.Draw (
    drawWorld,
    drawSnake,
    drawFood
) where

import Graphics.Gloss
import Game.State
import Game.Consts (cellSize,width,height)

drawWorld :: World -> IO (Picture)
drawWorld (World Menu) = pure $
    pictures
        [ translate (-160) 100  $ scale 0.3 0.3 $ color white $ text "Snake Game"
        , translate (-120) 20   $ scale 0.2 0.2 $ color green $ text "Press 1: Single Player"
        , translate (-120) (-20)$ scale 0.2 0.2 $ color blue  $ text "Press 2: Two Player"
        ]

drawWorld (World (SinglePlayer gs)) = pure $
    pictures $
        [ drawFood (food gs) ] ++ 
        map drawSnake (body $ snake gs) ++ 
        [ drawScore 250 230 (score gs) ]


drawWorld (World (MultiPlayer gs)) = pure $
    pictures $
        [drawFood (foodMulti gs)] ++ 
        map drawSnake1 (body $ snake1 gs) ++
        map drawSnake2 (body $ snake2 gs) ++
        [ drawScore 250 230 (score1 gs), drawScore (-250) 230 (score2 gs)]

drawScore :: Float -> Float -> Int -> Picture
drawScore x y s = 
    translate x y $
    scale 0.3 0.3 $ color white $ 
    text $ 
    show (s)

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

-- Draw snake 1
drawSnake1 :: Position -> Picture
drawSnake1 = drawCell green

-- Draw snake 2
drawSnake2 :: Position -> Picture
drawSnake2 = drawCell blue 
