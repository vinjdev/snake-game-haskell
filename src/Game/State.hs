module Game.State (
    Direction(..),
    Position,
    Snake(..),
    GameState(..),
    GameError(..),
    initState
) where

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
        --score :: Int,
        gameOver :: Bool
    } 

data GameError 
    = CollisionWall
    | CollisionSelf
    deriving (Eq)

-- Starting values for game state
initState :: GameState
initState = GameState
    {
        snake = Snake { body = [(10,10),(9,10),(8,10)], dir = R },
        food = (17,6),
        gameOver = False
    }
