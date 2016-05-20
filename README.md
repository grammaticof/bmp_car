# Technical Test Ruby developer

Produce a Ruby 2.3 program that simulates a basic interactive bitmap editor.
Bitmaps are represented as an M x N matrix of pixels with each element
representing a colour.

# Program input

The input consists of a string containing a sequence of commands, where
a command is represented by a single capital letter at the beginning of the line.
Parameters of the command are separated by white spaces and they follow the command character.

Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

# Commands

There are 8 supported commands:

* I M N - Create a new M x N image with all pixels coloured white (O).
* C - Clears the table, setting all pixels to white (O).
* L X Y C - Colours the pixel (X,Y) with colour C.
* V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* S - Show the contents of the current image
* ? - Displays help text
* X - Terminate the session

# Example

In the example below, > represents input

```
> I 5 6
> L 2 3 A
> S
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
> V 2 3 6 W
> H 3 5 2 Z
> S
OOOOO
OOZZZ
OWOOO
OWOOO
OWOOO
OWOOO
```

When implementing this program focus on quality and best practices. DO NOT RUSH! It's not a speed test. Make sure the program works with odd input and doesn't crash.

# Submission

We've created a very basic skeleton application you can use as a basis to start from. Feel free to adapt and refactor it as you see fit.

The skeleton can be found here: https://github.com/carwow/bitmap_editor

Please submit a fully completed answer within the time allowed. Please provide source code and full GIT repository. Please commit often and with good commit messages. That will allow us to see how you've approached the problem. Don't worry about changing things around often
