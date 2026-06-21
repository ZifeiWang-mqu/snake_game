# Snake Game in Processing

A classic grid-based Snake game implemented in Processing.

## Overview

The player controls the snake using the arrow keys, eats apples to increase the score, and wins after collecting 10 apples. The game includes a start screen, game-over screen, game-clear screen, collision detection, and restart flow.


## Controls

- Arrow keys: Move the snake
- Shift: Start or restart the game

## Project structure

```text
SnakeGame/
├── SnakeGame.pde
├── Snake.pde
├── Food.pde
└── Game.pde
```

## Class design

- `Snake`: Handles movement, growth, drawing, and collision checks.
- `Food`: Handles apple placement and rendering.
- `Game`: Handles game state, screens, score display, and grid drawing.

## How to run

1. Install Processing.
2. Open the `SnakeGame/` folder in Processing.
3. Open `SnakeGame.pde`.
4. Click the Run button.

## required application for excution

- Processing(4.1.1)

