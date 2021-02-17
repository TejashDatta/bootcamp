module ApplicationHelper
  def to_half_width_characters(string)
    string.tr("Ａ-Ｚ ａ-ｚ", "A-Z a-z")
  end
end

# helper.to_half_width_characters("Ｉｎ ｔｈｅ ａｂｏｖｅ")
