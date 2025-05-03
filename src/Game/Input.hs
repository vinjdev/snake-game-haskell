module Game.Input (
    handleInput
) where

import Game.State
import Graphics.Gloss.Interface.Pure.Game

-- Input events
handleInput :: Event -> GameState -> IO (GameState)
handleInput (EventKey key Down _ _) gs =
    pure $ 
    gs { snake = changeDir (snake gs) key }
handleInput _ gs = pure gs

-- Rules for changing direction
changeDir :: Snake -> Key -> Snake
changeDir s key = case key of
    
    -- Arrows
    SpecialKey KeyUp    -> if dir s /= D then s { dir = U } else s
    SpecialKey KeyDown  -> if dir s /= U then s { dir = D } else s
    SpecialKey KeyLeft  -> if dir s /= R then s { dir = L } else s
    SpecialKey KeyRight -> if dir s /= L then s { dir = R } else s

    Char 'w' -> if dir s /= D then s { dir = U } else s
    Char 's' -> if dir s /= U then s { dir = D } else s
    Char 'a' -> if dir s /= R then s { dir = L } else s
    Char 'd' -> if dir s /= L then s { dir = R } else s

    _        -> s
