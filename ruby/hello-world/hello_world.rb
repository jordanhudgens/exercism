class HelloWorld
  def self.hello(arg = nil)
    return "Hello, #{arg}!" if arg
    return "Hello, World!" if arg.nil?
  end
end
