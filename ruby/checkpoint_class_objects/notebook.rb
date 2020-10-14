class Notebook
  attr_accessor :content

  def initialize(content = '')
    @content = content
  end

  def write(content)
    @content << content
  end

  def backspace(erase_length)
    @content[-erase_length, erase_length] = ''
  end
end

daily_journal = Notebook.new
daily_journal.write("12/10: Had a good day today!\n")
daily_journal.backspace(3)
puts daily_journal.content
