module Game.State (
    Direction(..),
    Position,
    Snake(..),
    GameState(..),
    GameStateMulti(..),
    GameMode(..),
    World(..),
    initState,
    initMultiplayer
) where

import Utils.Utils

-- Direction the snake can have
-- Up, down, left and right
data Direction = U | D | L | R deriving (Eq)

-- Position for game objects
type Position = (Int,Int)

-- Snake object
data Snake = Snake
    {
        body :: [Position],
        dir :: Direction
    }

-- Game state, contains all game objects
-- snake, food, score, gameOver
data GameState = GameState
    {
        snake :: Snake,
        food :: Position,
        score :: Int,
        gameOver :: Bool
    } 

data GameStateMulti = GameStateMulti
    {
        snake1 :: Snake,
        snake2 :: Snake,
        foodMulti :: Position,
        score1 :: Int,
        score2 :: Int,
        gameOverCond :: Bool
    } 

data GameMode 
    = Menu
    | SinglePlayer GameState
    | MultiPlayer GameStateMulti

data World = World { mode :: GameMode }

-- Starting values for game state
initState :: IO (GameState)
initState = do
    randFood <- randomIntTuple
    pure GameState
        {
            snake = Snake { body = [(10,10),(9,10),(8,10)], dir = R },
            food = randFood,
            score = 0,
            gameOver = False
        }

initMultiplayer :: IO (GameStateMulti)
initMultiplayer = do
    randFood <- randomIntTuple
    pure GameStateMulti 
        {
            snake1 = Snake { body = [(10,7),(9,7),(8,7)], dir = R },
            snake2 = Snake { body = [(8,13),(9,13),(10,13)], dir = L },
            foodMulti = randFood,
            score1 = 0,
            score2 = 0,
            gameOverCond = False
        }
