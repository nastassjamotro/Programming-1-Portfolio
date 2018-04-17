# Programming 1 Portfolio 2016-2017
## Nastassja Motro
### Programmed With Bryn Esperson and Tessa Vu
### Contact Info-email: nastassjamotro7@gmail.com
### Skyline High School
#### To View The Website: https://nastassjamotro.github.io/Programming-1-Portfolio/

Tessa Vu contributed with designing graphics for chess pieces with Adobe Illustrator and Adobe Photoshop, programming the special castling movement on the King and Rook, and programming the start menu and end menus on Processing.

Bryn Esperson contributed with programming code, specifically the Pawn piece with the special _en passant_ movement.

I contributed with programming all the basic movements of all the pieces excluding special moves, and programming code for the general parts of the game like the board and player and such.

## Our Game

We have decided to create a Chess Game using the Java Language. But we made is so that this would be runnable on the Processing app as Processing is ideal to use when dealing with graphics. This program is supposed to replicate the design of a chess game like one you would find on an app on your phone or on the computer. It's not as fancy with as many special effects as some other games but it still has many cool features.

## Basic Rules

Chess is a two player game. One person controls one set of peices (black pieces) and the other player controls the opposite set of pieces (white pieces). Players cannot switch set of pieces midgame. The goal of the game is to get the other player's King into checkmate.

### Check, Checkmate, and Stalemate

* Check - When the King of a player can be taken by a piece of the opponent, one says that the King is in check. It is not allowed to make a move, such that ones King is in check after the move.

* Checkmate - When a player is in check, and he cannot make a move such that after the move, the King is not in check, then he is mated. The player that is mated loses the game, and the player that mates him wins the game.

* Stalemate - When a player cannot make any legal move, but he is not in check, then the player is said to be stalemated. In a case of a stalemate, the game is a draw.

## Starter

The game starts off with a main menu screen. We decided to create a theme based game. The theme is Marvel vs. DC, with Marvel being the white designated set of pieces and DC being the black designated set of pieces. As soon as the game is opened, the starter menu will pop open.

**Code for Starter Menu:**

```javascript
PImage startmenu;
PFont title;
PFont description;
int screenX, screenY, stage;

void setup() {
  size(1920, 1080);
  screenX = round(width);
  screenY = round(height);
  size(screenX, screenY);  
  startmenu = loadImage("Versus.png");
  image(startmenu, 0, 0, screenX, screenY);
  title = createFont("Anurati-Regular", 80, true);
  description = createFont("Anurati-Regular", 30, true);
}

void draw() {
  textAlight(CENTER);
  textFont(title);
  text("CHESS: DC v. MARVEL", width/2, 400);
  textFont(description);
  text("PRESS ANY KEY TO START THE GAME", width/2, 450);
  }
``` 

### This is what the start menu would look like:

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/versus.png "Logo Title Text 1")

## Game

In Chess, the white set (in this case the marvel pieces) is always first to move. Movement is required every round. A player may not opt to skip his or her turn ever.

**Code For Main Chess Game Entry Point:**

```javascript
public class Chess {
  public static void main(String[] args) {
    private Board board = new Board();
    private Player marvel;
    private Player dc;
    public Chess() {
      super();
    }
    
    public void setColorMarvel(Player player) {
      this.marvel = player;
    }
    public void setColorDc(Player player) {
      this.dc = player;
    }
    public Board getBoard() {
      return board;
    }
    public void setBoard(Board board) {
      this.board = board;
    }
    public Player getMarvel() {
      return marvel;
    }
    public void setMarvel(Player marvel) {
      this.marvel = marvel;
    }
    public Player getDc() {
      return dc;    
    }
    public void SetDc(Player dc) {
      this.dc = dc;
    }
    
    public boolean initializeBoardGivenPlayer() {
      if(this.dc == null || this.marvel == null) {
        return false;
      }
      this.board = new Board();
      for(int i=0; i<dc.getPieces().size(); i++) {
        board.getSpot(dc.getPieces().get(i).getX(), dc.getPieces().get(i).getY()).occupySpot(dc.getPieces().get(i));
      }
      return true;
    }
  }
}
```

## Playing Screen

#### When the actual playing screen loads it would look something like this:

  The first is an example of the mockup using the actual pictures of the characters.
  
![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/figuresmockup.png "Logo Title Text 1")

  But the game will actually utilize the logos of each of the characters as seen below.
  
![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/logosmockup.png "Logo Title Text 1")

### Board

A chessboard is a type of checkerboard. It consists of 64 squares (eight rows and eight columns). The squares are arranged in two alternating colors (light and dark).

**Code for Board:**

```javascript
public class Board {
  private Spot[][] spots = new Spot[8][8];
  public Board() {
    super();
    for(int i=0; i<spots.length; i++) {
      for(int j=0; j<spots.length; j++) {
        this.spots[i][j] = new Spots(i, j);
      }
    }
  }
  public Spot getSpot(int x, int y) {
    return spots[x][y];
  }
}
```

### Spot

Pieces other than pawns capture in the same way they move. A capturing peice replaces the opponent's piece on its square, except for an _en passant_ capture. Captured pieces are immediately removed from the game. A square may hold ony one piece at any given time. 

**Code for Spot:**

