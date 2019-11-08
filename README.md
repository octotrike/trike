# Trike

This is the Smalltalk implementation of the Trike threat modeling methodology, moving towards version 2.

This version is extremely pre-alpha code you are welcome to use for research purposes, but should not rely on.  For example, a lot of obsolete v1 code is still included.  The classes, APIs, UI, and pretty much everything about the tool are subject to drastic change, with little to no advance warning.

## Getting Started

 * [Installation & Updates](INSTALL.md)

Since the UI isn't working yet, the best places to start are the TrikeModel class comment and the unit tests.

To find the TrikeModel class comment inside Pharo:

 - Tools -> System Browser
 - Right click on any class category in the upper left pane -> Find class
 - Start typing `TrikeModel` in the Filter... box, until you see TrikeModel in the list of classes.  Click on it.  Click OK.
 - Select the Comment tab in the bottom pane.

To run the unit tests and investigate any that fail (none on Pharo 8.0.0 build 959 commit a893da6 on macOS X Mojave 10.14.6, but other versions may vary):

 - Tools -> Test Runner
 - Type `Trike` in the Filter... box at the bottom of the left pane.  Press enter.
 - Select the category of Trike tests you want to run
 - Run Tests (the very wide button at the bottom)
 - Examine the results in the right pane.

## Contributing

 * [Known Issues & Requests](https://github.com/octotrike/trike/issues)

---

Please [contact us](http://www.octotrike.org/contact) if you have problems, questions, or trip reports.