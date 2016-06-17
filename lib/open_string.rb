# frozen_string_literal: true

# Public: Provides extension methods for the built-in String class.
module OpenString
  # Public: Determines if self has the same sequence of characters as evaluated
  # from index 0 to self.length and from self.length to 0. This ignores
  # whitespace and casing.
  #
  # Returns true iff self contains the same sequence of characters forwards as
  # it does backwards.
  def palindrome?
    gsub(/\s+/, '').casecmp(reverse.gsub(/\s+/, '')) == 0
  end

  # Methods meant to be members of the String class need to go in here. The
  # machinery here is a little odd: since the +randomize+ declaration isn't
  # prefaced with a +self+, it doesn't look static. Once +String+ is set to
  # +extend OpenInteger::ClassMethods+, this is treated like a static String
  # method.
  #
  # If this inner module wasn't created and, instead, String was set to
  # +include OpenString+, consumers would need to call static methods via
  # +OpenString+ like so: +OpenString.randomize(10, CharacterSets.all)+.
  module ClassMethods
    # Public: Generates a randomized string of a length specified by +length+.
    #
    # +length+::    The number of characters to include in the string
    # +*charsets+:: Arrays of character sets to use in generating the random
    #   string. This can take array literals, variables, or constants. Some
    #   character sets are predefined in test/support/character_sets.rb
    #
    # ---
    # :section: Examples
    # # Generates a 10-character string using only lowercase letters
    # str = String.randomize(10, CharacterSets.lowercase)
    #
    # # Generates a 5-character string using only ['a', 's', 'd', '1', '2', '3']
    # str = String.randomize(5, %w(a s d 1 2 3))
    # ---
    def randomize(length, *charsets)
      raise(ArgumentError,
            'Do not pass nil for length.') if length.nil?
      raise(ArgumentError,
            'Length must be a non-zero positive integer.') if length < 1
      raise(ArgumentError,
            'Specify a character set.') if charsets.empty?

      Array.new(length) { charsets.flatten.sample }.join
    end
  end

  # Defines sets of characters such as lowercase.
  module CharacterSets
    def self.lowercase
      %w( a b c d e f g h i j k l m n o p q r s t u v w x y z )
    end

    def self.uppercase
      %w( A B C D E F G H I J K L M N O P Q R S T U V W X Y Z )
    end

    def self.numbers
      %w( 0 1 2 3 4 5 6 7 8 9 )
    end

    def self.specials
      %w{ ~ ! @ # $ % ^ & * ( ) - _ = + [ ] < > ; : ' " , . ? \ | / }
    end

    def self.all
      lowercase + uppercase + numbers + specials
    end
  end
end

# Public: Mixing OpenString extensions into String.
class String
  include OpenString
  extend OpenString::ClassMethods
  extend OpenString::CharacterSets
end
