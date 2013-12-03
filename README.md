# CS WEEK: Data Structures
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

* Use the idea of a **node** object that stores *two* attributes
* Define a linked list using this **node** concept
	* Should take a list of values/objects when constructed
	* Should create a **node** for each
		* Each **node** should store a reference to the **next node**
    * Recursively iterate through lists
		


Class Discussion of Pseudocode


		
		LinkedList
			def initialize(might take someVals)
				@head = nil
				@tail = nil
				
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
	
	# Without arbitrary args
	class List
		attr_accessor :head, :tail
		
		def initialize(head=nil)
			@head = head
			@tail = nil
		end
		
		def insert_first(val)
			# Create a list with next
			# current @head and @tail
			new_node = List.new(@head)
			new_node.tail = @tail
			
			# Update current head and
			# tail
			@head = val
			@tail = new_node
		end
	end



## Exercises/Lab for Linked Lists

1.) Write a function called `last` that finds the last node in the list.

2.) Write a function called `count` that gets the length of linked list. Don't use the `#count` method.

3.) Write a function called `average` that sums a linked list of numbers and divides it by the length.

4.) Write a function to `reverse` a linked list.

5.) Write a function called `palindrome` to take a linked list of vals and returns a list  that it reads the same way forward and backwards, i.e. `palindrome (1,2,3) => (1,2,3,3,2,1)`.

6.) Write a function to check if a linked list is a `palindrome`.


	

Now again with arbitrary arguments

	class List
		attr_accessor :head, :tail
		
		def initialize(*args)
			@head = args.pop
			@tail = nil
			
			process(args)
		end
		
		def insert_first(val)
			new_node = List.new(@head)
			new_node.tail = @tail
			
			@head = val
			@tail = new_node
		end	
			
	private
		def process(args)
			if !args.empty?
				x = args.pop()
				insert_first(x)
				process(args)
			end
		end
	end



Now with `#insertAfter`


	
	class List
		attr_accessor :head, :tail
		
		def initialize(*args)
			@head = args.pop
			@tail = nil
			
			process(args)
		end
		
		def insert_first(val)
			new_node = List.new(@head)
			new_node.tail = @tail
			
			@head = val
			@tail = new_node
		end	

		def insert_after(node, new_data, cur_nodes=self)
			if(cur_nodes.head == node)
				new_node = List.new(new_data)
				new_node.tail = cur_nodes.tail
				cur_nodes.tail = new_node
			else
				insert_after(node, new_data, cur_nodes.tail)
			end
		end
		
			
	private
		def process(args)
			if !args.empty?
				x = args.pop()
				insert_first(x)
				process(args)
			end
		end
	end

	
Let's integrate some of the solutions to the exercises

	class List
		attr_accessor :head, :tail
		
		def initialize(*args)
			@head = args.pop
			@tail = nil
			
			process(args)
		end
		
		def insert_first(val)
			new_node = List.new(@head)
			new_node.tail = @tail
			
			@head = val
			@tail = new_node
		end	

		def insert_after(node, new_data, cur_nodes=self)
			if(cur_nodes.head == node)
				new_node = List.new(new_data)
				new_node.tail = cur_nodes.tail
				cur_nodes.tail = new_node
			else
				insert_after(node, new_data, cur_nodes.tail)
			end
		end
		
		# Find the count
		def count
			if @tail == nil
				count = 1
			else
				count = 1 + @tail.count
			end
		end
			
		# Get the last item		
		def last
			if @tail == nil
				@head
			else 
				@tail.last
			end
		end
		
		# Reverse
		def reverse(new_list=List.new(@head), cur_list=@tail)
			if cur_list == nil
				new_list
			else	
				new_list.insert_first(cur_list.head)
				reverse(new_list,cur_list.tail)
			end
		end
	private
		def process(args)
			if !args.empty?
				x = args.pop()
				insert_first(x)
				process(args)
			end
		end
	end


	
## What is a Tree?


### Conceptual Overview

A tree is a *collection* of *nodes* in which every *node* is a child of another *node* unless it is the *root* node.

`binary_tree.rb`

	class BinTree 
		attr_accessor :root, :left, :right
		
		def initialize(rootVal)
			@root = rootVal
			@left = nil
			@right = nil
		end

		def addLeft(rootVal)
			@left = BinTree.new(rootVal)
		end

		def addRight(rootVal)
			@right = BinTree.new(rootVal)
		end
	end
`n_tree.rb`
	
	class Tree 
		attr_accessor :root, :children
		def initialize(rootVal)
			@root = rootVal
			@children = []
		end
		
		def addChild(rootVal)
			@children.push(Tree.new(rootVal))
		end
	end


## Excercise/Lab


1.) Find the number of nodes in a tree

2.) Print all the values in the tree

3.) Find the sum of the list items


