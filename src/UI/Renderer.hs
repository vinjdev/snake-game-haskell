module UI.Renderer (
    runGame 
) where

import Graphics.Gloss.Interface.IO.Game
import UI.Draw
import Game.State
import Game.Input
import Game.Logic
import Game.Consts

-- initilize window
window :: Display
window = InWindow "test" (width,height) (offset+800,offset)

-- Draw all game objects
drawGame :: GameState -> IO (Picture)
drawGame gs = 
    pure $ 
    pictures $
        drawFood (food gs) : map drawSnake (body $ snake gs)

-- Game loop
runGame :: IO ()
runGame = do
    gs <- initState
    putStrLn "Initilzing snake game"
    playIO window bg fps gs drawGame handleInput updateGame

