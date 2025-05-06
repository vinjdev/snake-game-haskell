module Game.Logic.LogicUtils (
    move, 
    growSnake,
    nextHeadPos,
    collisionWithWall,
    collisionWithSelf
) where

import Game.State
import Utils.Utils

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
