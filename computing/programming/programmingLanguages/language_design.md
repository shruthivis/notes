---
title: Language designed
---

Programming is data processing.

## Chapter Scope

Programming language features enabling different programming paradigms
and architectures are considered here, while the the higher level
programming paradigms themselves are considered elsewhere. Eg: Higher
order functions underlies functional programming paradigm.

For details about threads etc.., see software systems ref.

## Syntax

### Literals

All literals, apart from comments, in a program are of the following
sort: keywords; identifiers (names of variables); operators. Literals
are separated using delimiters and by using rules which specify the
allowed structure of the literal.

### Identifiers

#### Overloading

A language may allow methods/ operators with similar names, but
different signature.

#### Scope

Namespace/ scope of variables and functions is ordinarily defined by the
block of code wherein it is defined.

#### Implicit scope

But, in some cases, a variable may be defined to have ’implict’ scope.
Such variables are automatically used by the compiler when necessary -
example to bind an argument not explicitly passed to a function, to
convert between data-types.

### Expression evaluation

#### Lazy vs eager evaluation

In lazy eval: length(\[2+1, 3\*2, 1/0, 5-4\]) returns 4 without even
bothering to evaluate the values in the array. This difference in
evaluation becomes important when the computations involved are costly:
eg: function calls.

### Syntactic sugar

Some languages, for the convenience of the programmer, define shorter
ways of writing various frequently used expression types.

#### Macros

Sometimes, a user may add to syntactic sugar by the definition of
’macros’ or expressions which are evaluated before the program is even
parsed by the compiler.

## Abstraction from hardware

### View of memory

If in writing code, one thinks in terms of instructions and data which
can be understood by a processor (eg: bytes in the main memory,
registers, hardware IO signals), one is working with a low level
language.

High level languages allow the programmer to think of memory locations
and data more abstractly/ declaratively by starting with assumptions
that there exist memory locations with certain properties which will be
bound to variables used by the programmer by the compiler with the OS’s
help.

Mixed level languages allow a combination of both these paradigms.

### Portability

Programs written in high level language are more portable across
computers with different architectures and abilities due to the
existence of compilers or interpreters or virtual machines implemented
on various platforms which suitably translate a high level program to
something understandable to the processor.

### Programming discipline

High level languages often try to enable/ enforce some programming
discipline (eg: by enforcing OOP paradigm, functional programming,
variable scoping etc..), provide more concise commands for frequent
operations, perhaps using ’syntactic sugar’; though internally they may
be forced to use programming paradigms different from the programming
interface provided to the programmer.

### Type system

#### Implementing abstract data-types

While programming, rather than think of data in terms of bytes, one can
consider and manipulate data (collection of data) at a more abstract
level. One can define different generic operations and views on a set of
bytes depending on the type of data stored therein.

Examples of data-types may be Integers, Floating point numbers or even
arbitrary user-defined classes. A very basic datatype offered by
high-level languages is the Array/ sequential storage.

#### Compile time vs run-time

Aka Static vs dynamic.

In static type checking, data types are associated with variables, and
these are checked at compile time to ensure that assignments do not
violate this binding. So, the binding of a type to a variable happens at
compile time, rather than run time. This enables us to catch errors and
prove more properties about a program’s correctness before it is
compiled and run. It also enables safer refactoring of code (changing
type to a subtype etc..).

In case of dynamic typing, types are associated with values rather than
variables. THis allows the programmer more flexibility in his use of
variables.

#### Strong vs weak

Can the type of data pointed to by a variable symbol change within its
scope?

Scala has weak typing and static typing. Python has weak typing and
dynamic typing.


## Procedures

Code is often organized into different procedures, which may be invoked
under different contexts with different arguments.

### Mathematical functions

A procedure can change state (has a side-effect) and maybe return a
value, doesn’t naturally correspond to mathematical function which
cannot do this. So a function, which cannot have side-effects, can be
viewed as a special type of procedure.

C is a procedural programming language which is not structured.

### Passing arguments to procedures

Variables can be passed by reference, or by value. In the former case,
an address to the data can be considered as being passed; so a
modification to the data will be visible after the function returns. In
the latter case, this is not true.

