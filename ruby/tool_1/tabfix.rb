class TabFix
  def initialize(target_file)
    @file_name = target_file
  end

  # returns string to replace
  # 交換べき文字や文字列を返す
  # タブとスペース文字は混じっていない、スペース文字の数は一貫してると前提する
  def identify_indent
    IO.foreach(@file_name) do |line|
      case line[0]
      when "\t"
        "\t"
      when ' '
        ' ' * line[/\A */].size
      end
    end
  end

  def replace_character(target_character)
    # read file, use regex to replace tab and space at beginning of file, write to file
  end
end
