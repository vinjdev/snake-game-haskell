module UI.Renderer (
    runWindow
) where

import Graphics.Gloss

screenSize :: (Int,Int)
screenSize = (1000,1000)

window :: Display
window = InWindow "Snake game" screenSize (100,30)

bgColor :: Color
bgColor = black

draw :: Picture
draw = color red $ circleSolid 50

runWindow :: IO ()
runWindow = display window bgColor draw