```javascript
apublic class Spot {
  int x, y;
  Piece piece;
  
  public Spot(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    piece = null;
  }
  
  public void occupySpot(Piece piece) {
    //if there's already a piece there, delete it (taking away the piece)
    if(this.piece != null) {
      this.piece.setAvailable(false);
    }
    //place piece there
    this.piece = piece;
  }
  public boolean isOccupied() {
    if(piece != null) {
      return true;
    }
    return false;
  }
  
  public Piece releasedSpot() {
    Piece releasedPiece = this.piece;
    this.piece = null;
    return releasedPiece;
  }
}
```

## Players

Chess involves two players. Players take turns alternating moving one piece at a time (except in the case of the castle maneuver).

**Code for Player:**

```javascript
public class Player {
  public final int PAWNS = 8;
  public final int BISHOPS = 2;
  public final int ROOKS = 2;
  public final int KNIGHTS = 2;
  public boolean marvel;
  
  private List<Piece> pieces = new ArrayList<>();
  
  public Player(boolean marvel) {
    super();
    this.marvel = marvel;
  }
  
  public List<Piece> getPieces() {
    return pieces;
  }
  
  public void initializePieces() {
    if(this.marvel == true) {
      for(int i=0; i<PAWNS; i++) { // draw pawns
        pieces.add(new Pawn(true, i, 2));
      } 
      pieces.add(new Rook(true, 0, 0));
      pieces.add(new Rook(true, 7, 0));
      pieces.add(new Bishop(true, 2, 0));
      pieces.add(new Bishop(true, 5, 0));
      pieces.add(new Knight(true, 1, 0));
      pieces.add(new Knight(true, 6, 0));
      pieces.add(new Queen(true, 3, 0));
      pieces.add(new King(true, 4, 0));
    } else {
      for(int i=0; i<PAWNS; i++) { // draw pawns
        pieces.add(new Pawn(true, i, 6));
      }
      pieces.add(new Rook(true, 0, 7));
      pieces.add(new Rook(true, 7, 7));
      pieces.add(new Bishop(true, 2, 7));
      pieces.add(new Bishop(true, 5, 7));
      pieces.add(new Knight(true, 1, 7));
      pieces.add(new Knight(true, 6, 7));
      pieces.add(new Queen(true, 3, 7));
      pieces.add(new King(true, 4, 7));
    }
  }
}
```

## Piece

All the separate chess piece classes in this game use inheritance from the super class Piece below. There are a total of sixteen pieces per player: one King, one Queen, two Bishops, two Knights, two Rooks, and eight Pawns. Each player controls their own set and may not play or use the other player's set.

**Code for Main Piece Class:**

```javascript
public abstract class Piece {
  private boolean available;
  private int x;
  private int y;
  
  public Piece(boolean available, int x, int y) {
    super();
    this.available = available;
    this.x = x;
    this.y = y;
  }
  
  public abstract boolean isAvailable() {
    return available;
  }
  public void setAvailable(boolean available) {
    this.available = available;
  }
  public abstract int getX() {
    return x;
  }
  public void setX(int x) {
    this.x = x;
  }
  public abstract int getY() {
    return y;
  }
  pubic void setY(int y) {
    this.y = y;
  }
  
  public abstract boolean isValid(Board board, int fromX, int fromY, int toX, int toY) {
    if(toX == fromX && toY == fromY) {
      return false; //move nothing
    }
    if(toX < 0 || toX > 7 || fromX < 0 || fromX > 7 || toY < 0 || toY > 7 || fromY < 0 || fromY > 7) {
      return false;
    }
    return true;
  }
}
```

### The Characters on the DC (black) side are:

* Martian Manhunter - as the king

* Wonder Woman - as the queen

* SuperGirl - as the bishop

* Batman - as the knight

* Superman - as the rook

* Flash - as the pawn

### The Characters on the Marvel (white) side are:

* Captain America - as the king

* Captain Marvel - as the queen

* Black Widow - as the bishop

* Wolverine - as the knight

* Iron Man - as the rook

* Hawkeye - as the pawn

## Here are the rules for the pieces:

* King - The King moves only one square in any direction: horizontally, vertically, or diagonally. The King can do a special move called castling but it may only be done with the use of the rook. The King is the most important piece of the game, and moves must be made in such a way that the king is never in check. If in check, the king must move and not any other piece.

* Queen - The Queen has combined moves of the rook and bishop so i.e. it can move horizontally, diagonally, and vertically.

* Bishop - The Bishop moves diagonally and only on the color it starts off on. It may not jump over pieces.

* Knight - The Knight makes a move that consists of first one step in a horizontal or vertical direction, and then one step diagonally in an outward direction.

* Rook - The Rook moves in a straight line, whether it's horizontal movement or vertical. It cannot move diagonally.

