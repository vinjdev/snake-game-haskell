module Game.Input (
    handleInputWorld
) where

import Game.State
import Graphics.Gloss.Interface.Pure.Game

-- Input events
handleInputWorld :: Event -> World -> IO (World)
handleInputWorld (EventKey (Char '1') Down _ _ ) (World Menu) = do
    gs <- initState
    pure $ World (SinglePlayer gs)

handleInputWorld (EventKey (Char '2') Down _ _ ) (World Menu) = do
    gs <- initState
    pure $ World (MultiPlayer gs)

handleInputWorld (EventKey (Char 'r') Down _ _ ) (World (SinglePlayer gs))
    | gameOver gs = do
        newGs <- initState
        pure $ World (SinglePlayer newGs)

handleInputWorld (EventKey (Char 'r') Down _ _ ) (World (MultiPlayer gs))
    | gameOver gs = do
        newGs <- initState
        pure $ World (MultiPlayer newGs)

handleInputWorld e (World (SinglePlayer gs)) = do
    let newSnake = changeDir (snake gs) e
    pure $ World (SinglePlayer gs { snake = newSnake })

handleInputWorld e (World (MultiPlayer gs)) = do
    let newSnake = changeDir (snake gs) e
    pure $ World (MultiPlayer gs { snake = newSnake })

handleInputWorld _ w = pure w

-- Rules for changing direction
changeDir :: Snake -> Event -> Snake
changeDir s key = case key of
    
    -- Arrows
    EventKey (SpecialKey KeyUp) Down _ _  -> if dir s /= D then s { dir = U } else s
    EventKey (SpecialKey KeyDown) Down _ _  -> if dir s /= U then s { dir = D } else s
    EventKey (SpecialKey KeyLeft) Down _ _ -> if dir s /= R then s { dir = L } else s
    EventKey (SpecialKey KeyRight) Down _ _ -> if dir s /= L then s { dir = R } else s

    EventKey (Char 'w') Down _ _ -> if dir s /= D then s { dir = U } else s
    EventKey (Char 's') Down _ _ -> if dir s /= U then s { dir = D } else s
    EventKey (Char 'd') Down _ _ -> if dir s /= R then s { dir = L } else s
    EventKey (Char 'a') Down _ _ -> if dir s /= L then s { dir = R } else s

    _        -> s
