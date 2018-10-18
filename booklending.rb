

class Book
  @@on_shelf = []
  @@on_loan = []
  def self.create(title,author,isbn)
    new_book = Book.new(title,author,isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.current_due_date(due_book)
    @due_date =  Time.now + (3600*7*24) #book can be borrowed for 7 days
    return @due_date
  end
  def self.browse
    return @@on_shelf.sample
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    # puts 'i am here '
    return @@on_loan
  end

  def self.overdue
    over_due_books = []
    ctime = Time.now
    @@on_loan.each do |book|
      if book.due_date < ctime
        over_due_books << book
        # puts "#{lent_book.title}"
      end
    end
    return over_due_books

  end
  def initialize(title,author,isbn)

    @title = title
    @author = author
    @isbn = isbn
    @due_date = nil
  end

  def lent_out?(lent_book)
    if @@on_loan.include?(lent_book) == true
      return true
    else
      return false
    end
  end
  def borrow(borrow_book)
    if self.lent_out?(borrow_book) == true
        # puts " The book is not Available"
      else
        @due_date = Book.current_due_date(borrow_book)
        @@on_shelf.delete(borrow_book)
        @@on_loan << borrow_book
        # puts "The #{borrow_book} has been issued for lending"
        return true
    end
  end

  def return_to_library(book_ret)
    if book_ret.lent_out?(book_ret) == false
      return false
    else
      @@on_shelf << book_ret
      book_ret.due_date = nil
      return true
    end
  end

  def due_date=(due_date)
     @due_date = due_date
  end
  def due_date
    return @due_date
  end
  # Reader & writer methods
  attr_reader :title
  attr_reader :author
  attr_accessor :due_date
end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")



puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out?('Sister Outsider')# false
puts sister_outsider.borrow('Sister Outsider') # true
puts sister_outsider.lent_out?('Sister Outsider') # true
puts sister_outsider.borrow('Sister Outsider') # false
# puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out?('Sister Outsider') # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []
