module Game.Logic.Logic (
    updateWorld
) where

import Game.State
import Game.Logic.LogicSinglePlayer
import Game.Logic.LogicMultiplayer

updateWorld :: Float -> World -> IO (World)
updateWorld _ (World Menu) = pure $ World Menu

updateWorld dt (World (SinglePlayer gs)) = do
    updated <- updateGame dt gs
    if gameOver updated
        then pure $ World Menu
        else pure $ World (SinglePlayer updated)

updateWorld dt (World (MultiPlayer gs)) = do
    updated <- updateMultiplayer dt gs
    if gameOverCond updated
        then pure $ World Menu
        else pure $ World (MultiPlayer updated)








