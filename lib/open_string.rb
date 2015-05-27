# Public: Provides extension methods for the built-in String class.
module OpenString
  # Public: Determines if self has the same sequence of characters as evaluated
  # from index 0 to self.length and from self.length to 0
  #
  # Returns true iff self contains the same sequence of characters forwards as
  # it does backwards.
  def palindrome?
    self == reverse
  end
end

# Public: Mixing OpenString extensions into String.
class String
  include OpenString
end
