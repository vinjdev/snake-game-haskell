module Game.Logic (
    updateGame
) where

import Game.State

updateGame :: Float -> GameState -> GameState
updateGame _ gs
    | gameOver gs = gs
    | otherwise =
        let oldSnake = snake gs
            newHead = nextHeadPos (dir oldSnake) (head $ body oldSnake)
        in if collisionWithWall newHead || collisionWithSelf newHead (body oldSnake)
            then gs { gameOver = True }
            else if newHead == food gs
                 then gs { snake = growSnake oldSnake, food = (3,3) }
                 else gs { snake = move oldSnake }

move :: Snake -> Snake
move s = s { body = newHead : init (body s) }
    where newHead = nextHeadPos (dir s) (head $ body s)

growSnake :: Snake -> Snake
growSnake s = s { body = newHead : body s }
    where newHead = nextHeadPos (dir s) (head $ body s)       

nextHeadPos :: Direction -> Position -> Position
nextHeadPos d (x,y) = case d of
    U -> (x,y+1)
    D -> (x,y-1)
    L -> (x-1,y)
    R -> (x+1,y)



collisionWithWall :: Position -> Bool
collisionWithWall (x,y) = x < 0 || y < 0 || x >= 20 || y >= 20 

collisionWithSelf :: Position -> [Position] -> Bool
collisionWithSelf headPos bodyPos = elem headPos bodyPos


