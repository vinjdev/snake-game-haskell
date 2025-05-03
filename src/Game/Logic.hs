module Game.Logic (
    updateWorld
) where

import Game.State
import Utils.RandomPos

updateWorld :: Float -> World -> IO (World)
updateWorld _ (World Menu) = pure $ World Menu


updateWorld dt (World (SinglePlayer gs)) = do
    updated <- updateGame dt gs
    pure $ World (SinglePlayer updated)

updateWorld dt (World (MultiPlayer gs)) = do
    updated <- updateGame dt gs
    pure $ World (SinglePlayer updated)

updateGame :: Float -> GameState -> IO (GameState)
updateGame _ gs
    | gameOver gs = pure gs
    | otherwise =
        let oldSnake = snake gs
            newHead = nextHeadPos (dir oldSnake) (head $ body oldSnake)
        in if collisionWithWall newHead || collisionWithSelf newHead (body oldSnake)
            then do 
                putStrLn "Collision with self or wall"
                putStrLn "Game Over..."
                pure gs { gameOver = True }
            else if newHead == food gs
                 then do
                    randFood <- randomIntTuple
                    let newGS = gs { snake = growSnake oldSnake, 
                                     food = randFood,
                                     score = (score gs) + 1}
                    putStrLn ("New score: " ++ show (score newGS))
                    pure newGS
                 else pure gs { snake = move oldSnake }

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