### Operators

Operators are special functions, often with special syntax. They
sometimes implement logic which is so finely grained that it is executed
in a lower level programming/ machine language.


## Object creation and manipulation

Object oriented design is considered in the software architecture
survey.

### Object manipulation

The main idea of object oriented programming is to describe computation
in terms of manipulating states of objects. This causes state changes to
be local - which helps programmers design a well structured view of
state and behavior.

This is distinct from the functional programming paradigm.

### Encapsulation and locality

Hiding data and methods from outside methods restricts state changes to
be local.

For enforcing varying degrees of locality, Method/ property access
specifiers may be provided: public, private, protected, default.

#### Methods

Methods: procedures associated with a class. The behavior of a method
within a certain object obj - say obj.f(argList), in terms of functional
programming, can be considered to be a function which accepts two
argument sets: first is the object obj, and the second is the argList
passed to the method; and which then returns values which include the
modified object, which is then assigned to the appropriate reference.

Maybe class has events, listeners too.

### Object construction and destruction

There are various patterns for specifying functions which create objects
based on prototypes.

#### Classes

Based on their state-space and purpose, these objects may be described
as instances of various classes, in whose definition various attributes
and methods may be defined.

Use of classes enables static type checking.

#### Cloning prototypes

One way to create objects is by creating a clone. This mechanism works
even where objects’ types are not well defined.

Properties and methods are then added as desired.

#### Deep copy

With a deep copy, not only is a new object with the same state as the
original object created, but the following happens too: any object
contained within the original object is also deep copied (rather than
both objects referring to the same member object).

#### Factory methods

Often easily accessed factory methods are provided in order to create an
object of a certain class with a certain state. When these are member
methods of the class in question, they are called constructors.

When an inheritance structure is present, and when a parent class has
multiple constructors, it becomes necessary to ensure the calling the
right parent constructor. Sequence of calling constructors: superclass
first. Destructors: subclass destructor called first.

### Inheritance

Among classes of objects, a inheritance structure may be defined - Eg:
class A extends class B in that it has all the members in B (with
identical or overriden semantics/ behavior), together with some extra
members.

#### Benefits

Inheritience is compared with object composition elsewhere.

This accomplishes two things: 1\] It is a neat code-reuse pattern; and
2\] enabling static type-checking (in case of statically typed
languages) - ie when a member \(x\) is accessed, ensuring that the class
has an appropriate member \(x\).

The fact that members of objects of different subclasses of the same
superclass can be accessed using a variable (of the superclass type) is
called polymorphism.

#### Abstract class/ interface

Programming laguages often allow definition of types which cannot be
instantiated, but can be used to define the members of other classes
which extend/ implement them. So, these abstract classes need not define
a generic implmentation of methods they declare.

This enables one to define functions which accept arguments with a
certain ’interface’.

#### Dynamic dispatch

When a superclass and a subclass have a function of the same name f, it
is generally intended that subclass.f should be called when obj.f is
invoked, where obj is declared to be of the superclass type.

Some languages require this to specified explicitly using the keyword
virtual.

#### Multiple inheritance

In case multiple ancestors (along distinct inheritance paths) of a class
\(C\) define a method with the same name \(m\), the effect of the call
\(C.m\) needs to be disambiguated explicitly by the programmer: and the
programming language should ideally provide him the ability to do so.

In case of programming languages which do not allow this, one must
instead use interfaces with object composition as a way of sharing code.

### Prototyping-based languages

These do not provide a mechanism to explicitly define a class or
inheritance structure. Objects are created exclusively by cloning and
dynamically (at run-time) adding members - Classes/ inheritance are
implicitly defined in this process.

### Mutability

Some objects may be designed to be immutable (having unchangeable
state). Such objects may have ’state-altering’ methods which construct
and return an object with the altered state.

So, object-cloning is superfluous for such objects.

Example: Immutable maps, when return a copy of value objects to ensure
that the value is not modified.


### Class with optional members

Aka algebraic data-type. An algebraic data-type a class which is mostly
defined by the members it does and does not have. These members are
often set using constructors.

