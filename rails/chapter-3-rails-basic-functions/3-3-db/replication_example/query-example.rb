ActiveRecord::Base.connected_to(role: :reading) do
  Blog.find(5)
end
