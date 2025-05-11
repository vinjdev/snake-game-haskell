module Game.Logic.LogicMultiplayer (
    updateMultiplayer
) where

import Game.State
import Game.Logic.LogicUtils
import Utils.Utils

updateMultiplayer :: Float -> GameStateMulti -> IO (GameStateMulti)
updateMultiplayer _ gs
    -- Game over Condition
    | gameOverCond gs = pure gs
    -- collision p1 with wall
    | collisionWithWall newHead1 = do
        putStrLn "Player 2 Won:"
        putStrLn "Player 1: Collision with wall"
        pure gs { gameOverCond = True }
    -- collision p2 with wall
    | collisionWithWall newHead2 = do
        putStrLn "Player 1 Won:"
        putStrLn "Player 2: Collision with wall"
        pure gs { gameOverCond = True }
    -- collision p1 with self
    | collisionWithSelf newHead1 (body s1) = do
        putStrLn "Player 2 Won"
        putStrLn "Player 1: Collision with self"
        pure gs { gameOverCond = True }
    -- collision p2 with self
    | collisionWithSelf newHead2 (body s2) = do
        putStrLn "Player 1 Won"
        putStrLn "Player 2: Collision with self"
        pure gs { gameOverCond = True }
    -- collision p1 with p2
    | collisionWithSelf newHead1 (body s2) = do
        putStrLn "Player 2 Won"
        putStrLn "Player 1: Collision with player 2"
        pure gs { gameOverCond = True }
    -- collision p2 with p1
    | collisionWithSelf newHead2 (body s1) = do
        putStrLn "Player 1 Won"
        putStrLn "Player 2: Collision with player 1"
        pure gs { gameOverCond = True }
    | otherwise = do
        newFood <- if eating1 || eating2 then randomIntTuple else pure (foodMulti gs)

        pure GameStateMulti {
            snake1 = if eating1 then growSnake s1 else move s1,
            snake2 = if eating2 then growSnake s2 else move s2,
            foodMulti = newFood,
            score1 = score1 gs + if eating1 then 1 else 0,
            score2 = score2 gs + if eating2 then 1 else 0,
            gameOverCond = gameOverCond gs
        }

    where
        s1 = snake1 gs
        s2 = snake2 gs
        newHead1 = nextHeadPos (dir s1) (head $ body s1)
        newHead2 = nextHeadPos (dir s2) (head $ body s2)
        eating1 = newHead1 == foodMulti gs
        eating2 = newHead2 == foodMulti gs