* Pawn - The Pawn moves differently regarding whether it moves to an empty square or wheter it takes a piece of the opponent. When a Pawn does not take, it moves one square forward. When the Pawn has not moved at all, i.e., the Pawn is still at the second row (from the owning player's view), the Pawn may make a double step straight forward. When taking, a pawn goes one square diagonally forward.

### Special Moves:

#### Castling - Under certain, special rules, a King and Rook can move simultaniously in a castling move. The following conditions must be met:

- The King that makes the castling move has not yet moved in the game.
  
- The Rook that makes the castling move has not yet moved in the game.

- The King is not in check.

- The King does not move over a square that is attacked by an enemy piece during the castling move, i.e., when castling, there may not be an enemy piece that can move (in case of Pawns: by diagonal movement) to a square that is moved over by the King.

- The King does not move to a square that is attacked by an enemy piece during the castling move, i.e., you may not castle and end the move with the King in check.

- All squares between the Rook and King before the castling move are empty.

- The King and Rook must occupy the same rank (or row).

- When castling, the King moves two squares towards the Rook, and the Rook moves over the King to the next square.

#### _En passant_ - This is perhaps the most obscure and least used move in chess.

- It can only occur when a player excersizes his option to move his pawn two squares on its initial movement and that move places his pawn next to the opponent's pawn.

- When this happens, the opposing player has the option to use his pawn to take the moved pawn "en passant" or "in passing" as if the pawn had only moved one square.

- This option, though, only stays open for one move.

**Code for King Piece with Castling Move:**

```javascript
public class King extends Piece {
  public booelan moved;
  public boolean castle;
  public King(boolean available, int x, int y) {
    super(available, x, y);
    this.moved = false;
    this.castle = false;
  }
  
  @Override
  public boolean isValid(Board board, int fromX, int fromY, int toX, int toY) {
    if(super.isValid(board, fromX, fromY, toX, toY) == false) {
      return false;
    }
    if(Math.abs(toX - fromX) > 1 || Math.abs(toY - fromY) > 1) {      
      if (moved) {
        return false;
      }
      return false;
    }
  }
}

if(fromY - toY == 2 && fromX == toX) {
  if(board[fromX][fromY + 1] != null || board[toX][toY + 2] != null) {
    castle = false;
    return false;
  }
} else if (fromY - toY == 3 && fromX == toX) {
  if(board[toX][fromY - 1] != null || board[toX][fromY - 2] != null || board[toX][fromY - 3] != null) {
    castle = false;
    return false;
  }
} else {
  castle = false;
  return false;
}
castle = true;
//moved = true;
return true;
```

**Code for Queen Piece:**

```javascript
public class Queen extends Piece {
  public Queen(boolean available, int x, int y) {
    super(available, x, y);
  }
  
  @Override
  public boolean isValid(Board board, int fromX, int fromY, int toX, int toY) {
    if(super.isValid(board, fromX, fromY, toX, toY) == false) {
      return false;
    }
    // diagonal stuff
    if(toX - fromX == toY - fromY) {
      return true;
    }
    if(toX == fromX) {
      return true;
    }
    if(toY == fromY) {
      return true;
    }
    return false;
  }
}
```

**Code for Bishop Piece:**

```javascript
public class Bishop extends Piece {
  public Bishop(boolean available, int x, int y) {
    super(available, x, y);
  }
  
  @Override
  public boolean isValid(Board board, int fromX, int fromY, int toX, int toY) {
    if(super.isValid(board, fromX, fromY, toX, toY) == false) {
      return false;
    }
    if(toX - fromX == toY - fromY) {
      return true;
    }
    return false;
  }
}
```

**Code for Knight Piece:** 

```javascript
public class Knight extends Piece {
  public Knight(boolean available, int x, int y) {
    super(available, x, y);
  }
  
  @Override
  public boolean isValid(Board board, int fromX, int fromY, int toX, int toY) {
    if(super.isValid(board, fromX, fromY, toX, toY) == false) {
      return false;
    }
    if(toX != fromX - 1 && toX != fromX + 1 && toX != fromX + 2 && toX != fromX - 2) {
      return false;
    }
    if(toY != fromY - 2 && toY != fromY + 2 && toY != fromY - 1 && toY != fromY + 1) {
      return false;
    }
    return false;
  }
}
```

**Code for Rook Piece with Castling Move:**

```javascript
public class Rook extends Piece {
  public boolean moved;
  public boolean castle;
  public Rook(boolean available, int x, int y) {
    super(available, x, y);
    this.moved = false;
    this.castle = false;
  }
  
  @Override
  public boolean isValid(Board board, int fromX, int fromY, int toX, int toY) {
    if(super.isValid(board, fromX, fromY, toX, toY) == false) {
      return false;
    }
    if(Math.sqrt(Math.pow(Math.abs((toX - fromX)),2)) + Math.pow(Math.abs((toY - fromY)), 2) != Math.sqrt(2)) {
      return false;
    }
    if(Math.abs(toX - fromX) > 1 || Math.abs(toY - fromY) > 1) {
      if(moved) {
        return false;
      }
      if(toX == fromX) {
        return true;
      }
      if(toY == fromY) {
        return true;      }
      return false;
    }
  }
}

if(fromY - toY == 2 & fromX == toX) {
  if(board[fromx][fromY + 1] != null || board[toX][toY + 2] != null) {
    castle = false;
    return false;
  }
} else if(from Y - toY == 3 && fromX == toX) {
  if(board[toX][fromY - 1] != null || board[toX][fromY - 2] != null || board[toX][fromY - 3] != null) {
    castle = false;
    return false;
  }
} else {
  castle = false;
  return false;
}
castle = true;// moved = true;
return true;
```

**Code for Pawn Piece with _En Passant_ Move:**

```javascript
public class Pawn extends Piece {
  public boolean hasMoved;
  public boolean ep_able;
  public boolean switch;
  public Pawn(boolean available, int x, int y) {
    super(available, x, y);
  }
  
  @Override
  public boolean isValid(Board board, int fromX, int fromY, int toX, int toY) {
    if(fromX == toX) {
      if(board[fromY + 1][fromX] != null) {
        return false;
      }
    } else {
      if(board[fromY - 1][fromX] != null) {
        return false;
      }
    }
    if(Math.abs(toY - fromY) > 2) {
      return false;
    } else if(Math.abs(toY - fromY == 2)) {
      if(hasMoved) {
        return false;
      }
      if(toX + 1 < 8) {
        if(board[toY][toX + 1] != null) {
          if(board[toY][toX + 1].getClass().isInstance(new Pawn ("marvel"))) {
            ep_able = true;
          }
        }
      }
    }
  } else {
    if(Math.abs(toX - fromX) != 1 || Math.abs(toY - fromY) != 1) {
      return false;
     }
    if(board[toY][toX] == null) {
      return false;
    }
  }
  return true;
}
```

## End Menu

Chess ends as soon as one player get the opponent's King in checkmate, or when the game ends in a draw. As soon as this happens, the screen will change from the chessboard graphics to an end game graphic.

**The following is Code for if your side wins the game:**

```javascript
PImage win;
PFont title;
PFont description;
int screenX, screenY, stage;

void setup() {
  size(1920, 1080);
  screenX = round(width);
  screenY = round(height);
  size(screenX, screenY);
  win = loadImage("Versus.png");
  image(win, 0, 0, screenX, screenY);
  title = createFont("Anurati-Regular", 80, true);
  description = createFont("Anurati-Regular", 30, true);
}

void draw() {
  textAlign(CENTER);
  textFont(title);
  text("VICTORY", width/2, 400);
  textFont(description);
  text("YOU ARE A WINNER", width/2, 450);
}
```

**This is how it would look:**

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/win.png "Logo Title Text 1")

