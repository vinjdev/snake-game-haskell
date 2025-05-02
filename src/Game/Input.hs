module Game.Input (
    handleInput
) where

import Game.State
import Graphics.Gloss.Interface.Pure.Game

-- Input events
handleInput :: Event -> GameState -> GameState
handleInput (EventKey (SpecialKey key) Down _ _) gs =
    gs { snake = changeDir (snake gs) key }
handleInput _ gs = gs

-- Rules for changing direction
changeDir :: Snake -> SpecialKey -> Snake
changeDir s key = case key of
    KeyUp    -> if dir s /= D then s { dir = U } else s
    KeyDown  -> if dir s /= U then s { dir = D } else s
    KeyLeft  -> if dir s /= R then s { dir = L } else s
    KeyRight -> if dir s /= L then s { dir = R } else s
    _        -> s
