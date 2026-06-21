# Snake Game in Processing

A classic grid-based Snake game implemented in Processing.

## Overview

The player controls the snake using the arrow keys, eats apples to increase the score, and wins after collecting 10 apples. The game includes a start screen, game-over screen, game-clear screen, collision detection, and restart flow.

## Improvements in this version

This version refactors the original implementation for better readability and portfolio presentation.

- Replaced multiple boolean flags with a single game-state variable.
- Removed the unused `initialLength` parameter.
- Fixed the mismatch between the instruction text and the actual win condition.
- Repositions food when restarting the game.
- Centralized board size, grid size, and target score as constants.
- Moved score drawing into the `Game` class.
- Standardized Processing drawing calls through `PApplet app` inside classes.
- Increased snake capacity based on the board size.

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

## Tech stack

- Processing
- Java-like object-oriented programming
