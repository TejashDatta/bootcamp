class Notebook
  attr_accessor :content

  def initialize(content = '')
    @content = content
  end

  def write(content)
    @content << content
  end

  def erase(no_of_characters)
    @content[-no_of_characters, no_of_characters] = ''
  end
end

daily_journal = Notebook.new
daily_journal.write("12/10: Had a good day today!\n")
daily_journal.erase(3)
puts daily_journal.content
