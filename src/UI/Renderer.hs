module UI.Renderer (
    runGame 
) where

import Graphics.Gloss.Interface.IO.Game
import UI.Draw
import Game.State
import Game.Input
import Game.Logic.Logic
import Game.Consts

-- initilize window
window :: Display
window = InWindow "test" (width,height) (offset+800,offset)

-- Game loop
runGame :: IO ()
runGame = do
    putStrLn "Launching Snake Game"
    let initWorld = World Menu 
    playIO window bg fps initWorld drawWorld handleInputWorld updateWorld

