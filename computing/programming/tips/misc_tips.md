---
title: Misc Tips
---

### Comments for enabling understandability
So make comments and documentation copious. In the best case, use "literate programming", where the aim is for a code file to read like a clear book chapter.

When declaring (class) variables, write comments indicating purpose, desired properties.

When a particular design choice is implemented, comments may be included to justify the choice.

### Naming conventions

Use good naming conventions for all identifiers. Use meaningful names; make it easy to read with capital letters at word beginnings: listIterator.

Macros and constants in CAPS.

Classes starting with capital letter. methods, objects, packagesMemoir start with small case. Maybe variable names prefixed to indicate data type.

In case of collections/ namespaces of multiple objects of type Str, the Java convention is to use the name str, rather than strs.

### Coding conventions

Include sequence: Be alphabetical. In case of C++: mainHeader.h, c system, c++ system, other.

Terminate namespaces with // namespace video

### Separate data from code
#### Externalizing messages

Message strings should, in most cases, not be hard-coded inside the code. Instead, message strings should be externalized; perhaps be returned by a function when provided with an appropriate key.

This separates the program logic from the messages cleanly. One advantage of doing this is that these messages can be changed without touching the program logic.

This is also convenient when the program needs to be made available in several different languages.

### Automate tests

In case of code to be shipped: test every function; make test scripts. If on GitHub, use free testing and build tools like Travis.

### Optimizing code for speed

Use a profiler to detect parts of the code which are slow. Use libraries optimized for speed.

Avoid repeated memory allocation.

Avoid writing loops in interpreted languages without ’just in time compiling’ facilities - like Matlab: use a compiled language like C instead: otherwise interpretation costs for executing the code piles up.

### Automatic logging

Corresponding to each experiment, create a log file with a time stamp automatically, perhaps of the same name.

### Code reuse
Don’t rewrite the same logic multiple times: put it away in functions.

## Experiment functions

Make a function out of each experiment.

Clearly make program variables for all parameters involved in the experiment. You should not have to comment or uncomment code to run different variations of the experiment; you should just set the experiment parameters as necessary.