#### As inheritance tree

Often it is defined by an inheritence hierarchy.

eg: trait Tree; class BTree(lTree: Tree, value: Int, rTree: Tree)
extends Tree; class LeafNode(value: Int) extends Tree.

#### Use with pattern matching

An instant of an algebraic data type is often matched using a special
pattern matching construct provided by the language.

eg pseudo-scala-code:

    f(tree) = tree match {
    case BTree: print(tree.lTree) f(tree.lTree) f(tree.rTree)
    case LeafNode: print(tree.value)
    }

## Functions as objects

Functions can be used as arguments and return values. So, functions can
be regarded as objects.

Several languages provide excellent support for easily defining such
functions.

#### Functions acting on functions

Aka Higher order functions. Easy to define higher order functions: Eg:
\(\frac{d_{n}}{dx^{n}}\). So, one can conveniently pass a function as an
argument to another function.

#### Event driven programming

One can view some computation in terms of events and event listeners/
handlers/ callback functions which might handle them. A ’main loop’
keeps polling for events and dispatching events to the correct handler.
This can be easily realized with functional programming.

### Functions with non-local references

Aka closures.

With closures, a function definition may include references to non-local
variables. The function object is created/ updated anew just before it
is called, so that changes to the non-local variable alters the function
definition.

Some languages even allow the function definition to update the value of
these variables.

#### Extended function definition using decorator

Consider a higher order function h() accepting and returning a function.
The statements f = someFunction and f = h(f) is given syntactic sugar
using decorators: see python chapter for example.

### Partial application

From the definition of a function \(f\) over \(k\) arguments, one can
derive definitions of other functions depending on \(l<k\) arguments
which arise as a result of fixing a value to one of the arguments of
\(f\). Enabling this with simple syntax is an attractive feature in many
languages.

### Currying

