###
#	Cons List
###

class List 
	attr_accessor :items

	def initialize(*args)
		@items = digest(args)
	end

	def insertAfter(item, newItem, items=@items)
		if(items.car == item)
			items.cdr =  Cons.new(newItem, items.cdr)
		else
			insertAfter(item, newItem,items.cdr)
		end
	end

private
	def digest(items)
		if(items != [])
			return Cons.new(items.shift(), digest(items))
		elsif(items == [])
			return nil
		end
	end
end

class Cons
	attr_accessor :car, :cdr
	def initialize(car,cdr)
		@car=car
		@cdr=cdr
	end
end

	