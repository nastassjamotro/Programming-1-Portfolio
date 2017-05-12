# Programming 1 Portfolio
## Nastassja Motro 2017
### With Bryn Esperson and Tessa Vu

## Our Game

We have decided to create a Chess Game using the Java Language.
This program is just supposed to replicate the design of a chess game like one you would find on an app on your phone or on the computer. It's not as fancy with as many special effects as some other games but it still has many cool features.

## Basic Rules

Chess is a two player game. One person controls one set of peices (black pieces) and the other player controls the opposite set of pieces (white pieces). Players cannot switch set of pieces midgame. The goal of the game is to get the other player's King into checkmate.

### Check, Checkmate, and Stalemate

* check - When the King of a player can be taken by a piece of the opponent, one says that the King is in check. It is not allowed to make a move, such that ones King is in check after the move.

* checkmate - When a player is in check, and he cannot make a move such that after the move, the King is not in check, then he is mated. The player that is mated loses teh game, and the player that mates him wins the game.

* stalemate - When a player cannot make any legal move, but he is not in check, then the player is said to be stalemated. In a case of a stalemate, the game is a draw.

## Starter
The game starts off with a main menu screen. We decided to create a theme based game. The theme is Marvel vs. DC with Marvel being the white designated set of pieces and DC being the black designated set of pieces. As soon as the game is opened, the starter menu will pop open.

```markdown
Code:

```
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
![alt text](https://nastassjamotro.github.io/Programming-1-Portfolio/pic.png "Logo Title Text 1")


You can use the [editor on GitHub](https://github.com/nastassjamotro/Programming-1-Portfolio/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/nastassjamotro/Programming-1-Portfolio/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
