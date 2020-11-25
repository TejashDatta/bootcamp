class Category
  def initialize(name:, slug:)
    @name = name
    @slug = slug
  end

  def display
    puts "#{@name}: #{@slug}"
  end
end
