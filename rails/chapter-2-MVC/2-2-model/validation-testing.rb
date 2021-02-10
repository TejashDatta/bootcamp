# run in rails c

book = Book.find(1)
book.name = 'a' * 30
book.valid?
book.save
book.save!
# also create! update!

book.errors.full_messages
