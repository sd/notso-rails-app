#==============================================================================
# Array slice and dice - by Sebastian Delmont <sd@notso.net>
#==============================================================================

# You have an array with 99 elements, and you want to display it in 3 columns,
# with the first column having the first tier of elements, and so on.
# 
# (1..99).to_a.slice_in(3) 
#    # => [[1, 2, ..., 32, 33], [34, 35, ..., 65, 66], [67, 68, ..., 98, 99]]
#
# The first column will always get the next additional element, 
# then the second column and so on.
#
# (1..3).to_a.slice_in(2)  # => [[1, 2], [3]]
# (1..4).to_a.slice_in(2)  # => [[1, 2], [3, 4]]
# (1..8).to_a.slice_in(3)  # => [[1, 2, 3], [4, 5, 6], [7, 8]]
#
class Array
  def slice_in(n)
    buckets = []
    bucket_size = (self.size / n) + (self.size % n == 0 ? 0 : 1)
    start = 0
    while start < self.size
      buckets << self[start..(start + bucket_size - 1)]
      start = start + bucket_size
    end
    buckets
  end
end


# Now suppose you have an array with 99 elements, and you want to display in
# three columns, but you have to output those columns in rows.
#
# (1..100).to_a.dice_in(3)
#   # => [[1, 34, 67], [2, 35, 68], ..., [33, 66, 99]]
#
# In other words, dice_in is a transposed version of slice_in
class Array
  def dice_in(n, compact = false)
    bucket_size = (self.size / n) + (self.size % n == 0 ? 0 : 1)
    
    buckets = self.slice_in(n).collect {
      |bucket| bucket.fill(nil, bucket_size, 0)
    }.transpose
    
    buckets.collect! {|bucket| bucket.compact} if compact
    buckets
  end
end