**The following is Code for if the game will end with the Marvel winning and DC (your side) losing:**

```javascript
PImage gameover;
PFont title;
PFont description;
int screenX, screenY, stage;

void setup() {
  size(1920, 1080);
  screenX = round(width);
  screenY = round(height);
  size(sreenX, screenY);
  gamover = loadImage("Versus.png");
  image(gameover, 0, 0, screenX, screenY);
  title = createFont("Anurati-Regular", 80, true);
  description = createFont("Anurati-Regular", 30, true);
}

void draw() {
  textAlign(CENTER);
  textFont(title);
  text("MARVEL WINS", width/2, 310);
  text("GAME OVER", width/2, 400);
  textFont(description);
  text("YOU ARE NOW A LOSER", width/2, 450);
}
```
**This is how it would look*

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/marvelwins.png "Logo Title Text 1")

**The following is Code for if the game will end with DC winning and Marvel (your side) losing:**

```javascript
PImage gameover;
PFont title;
PFont description;
int screenX, screenY, stage;

void setup() {
  size(1920, 1080);
  screenX = round(width);
  screenY = round(height);
  size(screenX, screenY);
  gameover = loadImage("Versus.png");
  image(gameover, 0, 0, screenX, screenY);
  title = createFont("Anurati-Regular", 80, true);
  description = createFont("Anurati-Regular", 30, true);
}

void draw() {
  textAlight(CENTER);
  textFont(title);
  text("DC WINS", width/2, 310);
  text("GAME OVER", width/2, 400);
  textFont(description);
  text("YOU ARE NOW A LOSER", width/2, 450);
}
```

**This is how it would look like**

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/dcwins.png "Logo Title Text 1")

**The following is Code for if the game will end in a Draw/Stalemate:**

```javascript
PImage gameover;
PFont title;
PFont description;
int screenX, screenY, stage;

void setup() {
  size(1920, 1080);
  screenX = round(width);
  screenY = round(height);
  size(screenX, screenY);
  gameover = loadImage("Versus.png");
  image(gameover, 0, 0, screenX, screenY);
  title = createFont("Anurati-Regular", 80, true);
  description = createFont("Anurati-Regular", 30, true);
}

void draw() {
  textAlign(CENTER);
  textFont(title);
  text("DRAW", width/2, 310);
  text("STALEMATE REACHED", width/2, 400);
  textFont(description);
  text("AT LEAST YOU DID NOT LOSE", width/2, 450);
}
```

**This is how it would look like**

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/draw.png "Logo Title Text 1")

## THE END

# Hope you enjoy our game! :)

# Individual Projects Made in Processing and in my individual language: Java

## The first is a project I made while in Processing in the beginning of this course

This app is meant to be a calculator. It has the basic four functions: addition, subtraction, multiplication, and division. Along with this, it has a period function, sine, cosine, tangent, squared, square root, root power, and logarithm functions. Each number button is drawn "by hand."

When running this is what it would look like:

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/calculator.png "Logo Title Text 1")

**Code For Main Calculator Class:**

