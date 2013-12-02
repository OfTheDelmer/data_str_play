
	class Node
		attr_accessor :data, :next
		
		def initialize(data=nil)
			@data = data
		end
	end
	
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