module Game.Logic.Logic (
    updateWorld
) where

import Game.State
import Game.Logic.LogicSinglePlayer
import Game.Logic.LogicMultiplayer

updateWorld :: Float -> World -> IO (World)
updateWorld _ (World Menu) = pure $ World Menu

updateWorld dt (World (OverMenu t))
    | t <= 0 = pure $ World Menu
    | otherwise = pure $ World (OverMenu (t - dt))

updateWorld dt (World (SinglePlayer gs)) = do
    updated <- updateGame dt gs
    if gameOver updated
        then pure $ World (OverMenu 2.0)
        else pure $ World (SinglePlayer updated)

updateWorld dt (World (MultiPlayer gs)) = do
    updated <- updateMultiplayer dt gs
    if gameOverCond updated
        then pure $ World (OverMenu 2.0)
        else pure $ World (MultiPlayer updated)