```javascript
// Instantiate each of the classification of buttons
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[14];
Button[] spButtons = new Button[1];

String displayVal = "0";
String valToCompute = ""; // string value left of operator
String valToCompute2 = ""; // string value right of operator
float valToComputeI = 0; // float value left of operator
float valToComputeI2 = 0; // float value right of operator
float result = 0;
char opVal;
boolean firstNum;
color b2, b1, b3;
color d1, d2;
int y_axis = 1;
int x_axis = 2;
String opValue;
boolean on1, on2;

void setup() {
  size(420, 560);
  background(255);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(0, 0, 420, 560);
  b2 = color(0, 0, 255);
  b1 = color(0);
  b3 = color(23, 209, 255);
  d1 = color(62, 241, 255);
  d2 = color(103, 104, 255);

  // Populate number buttons
  numButtons[0] = new Button(130, 485).asNumber(0, 1, 1, b2);
  numButtons[1] = new Button(130, 405).asNumber(1, 12, 12, b2);
  numButtons[2] = new Button(210, 418).asNumber(2, 60, 60, b2);
  numButtons[3] = new Button(290, 430).asNumber(3, 60, 60, b2);
  numButtons[4] = new Button(140, 325).asNumber(4, 12, 12, b2);
  numButtons[5] = new Button(205, 347).asNumber(5, 60, 60, b2);
  numButtons[6] = new Button(285, 350).asNumber(6, 60, 60, b2);
  numButtons[7] = new Button(150, 245).asNumber(7, 10, 10, b2);
  numButtons[8] = new Button(210, 253).asNumber(8, 20, 20, b2);
  numButtons[9] = new Button(300, 248).asNumber(9, 10, 10, b2);

  // Populate operators
  opButtons[0] = new Button(340, 480).asOperator(" =", 60, 60, b1);
  opButtons[1] = new Button(340, 400).asOperator(" +", 60, 60, b1);
  opButtons[2] = new Button(340, 320).asOperator(" -", 60, 60, b1);
  opButtons[3] = new Button(340, 240).asOperator(" x", 60, 60, b1);
  opButtons[4] = new Button(340, 160).asOperator(" ÷", 60, 60, b1);
  opButtons[5] = new Button(20, 160).asOperator(" C", 60, 60, b1);
  opButtons[6] = new Button(260, 480).asOperator("(-)", 60, 60, b1);
  opButtons[7] = new Button(20, 240).asOperator("x²", 60, 60, b1);
  opButtons[8] = new Button(20, 320).asOperator("√x", 60, 60, b1);
  opButtons[9] = new Button(260, 160).asOperator("tan", 60, 60, b1);
  opButtons[10] = new Button(20, 480).asOperator("log", 60, 60, b1);
  opButtons[11] = new Button(100, 160).asOperator("sin", 60, 60, b1);
  opButtons[12] = new Button(20, 400).asOperator(" ^", 60, 60, b1);
  opButtons[13] = new Button(180, 160).asOperator("cos", 60, 60, b1);


  // Populate special buttons
  spButtons[0] = new Button(180, 480).asSpecial(" .", 60, 60);

  // Set the initial value of first num to true
  firstNum = true;
}

void draw() {
  //Calculator Gradient
  setGradient(0, 0, 420, 560, d1, d2, x_axis);

  //Draw number buttons
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].click();
  }

  //Draw Operator Buttons
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].click();
  }

  // Draw Special Buttons
  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].display();
    spButtons[i].click();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].click();
    if (numButtons[i].over) {
      if (firstNum) {
        println(i + " " + numButtons[i].numButtonVal);
        valToCompute += int(numButtons[i].numButtonVal);
        displayVal = valToCompute;
      } else {
        valToCompute2 += int(numButtons[i].numButtonVal);
        displayVal = valToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].click();
    if (opButtons[i].over) {
      if (opButtons[i].opButtonVal == " +") {
        if ( result !=0) {
          opVal = '+';
          opValue = "+";
          valToCompute2 = "";
          firstNum = false;
          displayVal = "+";
        } else {
          opVal = '+';
          opValue = "+";
          firstNum = false;
          displayVal = "+";
        }
      } else if (opButtons[i].opButtonVal == " =") {
        // Perform calculation
        firstNum = true;
        performCalc();
      } else if (opButtons[i].opButtonVal == " -") {
        if (result !=0) {
          opVal = '-';
          opValue = "-";
          valToCompute2 = "-";
          firstNum = false;
          displayVal = "-";
        } else {
          opVal = '-';
          opValue = "-";
          firstNum = false;
          displayVal = "-";
        }
      } else if (opButtons[i].opButtonVal == " x") {
        if (result !=0) {
          opVal = 'x';
          opValue = "x";
          valToCompute2 = "x";
          firstNum = false;
          displayVal = "x";
        } else {
          opVal = 'x';
          opValue = "x";
          firstNum = false;
          displayVal = "x";
        }
      } else if (opButtons[i].opButtonVal == " ÷") {
        if (result !=0) {
          opVal = '÷';
          opValue = "÷";
          valToCompute2 = "÷";
          firstNum = false;
          displayVal = "÷";
        } else {
          opVal = '÷';
          opValue = "÷";
          firstNum = false;
          displayVal = "÷";
        }
      } else if (opButtons[i].opButtonVal == " C") {
        displayVal = "0";
        opVal = 'C';
        opValue = "C";
        valToCompute = "";
        valToCompute2 = "";
        valToComputeI = 0;
        valToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (opButtons[i].opButtonVal == "(-)") {
        opVal = 'n';
        performCalc();
      } else if (opButtons[i].opButtonVal == "x²") {
        if (result !=0) {
          opVal = '²';
          opValue = "²";
          valToCompute2 = " ²";
          firstNum = false;
          displayVal = " ²";
        } else {
          opVal = '²';
          opValue = "²";
          firstNum = false;
          displayVal = " ²";
        }
      } else if (opButtons[i].opButtonVal == "√x") {
        if (result !=0) {
          opVal = '√';
          opValue = "√";
          valToCompute = "√"; 
          firstNum = false;
          displayVal = "√";
        } else {
          opVal = '√';
          opValue = "√";
          firstNum = false;
          displayVal = "√";
        }
      } else if (opButtons[i].opButtonVal == "log") {
        if (result !=0) {
          opVal = 'l';
          opValue = "log";
          valToCompute2 = "log";
          firstNum = false;
          displayVal = "log";
        } else {
          opVal = 'l';
          opValue = "log";
          firstNum = false;
          displayVal = "log";
        }
      } else if (opButtons[i].opButtonVal == " ^") {
        if (result !=0) {
          opVal = '^';
          opValue = "^";
          valToCompute2 = "^";
          firstNum = false;
          displayVal = "^";
        } else {
          opVal = '^';
          opValue = "^";
          firstNum = false;
          displayVal = "^";
        }
      } else if (opButtons[i].opButtonVal == "tan") {
        if (result !=0) {
          opVal = 't';
          opValue = "tan";
          valToCompute = "tan";
          firstNum = false;
          displayVal = "tan";
        } else {
          opVal = 't';
          opValue = "tan";
          firstNum = false;
          displayVal = "tan";
        }
      } else if (opButtons[i].opButtonVal == "sin") {
        if (result !=0) {
          opVal = 's';
          opValue = "sin";
          valToCompute = "sin";
          firstNum = false;
          displayVal = "sin";
        } else {
          opVal = 's';
          opValue = "sin";
          firstNum = false;
          displayVal = "sin";
        }
      } else if (opButtons[i].opButtonVal == "cos") {
        if (result !=0) {
          opVal = 'c';
          opValue = "cos";
          valToCompute = "cos";
          firstNum = false;
          displayVal = "cos";
        } else {
          opVal = 'c';
          opValue = "cos";
          firstNum = false;
          displayVal = "cos";
        }
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].click();
    if (spButtons[i].over) {
      if (spButtons[i].spButtonVal == " .") {
        // concantenate the values clicked on
        if (spButtons[i].over && firstNum == true) {
          valToCompute += spButtons[i].spButtonVal;
          displayVal = valToCompute;
        } else if (spButtons[i].over && firstNum == false) {
          valToCompute2 += spButtons[i].spButtonVal;
          displayVal = valToCompute2;
        }
      }
    }
  }
}


void performCalc() {
  // set string values to integers
  valToComputeI = float(valToCompute);
  valToComputeI2 = float(valToCompute2);

  //perform calculation based on the appropriate operator
  if (opVal == '+') {
    result = valToComputeI + valToComputeI2;
    displayVal = str(result);
  } else if (opVal == '-') {
    result = valToComputeI - valToComputeI2;
    displayVal = str(result);
  } else if (opVal == 'x') {
    result = valToComputeI * valToComputeI2;
    displayVal = str(result);
  } else if (opVal == '÷') {
    result = valToComputeI / valToComputeI2;
    displayVal = str(result);
  } else if (opVal == 'n') {
    if (firstNum) {
      valToComputeI = valToComputeI*-1;
      displayVal = str(valToComputeI);
    } else {
      valToComputeI2 = valToComputeI2*-1;
      displayVal = str(valToComputeI);
    }
  } else if (opVal == '²') {
    result = valToComputeI * valToComputeI;
    displayVal = str(result);
  } else if (opVal =='√') {
    result = sqrt(valToComputeI2);
    displayVal = str(result);
  } else if (opVal == 'l') {
    result = log(valToComputeI2);
    displayVal = str(result);
  } else if (opVal == '^') {
    result = pow(valToComputeI, valToComputeI2);
    displayVal = str(result);
  } else if (opVal == 't') {
    result = tan(radians(valToComputeI2));
    displayVal = str(result);
  } else if (opVal == 's') {
    result = sin(radians(valToComputeI2));
    displayVal = str(result);
  } else if (opVal == 'c') {
    result = cos(radians(valToComputeI2));
    displayVal = str(result);
  }

  //let = work multiple times
  if (firstNum) {
    valToCompute = displayVal;
  } else {
    valToCompute = displayVal;
    valToCompute2 = "";
  }
}

void updateDisplay() {
  fill(255, 255, 255);
  rect(20, 20, 380, 120, 5);
  fill(0);
  textSize(25);
  if (firstNum) {
    text(displayVal, 40, 30, 360, 120);
  } else {
    text(valToCompute + "" + opValue + "" + valToCompute2, 40, 30, 360, 120);
  }
}

void setGradient(int x, int y, float w, float h, color d1, color d2, int axis) {
  noFill();
  if (axis == y_axis) {
    for (int i = y; i<=y+h; i++) {
      float inter = map(i, y, h, 0, 1);
      color c = lerpColor(d1, d2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  } else if (axis == x_axis) {
    for (int i=x; i<=x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(d1, d2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
```

