class Snake {
  int[] x;
  int[] y;
  int length;
  int gridSize;
  char direction;
  int maxLength;

  Snake(int startX, int startY, int gridSize, int maxLength) {
    this.gridSize = gridSize;
    this.maxLength = maxLength;
    this.x = new int[maxLength];
    this.y = new int[maxLength];
    reset(startX, startY);
  }

  void reset(int startX, int startY) {
    length = 1;
    x[0] = startX;
    y[0] = startY;
    direction = 'R';
  }

  void move() {
    for (int i = length - 1; i > 0; i--) {
      x[i] = x[i - 1];
      y[i] = y[i - 1];
    }

    switch (direction) {
      case 'L':
        x[0] -= gridSize;
        break;
      case 'R':
        x[0] += gridSize;
        break;
      case 'U':
        y[0] -= gridSize;
        break;
      case 'D':
        y[0] += gridSize;
        break;
    }
  }

  void draw(PApplet app) {
    app.pushMatrix();
    app.translate(x[0] + gridSize / 2, y[0] + gridSize / 2);
    app.rotate(getRotationAngle(direction));
    drawHead(app, -gridSize / 2, -gridSize / 2, gridSize);
    app.popMatrix();

    for (int i = 1; i < length; i++) {
      drawBody(app, x[i], y[i], gridSize);
    }
  }

  boolean isCollidingWith(Food food) {
    return x[0] == food.x && y[0] == food.y;
  }

  boolean isOutOfBounds(int boardX, int boardY, int gridCols, int gridRows) {
    int boardRight = boardX + gridCols * gridSize;
    int boardBottom = boardY + gridRows * gridSize;

    return x[0] < boardX || x[0] >= boardRight || y[0] < boardY || y[0] >= boardBottom;
  }

  boolean isCollidingWithItself() {
    for (int i = 1; i < length; i++) {
      if (x[0] == x[i] && y[0] == y[i]) {
        return true;
      }
    }
    return false;
  }

  void grow() {
    if (length < maxLength) {
      length++;
    }
  }

  void setDirection(char newDirection) {
    if ((direction == 'L' && newDirection == 'R') ||
        (direction == 'R' && newDirection == 'L') ||
        (direction == 'U' && newDirection == 'D') ||
        (direction == 'D' && newDirection == 'U')) {
      return;
    }

    direction = newDirection;
  }

  int getLength() {
    return length;
  }

  int getApplesEaten() {
    return length - 1;
  }

  float getRotationAngle(char direction) {
    switch (direction) {
      case 'L':
        return PI;
      case 'R':
        return 0;
      case 'U':
        return -PI / 2;
      case 'D':
        return PI / 2;
      default:
        return 0;
    }
  }

  void drawHead(PApplet app, float a, float b, int size) {
    app.noStroke();

    app.fill(255, 0, 0);
    app.rect(a + size / 2, b + size * 0.45, size * 0.75, size * 0.10);

    app.fill(#378EAF);
    app.ellipseMode(PApplet.CORNER);
    app.ellipse(a, b, size, size);

    app.fill(255);
    app.ellipse(a + size * 0.43, b + size * 0.63, size * 0.15, size * 0.15);
    app.ellipse(a + size * 0.43, b + size * 0.23, size * 0.15, size * 0.15);
  }

  void drawBody(PApplet app, float a, float b, int size) {
    app.fill(#378EAF);
    app.noStroke();
    app.ellipseMode(PApplet.CORNER);
    app.ellipse(a, b, size, size);
  }
}
