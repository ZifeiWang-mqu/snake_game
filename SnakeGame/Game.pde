class Game {
  final int START = 0;
  final int RUNNING = 1;
  final int GAME_OVER = 2;
  final int GAME_CLEAR = 3;

  PApplet app;
  Snake snake;
  int targetApples;
  int state;

  Game(PApplet app, Snake snake, int targetApples) {
    this.app = app;
    this.snake = snake;
    this.targetApples = targetApples;
    this.state = START;
  }

  void start() {
    state = RUNNING;
  }

  void setGameOver() {
    state = GAME_OVER;
  }

  void setGameClear() {
    state = GAME_CLEAR;
  }

  boolean isStartScreen() {
    return state == START;
  }

  boolean isRunning() {
    return state == RUNNING;
  }

  boolean isGameOver() {
    return state == GAME_OVER;
  }

  boolean isGameClear() {
    return state == GAME_CLEAR;
  }

  void showStartScreen() {
    app.background(255, 200, 0);
    drawGrid(BOARD_X, BOARD_Y, GRID_COLS, GRID_ROWS, GRID_SIZE);
    drawMessageBox();

    app.textAlign(PApplet.CENTER);
    app.fill(0);
    app.textSize(30);
    app.text("WELCOME TO SNAKE", app.width / 2, 250);

    app.textSize(24);
    app.text("Use arrow keys to move.", app.width / 2, 320);
    app.text("Eat " + targetApples + " apples to win.", app.width / 2, 365);
    app.text("Press SHIFT to start.", app.width / 2, 455);
  }

  void showGameOver() {
    app.background(255, 200, 0);
    drawGrid(BOARD_X, BOARD_Y, GRID_COLS, GRID_ROWS, GRID_SIZE);
    drawMessageBox();

    app.textAlign(PApplet.CENTER);
    app.fill(0);
    app.textSize(32);
    app.text("Game Over", app.width / 2, 300);

    app.textSize(28);
    app.text("Score: " + snake.getApplesEaten(), app.width / 2, 370);
    app.text("Press SHIFT to restart.", app.width / 2, 455);
  }

  void showGameClear() {
    app.background(255, 200, 0);
    drawGrid(BOARD_X, BOARD_Y, GRID_COLS, GRID_ROWS, GRID_SIZE);
    drawMessageBox();

    app.textAlign(PApplet.CENTER);
    app.fill(0);
    app.textSize(28);
    app.text("CONGRATULATIONS!", app.width / 2, 290);
    app.text("You won.", app.width / 2, 335);

    app.textSize(26);
    app.text("Score: " + snake.getApplesEaten(), app.width / 2, 400);
    app.text("Press SHIFT to restart.", app.width / 2, 470);
  }

  void drawGrid(int boardX, int boardY, int gridCols, int gridRows, int gridSize) {
    app.noStroke();
    app.fill(100, 250, 50);
    app.rect(boardX, boardY, gridCols * gridSize, gridRows * gridSize);

    for (int i = 0; i < gridCols; i++) {
      for (int j = 0; j < gridRows; j++) {
        if ((i + j) % 2 == 0) {
          app.fill(255);
        } else {
          app.fill(150, 250, 150);
        }
        app.rect(boardX + gridSize * i, boardY + gridSize * j, gridSize, gridSize);
      }
    }
  }

  void drawScore() {
    app.noStroke();
    app.fill(255, 200, 0);
    app.rect(0, 0, 140, 55);

    app.fill(255, 0, 0);
    app.ellipseMode(PApplet.CORNER);
    app.ellipse(10, 15, 40, 40);

    app.fill(0);
    app.rect(29, 30, 5, -30);

    app.textAlign(PApplet.LEFT);
    app.textSize(30);
    app.text("X" + snake.getApplesEaten(), 70, 48);
  }

  private void drawMessageBox() {
    app.fill(255);
    app.stroke(0);
    app.strokeWeight(2);
    app.rect(200, 200, 400, 400);
    app.noStroke();
  }
}
