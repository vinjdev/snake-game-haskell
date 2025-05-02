module UI.Renderer (
    runGame 
) where

import Graphics.Gloss
import UI.Draw
import Game.State
import Game.Input
import Game.Logic

width, height, offset :: Int
width = 600
height = 600
offset = 100

window :: Display
window = InWindow "test" (width,height) (offset,offset)

bg :: Color
bg = black

fps :: Int
fps = 10

drawGame :: GameState -> Picture
drawGame gs = 
    pictures $
        drawFood (food gs) : map drawCell (body $ snake gs)

runGame :: IO ()
runGame = play window bg fps initState drawGame handleInput updateGame

