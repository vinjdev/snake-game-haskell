module Game.Logic (
    updateGame
) where

import Game.State

updateGame :: Float -> GameState -> GameState
updateGame _ gs = gs { snake = move (snake gs) }

move :: Snake -> Snake
move s = s { body = newHead : init (body s) }
    where
        (x,y) = head (body s)
        newHead = case dir s of
            U -> (x,y + 1)
            D -> (x,y - 1)
            L -> (x - 1,y)
            R -> (x + 1,y)
