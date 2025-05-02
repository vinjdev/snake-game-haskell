module Game.State where

data Direction = U | D | L | R deriving (Eq)

type Position = (Int,Int)

data Snake = Snake
    {
        body :: [Position],
        dir :: Direction
    }

data GameState = GameState
    {
        snake :: Snake,
        food :: Position
        --score :: Int,
        --gameOver :: Bool
    } 

initState :: GameState
initState = GameState
    {
        snake = Snake { body = [(10,10),(9,10),(8,10)],dir = R },
        food = (17,6)
    }
