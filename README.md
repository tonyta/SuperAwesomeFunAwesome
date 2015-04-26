# Super fun awesome coding workshop, great job!
##### with [@coreyhaines](https://github.com/coreyhaines/)
![super-awesome-fun-awesome](https://cloud.githubusercontent.com/assets/5795302/7339035/1955a180-ec15-11e4-8f46-e705e3e7dabd.jpeg)

## The Task
We were to take 2 hours to pair on generating and rendering a maze created using the [binary tree algorithm](http://weblog.jamisbuck.org/2011/2/1/maze-generation-binary-tree-algorithm). We were to program in any language of our choosing and conform to the constraints given:
- methods cannot have more than 3-lines
- class/modules can only have one method
  - a basic initializer is okay for classes
  - no static methods allowed
- classes/modules can include as many modules as desired
- module methods cannot rely on instance variables

We also must keep in mind the [4 Rules of Simple Design](http://c2.com/cgi/wiki?XpSimplicityRules) (as codified by Kent Beck):

1. Tests Pass
2. Expresses Intent
3. No Duplication (DRY)
4. Small

The last one was taken to an extreme for this exercise.

## The Code
The original code was took 2 hours of pairing with [@jespr](https://github.com/jespr).
We coded in Ruby and wrote tests after the implementation was running.

The results at hands-off-keyboards can be found here: [hands-off-keyboards](https://github.com/tonyta/SuperAwesomeFunAwesome/tree/hands-off-keyboards)

All commmits going forward were added afterwards.

## Running It
```
$ git clone https://github.com/tonyta/SuperAwesomeFunAwesome.git
$ cd SuperAwesomeFunAwesome/

$ ruby super_awesome_fun.rb --help
Usage: ruby super_awesome_fun.rb [options]
    -d, --dimensions=ROWS,COLUMNS    Dimensions of the maze (default: 30, 40)
    -b, --box-printer                Print using ASCII box-drawing
    -h, --help                       Prints this help

$ ruby super_awesome_fun.rb --dimensions=12,12
|¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯|
| |¯  |¯  | |¯  |¯ ¯  | |
| |¯  |¯ ¯  | | | |¯  | |
|¯  | | |¯ ¯  |¯ ¯  | | |
|¯ ¯ ¯ ¯ ¯ ¯ ¯  |¯ ¯ ¯  |
|¯ ¯  |¯  | | |¯ ¯  | | |
|¯ ¯  |¯ ¯ ¯  |¯  | |¯  |
| |¯ ¯ ¯ ¯ ¯  |¯  | |¯  |
|¯  | | |¯  |¯  | |¯  | |
| | |¯  |¯  | | |¯ ¯ ¯  |
|¯ ¯  | |¯ ¯ ¯  |¯ ¯ ¯  |
| |¯  | |¯ ¯ ¯  | | |¯  |
 ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯

$ ruby super_awesome_fun.rb --dimensions=12,12 --box-printer
┌───────────────────────┐
├─────────╴ ╷ ┌─────╴ ╷ │
├─────╴ ╷ ┌─┘ ├─╴ ╷ ┌─┘ │
│ ┌─╴ ╷ ├─┘ ╷ │ ╷ ├─┴─╴ │
├─┴───┘ │ ╷ │ │ ├─┴───╴ │
│ ┌─╴ ┌─┴─┘ │ ├─┴─────╴ │
├─┴───┘ ┌─╴ ├─┘ ┌─────╴ │
│ ┌─────┴─╴ ├─╴ │ ╷ ┌─╴ │
├─┘ ┌─╴ ╷ ┌─┘ ╷ ├─┴─┘ ╷ │
├───┴─╴ │ │ ╷ │ ├─────┘ │
├─────╴ │ ├─┘ │ │ ╷ ╷ ╷ │
│ ┌───╴ ├─┘ ┌─┘ ├─┴─┴─┘ │
└─┴─────┴───┴───┴───────┘
```

## Lessons Learned
#### Separation of Concerns
It was really helpful to immediately isolate the logic and data-structure of the maze before addressing the rendering part of it. This helped us focused into a smaller scope, decreasing the mental load needed to hold the context of what we were doing.

Later, this clear separation allowed the addition of a new printer to be added quite easily.
#### Top-Down Design
With the strict contraints, it was really helpful to get an idea working implementation before conforming to the them. The code could then be decomposed quite easily by extracting out mixins as needed.
#### Naming
The one-method-per-class/module constraint allowed for a proliferation of classes and modules. Proper naming of them and their method was valuable for figuring out what the hell was going on.
#### Testing
TDD was hard since the code was always in flux. Instead, since collaborative tests for cheap, they were a great sanity-check for the crazy refactors we had to do. The basic workflow was:
- get the code working (code could be messy here)
- test the all the things (messy tests were okay here)
- refactor at your heart's content


## The Event
http://www.eventbrite.com/e/super-fun-awesome-coding-workshop-great-job-5145947668

### Description

Code all day with awesome people! Write crazy code, make friends and pair with new people.
The day is based on the idea that coding with extreme constraints can often expose interesting patterns that are useful when working with more relaxed constraints in our day-to-day work.

The language of choice, based on the design constraints, will be Ruby. Don't worry, though, we won't be using any fancy libraries or frameworks (read: this isn't Rails). If you can write a class and a method, you can do this. Everything will be just files requiring other files.

The workshop consists of two sections, a morning and an afternoon, separated by a lunch.

We will start the day with a brief explanation of the problem we'll be working on, the constraints we'll be under in our design, and an overview of the 4 Rules of Simple Design, our guide through refactoring. Then, we'll pair up for a 2-hour session coding.
After the initial session, each pair will have 5 minutes to show their strategy via a code walkthrough.
LUNCHTIME! (looking for a sponsor, although likely people will be on their own)
The afternoon will look a lot like the morning, with new pairs working on the problem for another 2 to 3-hour session. We will close the day with another code walkthrough and a closing circle.

Make some friends, lots of laughs? Why not retire to a local post-workshop coffeehouse or bar to chat. That's also suggested!

What constraints will we be using? Some variation of the following:
- Every method can have AT MOST 3 lines of code (this might be relaxed, as I do more experimentation);
- A given class can have AT MOST one method defined (instance method, excluding initializer, which can only be used to set up instance variables based on passed in parameters);
- A given class can include as many modules as desired;
- A given module can have AT MOST one method;
- Module methods may not rely on instance variables.
(and perhaps a couple other I'm mulling over, maybe no if statements most likely definitely no looping constructs)

And, of course, code should be written to emphasize readability. We'll be showing off our code, so you want to make it beautiful. :)

Also, all attendees get a free copy of my book ["Understanding the Four Rules of Simple Design"](https://leanpub.com/4rulesofsimpledesign)
Have questions about Super fun awesome coding workshop, great job!? Contact Corey Haines
