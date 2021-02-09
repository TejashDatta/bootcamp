Book.sales_statuses

book = Book.first

book.sales_status = 0
book.sales_status = :reservation
book.sales_status = 'reservation'
book.end_of_print!

book.now_on_sale?

book.sales_status
book.sales_status_before_type_cast

# scope
Book.reservation
Book.not_now_on_sale