Any such vector-domain function can be described as a function \(f'\)
acting on a scalar domain (corresponding to the first dimension of the
domain of \(f\)) and producing a  
vector-valued function: \(f':D \to G\), where
\(G = \set{D^{k_{in}-1} \to D^{k_{out}}}\) and \(f'(a) = g \in G\) such
that \(g\) corresponds to the partially applied function
\(f(x_1 = a, x_2 .. )\).

Doing this recursively, the entire computation can be written in terms
of scalar functions\!

#### Lambda calculus

Lambda calculus provides a good representation and manipulation rules
for considering computation in this way. It describes computation in
terms of formulae (unnamed functions) involving many variables, which
may be composed with each other; whose free variables may be bound to a
certain value etc..


### Iteration aids

Functional programming, in its purest form, does iteration using
recursions.

Plus, various higher-order functions which can be defined to act on
lists and iterators enable succinct definition of recursive computation.

#### Tail recursion

A tail recursion is a recursive function where the last statement
executed before the function exits (which is not necessarily the same as
the last statement in the function definition) involves a simple
recursive call. The value returned, if any, is simply the unmodified
result of this recursive call.

###### Reuse of stack space

Ordinarily an additional recursive call would involve addition of new
memory in the call-stack space. This can be avoided in this case by
simply reusing the stack-space already allocated to the calling
function. When the language standard does not demand it, but is
implemented by a certain compiler, this deserves to be called an
’optimization’; otherwise it is an integral feature of the language.

###### Advantage

This allows iteration to be written using a recursive call without the
penalty of using space linear in number of iterations.


## Functions without side effects

Computation is the evaluation of math functions.  
State changes outside the function, other than sending a return value is
not allowed: functions without side effects.

### Dependence on non-input values

To avoid side effects, some languages may force function behavior
depends purely on input: there is no access to higher-scope variables
(eg: global variables in C).

#### Closure restrictions

However, other languages may allow function-behavior to depend on
non-input values, but may not allow altering them within the function.
Eg: Matlab, R.

Such non-input and non-local variables and values in the function
definition are called free variables (- similar to the definition in
case of first order logic). These free variables may be bound (assigned
values) at run-time, just before the function is to be invoked.

Thus the precise definition of a function is finalized only at run-time
- So functions with free variables essentially define a function family
with a method for picking the right function from this family given some
values.

### Immutability of input

’Pass by reference’ is not allowed as that would allow code in the
function to have side-effects.

## Decision structures

The conciseness and clarity of expression of branching and iterative
operation in different languages is different.

### Branching

The if-else structure is the most basic decision structure, using which
more convenient decision structures like the if-elseif.. structure is
defined.

#### Matching a value

Different branches of execution often depend on different tests
performed over the value of an expression. This is provided in terms of
the ’match with various cases’ construct.

### Iterative operations

The essential ingredients of an iteration are the starting state, the
code to be executed and the termination condition.

#### Imperative loops

A basic imperative programming construct for iteration is the while
loop. To handle various specialized cases more concisely, constructs
such as C’s do-while and for loops are defined.

#### Recursion

The most basic functional programming construct for iteration is
recursion, with efficient reuse of the stack space using tail recursion
where possible. Concise definition of recursive functions is possible
with the use of branching based on matching values- as in Scala.

#### Declarative operations on lists

One can then define higher-order functions which operate on iterators
and lists leading to very concise statements. These are described
elsewhere.

## Type-generic definitions

One may define generic classes or functions in a generic way. Such
definitions accept a type parameter, apart from other values. Eg: class
List\[T\] may define a linked list which holds objects of type T.

## Specifying generators

These are functions which produce the ith element only on demand - a
sort of lazy evaluation. They lead to time savings.

These are often traversable only once. Some languages allow a succinct
notation for producing a list by executing some code for various
elements drawn from an iterator.

#### Set-builder syntax

Aka comprehension. This is not equivalent to a for loop in C, but a
consise way of specifying a list literal.

Eg: The for comprehension in scala.

## Application programming interface (API)

To aid rapid software development, many programming languages come with
libraries of objects and functions implementing common data structures
like collections, file parsing etc..

### Higher order functions for lists

Having an API with support for higher order functions acting on
iterators and lists enable writing concise code.

#### Map

map(iter, fn) applies the fn to each element produced by an iterator and
returns a iterator of results.

#### Filter

This produces an iterator with elements of another sequence which pass a
test specified by a certain function.

#### Transformation-types

In case of functions which produce new lists/ iterators such as maps,
fitlers, one might either want the transformations to take effect one at
a time while an element is being retrieved (lazy/ non-strict), or one
might want a function which produces the result list/ iterator fully
upon call. The former is more efficient (especially when avoiding
intermediate results when doing x.map().fitler..), while the latter may
be desirable to preserve modularity.

#### Fold

foldLeft(list, fn, b): Let head(list) be the first element in the list
and tail(list) be the list without its first element. Then, if list is
empty, foldLeft returns b; otherwise, foldLeft(tail(list), fn, fn(b,
head(list))) is returned.

foldRight: is a function which does the same, but from the other end of
the list: so one needs to modify definitions of head and tail
appropriately in the above description.


## Remote procedure call (RPC)

Allows a process (RPC client) to run a procedure within a remote process
(RPC server) is such a way that the programmer does not have to worry
about details of how the arguments/ results are communicated etc.. -
from the perspective of the programmer, this call should be as simple as
a local procedure call. In case of synchronous calls, the calling
process blocks until the remote procedure terminates and returns the
result.

### Pipeline

Client code - RPC client stub - RPC server stub - Server procedure.

Client code - client stub and server code - server stub calls are done
using normal (local) procedure invocation mechanisms. The purpose of
client stub and server stub is to communicate the arguments/ results
returned to/ from them by their respective processes - this involves
marhsalling locally received objects and unmarshalling messages from the
other stub into objects. Client stub - server stub communication is done
through an internal protocol which the calling function need not know.

## Exception handling

Here we only consider exception handling features specially built into
the language. For other constructs, like monads and error codes, see the
software architecture survey.

### try catch blocks

This is exemplified by the try - catch - finally block of Java.

#### Context handler classes

## Test framework

Desiderata for tests are listed in the software architecture survey.

Various test-cases may use a single object. So, to achieve speed, they
may share a test fixture, which contains the shared object - rather than
initialize it multiple times.