**Code for Button Class:**

```javascript
class Button {
  // Class variables
  color b1, b2, b3, t1, t2;
  boolean isNumber;
  boolean isSpecial;
  boolean isOperator;
  int numButtonVal;
  String opButtonVal;
  String spButtonVal;
  float x, y;
  //int boxSize = 60;
  int w = 60, h = 60;
  boolean over = false;
/*  boolean asShapeZero= false;
  boolean asShapeOne= false;
  boolean asShapeTwo= false;
  boolean asShapeThree= false;
  boolean asShapeFour= false;
  boolean asShapeFive= false;
  boolean asShapeSix= false;
  boolean asShapeSeven= false;
  boolean asShapeEight= false;
  boolean asShapeNine= false;*/

  // Constructor
  Button(float x, float y) {
    this.x = x;
    this.y = y;
  }

  // Constructor for number buttons
  Button asNumber( int numButtonVal, int w, int h, color b2) {
    this.numButtonVal = numButtonVal;
    this.w = w;
    this.h = h;
    this.b2 = b2;
    return this;
  }

  // Constructor for operator buttons
  Button asOperator(String opButtonVal, int w, int h, color b1) {
    this.opButtonVal = opButtonVal;
    this.w = w;
    this.h = h;
    this.b1 = b1;
    isOperator = true;
    return this;
  }

  // Constructor for special buttons
  Button asSpecial(String spButtonVal, int w, int h) {
    this.spButtonVal = spButtonVal;
    this.w = w;
    this.h = h;
    isSpecial = true;
    return this;
  }

  // Draw the button on the canvas
  void display() {
    if (isSpecial) {
      fill(b3);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 10);
      fill(b3);
      rect(x-2, y+2, w, h, 10);
      fill(255);
      textSize(15);
      text(spButtonVal, x+20, y+40);
    } else if (isOperator) {
      fill(b3);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 10);
      fill(b3);
      rect(x-2, y+2, w, h, 10);
      fill(255);
      textSize(24);
      text(opButtonVal, x+15, y+40);
    } else if (numButtonVal == 0) {
      numberZero();
    } else if (numButtonVal == 1) {
      numberOne();
    } else if (numButtonVal == 2) {
      numberTwo();
    } else if (numButtonVal == 3) {
      numberThree();
    } else if (numButtonVal == 4) {
      numberFour();
    } else if (numButtonVal == 5) {
      numberFive();
    } else if (numButtonVal == 6) {
      numberSix();
    } else if (numButtonVal == 7) {
      numberSeven();
    } else if (numButtonVal == 8) {
      numberEight();
    } else if (numButtonVal == 9) {
      numberNine();
    }
  }

  void numberZero() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    noFill();
    stroke(0, 0, 255);
    strokeWeight(8.5);
    arc(x, y+23, w+34, h+54, -PI, PI);
  }

  void numberOne() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    rect(x-3.5, y, w-3, h+35);
    ellipse(x-20, y+15, w-3, h-3);
    quad(x-6, y-4, x-26, y+15, x-19, y+20, x+6, y-4);
    ellipse(x-20, y+50, w-4, h-4);
    ellipse(x+20, y+50, w-4, h-4);
    rect(x-20, y+46, w+30, h-4);
  }

  void numberEight() {
    noFill();
    stroke(0, 0, 255);
    strokeWeight(6.5);
    arc(x, y, w, h, -PI, PI);
    arc(x, y+28, w+5, h+10, -PI, PI);
  } 

  void numberSeven() {
    fill(0, 0, 255);
    noStroke();
    ellipse(x-35, y, w, h);
    ellipse(x, y, w, h);
    rect(x-35, y-5, w+25, h);
    ellipse(x-25, y+50, w, h);
    quad(x-28, y+45, x-2, y-5, x+3, y+4, x-22, y+53);
  } 

  void numberNine() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    ellipse(x, y+48, w, h);
    rect(x-4, y, w-2, h+35);
    noFill();
    stroke(0, 0, 255);
    strokeWeight(7);
    arc(x-15, y+10, w+15, h+15, -PI, PI);
  }

  void numberFour() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    ellipse(x, y+50, w-2, h-2);
    rect(x-4, y, w-3, h+35);
    ellipse(x-30, y+25, w-4, h-4);
    quad(x-5, y-4, x-32, y+20, x-26, y+27, x+4, y);
    ellipse(x+5, y+25, w-2, h-2);
    rect(x-30, y+21, w+27, h-3);
  }

  void numberThree() {
    smooth();
    noStroke();
    noFill();
    rect(x, y, w, h);
    stroke(0, 0, 255);
    strokeWeight(9);
    arc(x-3, y-12, w-29, h-38, -PI/2, PI/2);
    arc(x-3, y+10, w-29, h-38, -PI/2, PI/2);
  } 

  void numberTwo() {
    noStroke();
    noFill();
    rect(x, y, w, h);
    stroke(0, 0, 255);
    strokeWeight(8);
    arc(x, y, w-30, h-35, -PI, PI/3.5);
    noStroke();
    fill(0, 0, 255);
    ellipse(x-15, y+38, w-51, h-51);
    ellipse(x+15, y+38, w-51, h-51);
    rect(x-15, y+34, w-30, h-52);
    quad(x+7, y+7, x-17, y+35, x-8, y+35, x+12, y+12);
  }

  void numberFive() {
    noStroke();
    noFill();
    rect(x, y, w, h);
    stroke(0, 0, 255);
    strokeWeight(8);
    arc(x-3, y+15, w-22, h-32, -PI/2, PI/2);
    noStroke();
    fill(0, 0, 255);
    ellipse(x-3, y-20, w-51, h-51);
    ellipse(x+18, y-20, w-51, h-51);
    rect(x-7, y-22, w-52, h-37);
    rect(x-7, y-24, w-35, h-52);
  }

  void numberSix() {
    noStroke();
    noFill();
    rect(100, 100, 60, 60);
    stroke(0, 0, 255);
    strokeWeight(8);
    arc(x+5, y, w-40, h-10, PI/2, 5*PI/2.9);
    arc(x+9, y+15, w-40, h-38, -PI, PI);
  }

  // Handle mouse actions
  void click() {
    over = mouseX > x-25 && mouseX < x+45 && mouseY > y-5 && mouseY < y+60;
  }
}
```

