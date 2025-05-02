module UI.Renderer (
    runGame 
) where

import Graphics.Gloss
import UI.Draw
import Game.State
import Game.Input
import Game.Logic
import Game.Consts


-- initilize window
window :: Display
window = InWindow "test" (width,height) (offset,offset)

-- Background color
bg :: Color
bg = black

-- Frames per second
fps :: Int
fps = 10

-- Draw all game objects
drawGame :: GameState -> Picture
drawGame gs = 
    pictures $
        drawFood (food gs) : map drawSnake (body $ snake gs)

-- Game loop
runGame :: IO ()
runGame = play window bg fps initState drawGame handleInput updateGame

