def to_hex(red, green, blue)
    [red, green, blue].reduce('#') do |hexadecimal_color_code, color_value|
        hexadecimal_color_code += color_value.to_s(16).rjust(2, '0').upcase
    end
end

def to_ints(hexadecimal_color_code)
    *color_values = hexadecimal_color_code[1, 2], hexadecimal_color_code[3, 2], hexadecimal_color_code[5, 2]
    color_values.map(&:hex)
end