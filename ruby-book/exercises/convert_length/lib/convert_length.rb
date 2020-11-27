UNITS = {m: 1.0, in: 39.37, f: 3.28}

def convert_length(length, from:, to:)
  (length * UNITS[to] / UNITS[from]).round(2)
end