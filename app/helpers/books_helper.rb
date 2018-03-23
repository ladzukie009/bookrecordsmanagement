module BooksHelper
  def date_formatter(date)
    date.try(:strftime,  "%Y")
  end
end
