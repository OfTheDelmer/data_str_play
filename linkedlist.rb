
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
		
		def nodes 
			newNode = Node.new(@head)
			newNode.next = @tail
			newNode
		end
		def insertAfter(node, new_data, cur_nodes=self.nodes())
			if(cur_nodes.data == node)
				newNode = Node.new(new_data)
				newNode.next = cur_nodes.next
				cur_nodes.next = newNode
			else
				insertAfter(node, new_data,cur_nodes.next)
			end
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