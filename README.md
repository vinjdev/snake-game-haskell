# snake-game

## Core Functionality
- 20 x 20 game grid
- snake movement (wasd or arrows)
- Random food position
- score tracking
- Collision detection:
    - Self-collision
    - wall collision
- visual game display with Gloss
- "Game Over" screen and a restart option

## Single Player
- Starts with 3 segments
- Continuous movement in current direction
- snake grows when eating
- Score increases when eating
- Food spawns in random cells
- Game ends on self or wall collision

## Two Player 
- Two snakes different colors
    - Player 1 (Arrows)
    - Player 2 (WASD)
- Same food and score logic as above, for both
- Score traced individually
- Winner announced in terminal


## Project structure
```bash
.
├── app/                   -- Main application entry
│   └── Main.hs
├── src/
│   ├── Game/              -- Core game mechanics
│   │   ├── Consts.hs      -- Constants and configuration
│   │   ├── Input.hs       -- Input handling (WASD/Arrows)
│   │   └── Logic/         -- Functional game logic
│   │       ├── Logic.hs
│   │       ├── LogicSinglePlayer.hs
│   │       ├── LogicMultiplayer.hs
│   │       └── LogicUtils.hs
│   ├── UI/                -- Drawing and rendering
│   │   ├── Draw.hs
│   │   └── Renderer.hs
│   └── Utils/             -- Shared utilities
│       └── Utils.hs
├── test/                  -- Test suite
│   └── Spec.hs
```

## Tech stack
- Language: `Haskell`
- Framework: `Gloss` - 2D vector graphics library
- Build tool: `Stack`

## Build and run
```bash
stack build
stack run
```
