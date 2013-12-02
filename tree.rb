class Node 
	attr_accessor :parent, :children, :data
	def initialize(data=nil, parent=nil)
	  @children = nil
  	parent != nil ? parent.addChild(data): @data = data
	end 

  def addChild(child)
  	newNode = Node.new(child)
  	@lastChild = newNode
  	if(@children == nil)
  		@children = [newNode]
  	else
  		@children.push(newNode)
  	end
  	newNode.parent = lambda { self }
 		newNode
 	end
end

class Tree 
	attr_accessor :lastNode, :rootNode
	def initialize()
 	 @rootNode = nil
	end

 
	def insert(data, parent=nil)
		if (@rootNode == nil )
			newNode = Node.new(data)
			@rootNode = newNode
		elsif (parent != nil) 
			newNode = Node.new(data, parent)
		else 
			newNode = @lastNode.addChild(data)
		end
  	@lastNode = newNode
  end
 end