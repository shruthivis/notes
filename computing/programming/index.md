---
title: Intro
---

# Themes and techniques

For distributed computing, computer networks, software engineering, see elsewhere.

Also of interest -
- [Programming languages](programmingLanguages/programmingLanguages.pdf). [Spreadsheet](https://docs.google.com/spreadsheet/pub?key=0Al_QBT-hoqqVdFJWbmdBdG9rQkpMSVlNU3JHbnFMYnc&output=html).  


Architecture considers how code may be organized.


# The overall picture
## Analogies

Programming is a matter of unambiguously telling the computer what to do, in a language it understands.

Programming is analogous to wiring a complicated electronic circuit: Joining wires of various modules is the right way.

Programming is analogous to designing a pipeline or circuit on the computer (as in chip design or in designers like rational rose, or in rapidminer or in lego robotics).

## Understanding specifications

In the industry, this involves surveying customers, rapid prototyping, talking to end-users etc.. In research, the specifications come from the research problem.

# Domain specific languages (DSL)

## Objectives

The objective is often to define a special, simple language for a certain domain so as to provide a linguistic user interface usable by non-programmer domain-experts. This could also be an intermediate step for programmers ultimately providing other interfaces - a paradigm called ’Language oriented programming’.

## Compiler implementation

These are often written using high level functional languages like Scala, Groovy which let one define binary operators/ relations, easy type conversions, ways to dynamically handle arbitrary class members, syntax for symbols etc.. So, one actually writes DSL code which also makes sense in that high level language; and this code is interpreted suitably due to exploitation of the aforementioned features.

Binding symbols is often accomplished using hashmaps.

# Compilers

\[**Incomplete**\]