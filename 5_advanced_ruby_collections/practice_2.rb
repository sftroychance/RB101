# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
#
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]
#
# A: sort_by keyed on 'published', which is a string, so need to call to_i
# (though it is superfluous in this case because the years will all be 4
# digits).
#
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort_by { |hash| hash[:published].to_i } # official solution same but leaves off to_i
# small note: 'book' would be a better name here for abstraction instead of
# 'hash'
