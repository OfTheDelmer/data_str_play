class Tree
  attr_accessor :children, :value

  def initialize(v,parent=nil)
    @value = v
    @children = []
    @parent = lambda { parent }
  end

  def addChild(v)
  	newTree = Tree.new(v,self)
  end

  def parent
  	 @parent.call()
  end

  def parent=(other)
  	@parent = lambda {other}
  end
end