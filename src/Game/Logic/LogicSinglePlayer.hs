module Game.Logic.LogicSinglePlayer (
    updateGame
) where

import Game.State
import Game.Logic.LogicUtils
import Utils.Utils

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