## The Second is a type of screensaver app also made in Processing

This app make random lines in random colors all over the screen and it looks really cool.

When running, this is what it would look like:

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/random.png "Logo Title Text 1")

**Code for Main Screensaver Class:**

```javascript
Lines[] myLines = new Lines[20];

void setup() {
  size(displayWidth,displayHeight);
  background(0);
//  frameRate(20);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(3,4), random(20,40));
  }
}

void draw() {
  for(int i=0; i<myLines.length; i++) {
    myLines[i].display();
  }
}
```

**Code for Lines Class:**

```javascript
class Lines {
  // class variables
  float x;
  float y;
  float strokeW;
  float pointCount;
  float reset;
  color c;

  //constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    x = tempX;
    y = tempY;
    strokeW = tempStroke;
    pointCount = tempLength;
    reset=0;
    c=0;
  }

  // display
  void display() {
    if (reset==0) {
      c=color(random(130, 200), random(130, 200), random(130, 200));
    }
    //    strokeW = random(1, 4);
    //    pointCount = random(1,10);
    stroke(c);
    if (x > width || x < 0 || y > height || y < 0) {
      x = random(width);
      y = random(height);
    } else {
      if (random(100)>80) {
        strokeWeight(strokeW);
        moveRight(x, y, pointCount);
      } else if (random(100)>70) {
        strokeWeight(strokeW);
        moveUp(x, y, pointCount);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDown(x, y, pointCount);
      } else if (random(100)>40) {
        strokeWeight(strokeW);
        moveLeft(x, y, pointCount);
      } else if (random(100)>75) {
        strokeWeight(strokeW);
        moveUpAndRight(x, y, pointCount);
      } else if (random(100)>40) {
        strokeWeight(strokeW);
        moveUpAndLeft(x, y, pointCount);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDownAndLeft(x, y, pointCount);
      } else {
        strokeWeight(strokeW);
        moveDownAndRight(x, y, pointCount);
      }
    }
    reset++;
    if (reset>height) {
      background(0);
      reset=0;
      x=(random(width));
      y=(random(height));
      c=color(random(130, 200), random(130, 200), random(130, 200));
    }
  }

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      x = startX + i;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      x = startX - i;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      y = startY - i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      y = startY + i;
    }
  }

  void moveUpAndRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      x = startX + i;
      y = startY - i;
    }
  }

  void moveUpAndLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      x = startX - i;
      y = startY - i;
    }
  }

  void moveDownAndRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      x = startX + i;
      y = startY + i;
    }
  }

  void moveDownAndLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      x = startX - i;
      y = startY + i;
    }
  }
}



//cool pattern
/*  strokeWeight(strokeW);
 moveRight(x, y, pointCount);
 moveUp(x,y,pointCount);
 moveLeft(x, y, pointCount);
 moveLeft(x,y,pointCount);
 moveUp(x,y,pointCount);
 moveRight(x,y,pointCount);
 moveDown(x,y,pointCount);*/
```

