class Book < ApplicationRecord
  validates :name, :author_name, :year_published, :publisher, presence: true
  validates :name, :author_name, :publisher, length: { minimum: 2, maximum: 35 }
end
