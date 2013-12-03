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