## The third is also an app from Processing. It's a years to minutes conversion calculator

This app, as you scroll over the screen with your mouse, the bar changes according to how many minutes or years.

When running this is what it would look like:

![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/temp.png "Logo Title Text 1")


```javascript
void setup() {
  size(900,300);
}

void draw() {
  textSize(12.5);
  yearsToMinutes(mouseX-100);
  fill(0);
  rect(100,160,mouseX-100,20);
  drawReference(100,150);
  fill(255);
  textSize(20);
  text("Years to Minutes Conversion",width/2-140,25);
  textSize(14);
  text("By: Nastassja Motro",width/2-80,50);
  text("Slide the mouse along the screen to see how many minutes are in a certain number of years", 140,75);
}

void drawReference(int x, int y) {
  fill(255);
  line(x-150,y,900,y);
  for(int i=-50; i<800; i+=50) {
    stroke(255);
    line(x+i,y-5,x+i,y+5);
    text(i,x+i-7,y-8);
  }
}

float yearsToMinutes(float val) {
  val = val*365*24*60;
  background(0,0,255);
  fill(255);
  text("Years: " + int(mouseX-100),100,220);
  text("Minutes: " + int(val), 100,240);
  return val;
}
```

## The fourth is a project I did in the beginning of my introduction to java. It's called 99 Bottles

This program replicated the famous car song: 99 Bottles of Beer on the Wall

```javascript
public class bottles
{
	public static void main(String args[])
	{
		String s = “s”;
		for (int beers=99; beers>-1;)
		{
			System.out.print(beers + “ bottle” + s + “ of beer on the wall, “);
			System.out.println(beers + “ bottle” + s + “ of beer, “);
			if (beers==0)
			{
				System.out.print(“Go to the store, buy some more, “);
				System.out.println(“99 bottles of beer on the wall.\n”);
				System.exit(0);
				}
			else
				System.out.print(“Take one down, pass it around, “);
			s = (—-beers == 1)?””:”s”;
			System.out.println(beers + “ bottle” + s + of beer on the wall.\n”);
			}
		}
}
```

## The fifth and final one is another program I made on java. It's called Dice Game.

This program replicated the random scenario of if a dice was rolled.

```javascript
import java.util.Random;

public class DiceGame {
    
    public static void main(String[] args) {
        Random rand = new Random();
        
        int freq[] = new int[7];
        for (int roll = 1; roll < 100; roll++) {
            
            ++freq[1 + rand.nextInt(6)];
        }
        
        System.out.println("Face\tFrequency");
        for(int face = 1; face < freq.length; face++) {
            System.out.println(face + "\t" + freq[face]);
        }
    }
}
```

## Those are just some of the small programs I made during the year 2016-2017 in my introductory Computer Programming 1 class.

# The End :)
