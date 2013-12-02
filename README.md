# CS WEEK: Data Strucutures
## Intro to Linked Lists and Trees

* What is Computer Science?
	* Types of knowledge
* Why Data Structures?
	* Background Checkpoint
		* What are some familiar data structures… 
		* What are some means of combination… 
		* What are some means of abstracting… 
* What is a linked List?
* What is a Tree?
	
	

## What is Computer Science?

> Is "Computer Science" all science?

No, it's really not all science as much as it is about "engineering or art," and on that note it's not so much about computers either. 

#### Types Of Knowledge

It might help to categorize your reasoning into two groups.

* Imperative Knowledge
>	Your "how to" knowledge, i.e. your description for how to make something.
	
* Declaritive Knowledge
>   Your "what is true" knowledge, i.e. what definitions you have to describe something.
	
We put both these resources together to conjure descriptions of procedures using our language.

We can harness the power of our language and handle complexity we make use of 

* `Primitives`, basic experssions or tools in languages
* `Combination`, using expressions together 
* `Abstraction`, we take some repeatable expressions or procedures and give them a name to be use like any other simple expression. 


## Why Data Structures?

Some check points for "Good Programming" practices should include
____
| Best Practices |
| :-- |
| *Code Design* <-- Starts here |
| Debugging |
| Documentation |
| Evaluation and Verification |
| Thinking about data types |

_____

To address *Code Design* you have to begin discussing *Data Structures* and their use in your language of choice.

### Background Checkpoint

1
----
> What are some **data structures** you know? Give the language.
> How have you used them? What are some **control flow structures** you know?

---

### Ruby (Data Structures)

* Strings
* Symbols
* Ranges
* Booleans
* Ints
* Floats
* Arrays
* Hashes

…

### Javascript (Data Structures)

* Strings
* Booleans
* Number
* Arrays
* Objects like hashes

…



----

### Ruby ([Some Control Flow Structures](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Control_Structures))

* Conditionals 
	* if, elsif, else, unless, ...
* Loops
	* until, while, ... 
* iterators,
	* .each, for…
* Exceptions..
	
… 



### Javascript ([Some Control Flow Structures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Statements))

* Conditionals 
	* if, else if, else, switch, ...
* Loops
	* do-while, while,  ... 
* iterators,
	* for-in, for each, ...
* Exceptions..

...


----

2
----
> What are some ways you've combined these structures together? 

----

Think Hashes of hashes, arrays of arrays, arrays of hashes, or choose your own adventure.

-----

3
---
> What are some means of abstraction you know? Give the language? How have you used them?

----




### Ruby

* variables
* functions
* classes
* methods

...
### [Javascript](http://bonsaiden.github.io/JavaScript-Garden/)

* variables
* functions
* prototypes
* methods

...

You should be familiar with most of these concepts from both languages and understand how to use them. *The abstract power of these lies in giving **names** to our own objects or procedures*. 

> Giving names to things gives us power over them in our language.


Of course, once you *name* some pattern you naturally increase the number of things you know to be true and how to use them together. 

Some Wikipedia links:

* [OOPS](http://en.wikipedia.org/wiki/Object-oriented_programming)
* [Seperation of Concerns](http://en.wikipedia.org/wiki/Separation_of_concerns)
* [Classes](http://en.wikipedia.org/wiki/Class-based_programming)
* [Prototypes](http://en.wikipedia.org/wiki/Prototype-based_programming)
* [Functional Programming](http://en.wikipedia.org/wiki/Functional_programming)
* [Logic Programming](http://en.wikipedia.org/wiki/Logic_programming)

## What is a Linked List?

### Conceptual Overview

A linked list a *collection* of **items** where each *item* in the collection in an object with two attributes a *value* and a *reference* to the *next* item, and the last item has a **nil** reference.

    [ValOne,nextRef] [ValTwo,nextRef] [LastVal,nillRef]
	 ---------		   --------            ----------
	|	  |	_ |    \  |	    | _ |    \    |    |\\ //|
	|  1  ||_====== ) |  2  ||_====== ) … | 5  | ) ( |
	|     |   |    /  |     |   |    /    |    |// \\|
	 ---------	       ---------           ----------

### How to make one?

----
Outline

* Define some **node** object that stores *two* attributes
* Define a linked list using these **node** objects
	* Should take a list of values/objects when constructed
	* Should create a **node** for each
		* Each **node** should store a reference to the **next node**
		


Class Discussion of Pseudocode

		Node
			def initialize(data)
				// Set value equal to data
				// Set next_node to nil	
			end
			
			def getNext
				// Return next_node reference
			end
			
			def setNext(someNode)
				// Set next_node equal to someNode
			end
		end
		
		
		LinkedList
			def initialize(might take someVals)
				@head = new Node(nil)
				@tail = @head.next_node
				
				// Start process for turning
				//	someVals into nodes, and
				//	set items = process(someVals)
			end
			
			def insertFirst(someVal)
				// create new Node of @head 
				// set next of new Node to @tail
				// set @head to someVal
				// set @tail to new Node 
			end

			// Assuming someVals is an array
			def process(someVals)
				if(someVals not empty)
					// pop someVal
					// creat new Node using popped val
					// return  with Node.setNext
					// to the node return from process
					// of remainingVals
				elsif(items is empty)
					// return nil
				end
			end

Hmm… That's a rough idea. Note, it doesn't mention count. Let's refine this using Ruby.


`LinkedList.rb`


	class Node
		attr_accessor :data, :next
		
		def initialize(data=nil)
			@data = data
		end
	end
	
	# Without arbitrary args
	class List
		attr_accessor :head, :tail
		attr_reader :count
		
		def initialize
			@head = Node.new
			@tail = @head.next
			@count = 0
		end
		
		def insertFirst(val)
			new_node = Node.new(@head)
			new_node.next = @tail
			@head = val
			@tail = new_node
			@count += 1
		end
	end
	

Now again with arbitrary arguments

		# Without arbitrary args
	class List
		attr_accessor :head, :tail
		attr_reader :count
		
		def initialize(*args)
			@head = Node.new
			@tail = @head.next
			@count = 0
			process(args)
		end
		
		def insertFirst(val)
			new_node = Node.new(@head)
			new_node.next = @tail 
			@head = val
			@tail = new_node
			@count += 1
		end
		
	private
		def process(args)
			if !args.empty?
				x = args.pop()
				insertFirst(x)
				process(args)
			end
		end
	end




## What is a Tree?


