array_2D = [[1, 2, 3],
            [4, 5, 6]]

position_of_5 = catch(:found) do
  array_2D.each_with_index do |row, row_index|
    row.each_with_index do |value, column_index|
      throw(:found, [row_index, column_index]) if value == 5
    end
  end
end

p position_of_5
