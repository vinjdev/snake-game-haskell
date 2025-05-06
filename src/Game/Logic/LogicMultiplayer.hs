module Game.Logic.LogicMultiplayer (
    updateMultiplayer    
) where

import Game.State
import Game.Logic.LogicUtils
import Utils.Utils

updateMultiplayer :: Float -> GameStateMulti -> IO (GameStateMulti)
updateMultiplayer _ gs
    | gameOverCond gs = pure gs
    | otherwise = do
        let s1 = snake1 gs
            s2 = snake2 gs
            
            newHead1 = nextHeadPos (dir s1) (head $ body s1)
            newHead2 = nextHeadPos (dir s2) (head $ body s2)

            colli1 = collisionWithWall newHead1 || collisionWithSelf newHead2 (body s1) || elem newHead1 (body s2)
            colli2 = collisionWithWall newHead2 || collisionWithSelf newHead2 (body s2) || elem newHead2 (body s1)
        if colli1 || colli2
            then do
                putStrLn "Collision with self, wall or player"
                putStrLn "Game Over..."
                pure gs { gameOverCond = True }
            else do
                let eating1 = newHead1 == foodMulti gs
                    eating2 = newHead2 == foodMulti gs
                newFood <- if eating1 || eating2 then randomIntTuple else pure (foodMulti gs)
                let newS1 = if eating1 then growSnake s1 else move s1
                    newS2 = if eating2 then growSnake s2 else move s2

                pure GameStateMulti 
                    {
                        snake1 = newS1,
                        snake2 = newS2,
                        foodMulti = newFood,
                        score1 = score1 gs + if eating1 then 1 else 0,
                        score2 = score2 gs + if eating2 then 1 else 0,
                        gameOverCond = gameOverCond gs
                    }
