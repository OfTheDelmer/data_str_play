####
#	Head Tail list
####
class HashyList 
	def initialize(*args)
		@first=nil
		@next=nil
		@items = {}
		args != [] ? digest(args) : @items[@first] = @next
	end

	def insertAfter(item, newItem)
		if( @items[item] )
			oldItem = @items[item]
			@items[item] = newItem
			@items[newItem] = oldItem
		end
	end
	def insertFirst(item)
		@items[item] = @first
		@first = item
	end

	def first
		@first
	end

	def next
		@items[@next]
	end

private
	def digest(items)
		if(items != [])
			@next = @first
			@first = items.pop()
			@items[@first] = @next
		  digest(items)
		end
	end
end