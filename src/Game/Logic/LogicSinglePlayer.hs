module Game.Logic.LogicSinglePlayer (
    updateGame
) where

import Game.State
import Game.Logic.LogicUtils
import Utils.Utils

updateGame :: Float -> GameState -> IO (GameState)
updateGame _ gs
    | gameOver gs = pure gs
    | collisionWithSelf newHead (body oldSnake) = do
        putStrLn "Game Over:"
        putStrLn "Collision with body"
        pure gs { gameOver = True }
    | collisionWithWall newHead = do
        putStrLn "Game Over:"
        putStrLn "Collision with wall"
        pure gs { gameOver = True }
    | otherwise = if eating 
                  then do
                      randFood <- randomIntTuple
                      let newGS = gs { snake = growSnake oldSnake, 
                                       food = randFood,
                                       score = (score gs) + 1 }
                      putStrLn ("New score: " ++ show (score newGS))
                      pure newGS
                  else pure gs { snake = move oldSnake }
                                
    where
        oldSnake = snake gs
        newHead = nextHeadPos (dir oldSnake) (head $ body oldSnake)
        eating = newHead == food gs
