// Snake Game in Processing
// Main sketch file. Open this file from the SnakeGame folder in Processing.

final int CANVAS_WIDTH = 800;
final int CANVAS_HEIGHT = 800;

final int GRID_SIZE = 40;
final int GRID_COLS = 19;
final int GRID_ROWS = 18;
final int BOARD_X = 20;
final int BOARD_Y = 60;

final int TARGET_APPLES = 10;
final int FRAME_RATE = 7;

Snake snake;
Food food;
Game game;

void setup() {
  size(800, 800);
  frameRate(FRAME_RATE);

  snake = new Snake(randomGridX(), randomGridY(), GRID_SIZE, GRID_COLS * GRID_ROWS);
  food = new Food(GRID_SIZE, BOARD_X, BOARD_Y, GRID_COLS, GRID_ROWS);
  game = new Game(this, snake, TARGET_APPLES);

  resetGame();
  game.showStartScreen();
}

void draw() {
  if (game.isStartScreen()) {
    game.showStartScreen();
    return;
  }

  if (game.isRunning()) {
    runGame();
    return;
  }

  if (game.isGameOver()) {
    game.showGameOver();
    return;
  }

  if (game.isGameClear()) {
    game.showGameClear();
  }
}

void runGame() {
  background(255, 200, 0);
  game.drawGrid(BOARD_X, BOARD_Y, GRID_COLS, GRID_ROWS, GRID_SIZE);

  food.draw(this);
  snake.move();
  snake.draw(this);
  game.drawScore();

  if (snake.isCollidingWith(food)) {
    snake.grow();
    food.relocate(snake);
  }

  if (snake.isOutOfBounds(BOARD_X, BOARD_Y, GRID_COLS, GRID_ROWS) || snake.isCollidingWithItself()) {
    game.setGameOver();
  }

  if (snake.getApplesEaten() >= TARGET_APPLES) {
    game.setGameClear();
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    snake.setDirection('L');
  } else if (keyCode == RIGHT) {
    snake.setDirection('R');
  } else if (keyCode == UP) {
    snake.setDirection('U');
  } else if (keyCode == DOWN) {
    snake.setDirection('D');
  } else if (keyCode == SHIFT) {
    if (game.isStartScreen() || game.isGameOver() || game.isGameClear()) {
      resetGame();
      game.start();
    }
  }
}

void resetGame() {
  snake.reset(randomGridX(), randomGridY());
  food.relocate(snake);
}

int randomGridX() {
  return BOARD_X + ((int)random(GRID_COLS) * GRID_SIZE);
}

int randomGridY() {
  return BOARD_Y + ((int)random(GRID_ROWS) * GRID_SIZE);
}
