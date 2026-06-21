class Food {
  int x;
  int y;
  int gridSize;
  int boardX;
  int boardY;
  int gridCols;
  int gridRows;

  Food(int gridSize, int boardX, int boardY, int gridCols, int gridRows) {
    this.gridSize = gridSize;
    this.boardX = boardX;
    this.boardY = boardY;
    this.gridCols = gridCols;
    this.gridRows = gridRows;
  }

  void draw(PApplet app) {
    app.noStroke();

    app.fill(255, 0, 0);
    app.ellipseMode(PApplet.CORNER);
    app.ellipse(x, y, gridSize, gridSize);

    app.fill(0);
    app.rect(x + gridSize * 0.48, y + gridSize * 0.38, gridSize * 0.12, -gridSize * 0.75);
  }

  void relocate(Snake snake) {
    do {
      x = boardX + ((int)random(gridCols) * gridSize);
      y = boardY + ((int)random(gridRows) * gridSize);
    } while (snake != null && isOverlappingWithSnake(snake));
  }

  private boolean isOverlappingWithSnake(Snake snake) {
    for (int i = 0; i < snake.getLength(); i++) {
      if (x == snake.x[i] && y == snake.y[i]) {
        return true;
      }
    }
    return false;
  }
}
