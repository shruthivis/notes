---
title: Comments, names, size
unicode_script: devanagari
emphasis_as_inline_comments: true
---

## Readability techniques
To borrow from, but not fully copy, "literate programming" - a code segment (say a file) should read like a clear book chapter or short wiki article. Readability (ease of understanding) can be accomplished by a combination of good variable naming, function and file size and comments - in that order of preference.

Comments are the last resort (as they get out of sync), but should be quite copious when necessary (to communicate design choices, problems, describing obscure language features etc.. for example). To the greatest extant possible, comments should be interleaved with the code itself (and not in some external file) - to keep them in greater sync. One should be able to generate API documentation thence.

## Comment triggers
When declaring (class) variables, write comments indicating purpose, desired properties.

When a particular design choice is implemented, comments may be included to justify the choice.

## Coding conventions
Following common coding conventions ensures that:
- the code gels well with programming style of libraries as well as a broad set of contributors.
- Function and variable names will be easy to search.
- Sometimes they help avoid logic pitfalls.
