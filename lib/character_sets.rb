# frozen_string_literal: true

# Defines sets of characters such as lowercase.
class CharacterSets
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
