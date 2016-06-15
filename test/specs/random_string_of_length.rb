# frozen_string_literal: true

require File.expand_path '../../helpers/helper', __FILE__

rand_size = 1 + rand(1_000)

describe 'custom character sets' do
  custom_characters = %w(3 x A M p 1 e C h @ r $)
  custom_string = OpenString.randomize(rand_size, custom_characters)

  it 'generates a string using only the custom character set' do
    assert_match(/[3xAMp1eCh@r$]+/, custom_string)
  end

  it 'cannot generate strings with any other characters' do
    refute_match(/[^3xAMp1eCh@r$]+/, custom_string)
  end
end

describe 'uppercase and lowercase character sets' do
  upper_lower_string = OpenString.randomize(rand_size,
                                            CharacterSets.uppercase,
                                            CharacterSets.lowercase)

  it 'may generate strings with lowercase letters' do
    assert_match(/[a-z]?/, upper_lower_string)
  end

  it 'may generate strings with uppercase letters' do
    assert_match(/[A-Z]?/, upper_lower_string)
  end

  it 'cannot generate strings with digits' do
    refute_match(/\d/, upper_lower_string)
  end

  it 'cannot generate strings with non-word characters' do
    refute_match(/\W/, upper_lower_string)
  end

  it 'cannot generate strings with underscores' do
    refute_match(/_/, upper_lower_string)
  end
end

describe 'all character sets' do
  all_string = OpenString.randomize(rand_size, CharacterSets.all)

  it 'may generate strings with uppercase letters' do
    assert_match(/[a-z]?/, all_string)
  end

  it 'may generate strings with uppercase letters' do
    assert_match(/[A-Z]?/, all_string)
  end

  it 'may generate strings with digits' do
    assert_match(/\d?/, all_string)
  end

  it 'may generate strings with non-word characters' do
    assert_match(/\W?/, all_string)
  end

  it 'may generate strings with underscores' do
    assert_match(/_?/, all_string)
  end
end

describe 'special character set' do
  special_string = OpenString.randomize(rand_size, CharacterSets.specials)

  it 'cannot generate strings with uppercase letters' do
    refute_match(/[a-z]/, special_string)
  end

  it 'cannot generate strings with uppercase letters' do
    refute_match(/[A-Z]/, special_string)
  end

  it 'cannot generate strings with digits' do
    refute_match(/\d/, special_string)
  end

  it 'generates strings with non-word characters' do
    assert_match(/\W/, special_string)
  end

  it 'may generate strings with underscores' do
    assert_match(/_?/, special_string)
  end
end

describe 'number character set' do
  number_string = OpenString.randomize(rand_size, CharacterSets.numbers)

  it 'cannot generate strings with uppercase letters' do
    refute_match(/[a-z]/, number_string)
  end

  it 'cannot generate strings with uppercase letters' do
    refute_match(/[A-Z]/, number_string)
  end

  it 'generates strings with digits' do
    assert_match(/\d/, number_string)
  end

  it 'cannot generate strings with non-word characters' do
    refute_match(/\W/, number_string)
  end

  it 'cannot generate strings with underscores' do
    refute_match(/_/, number_string)
  end
end

describe 'uppercase character set' do
  uppercase_string = OpenString.randomize(rand_size, CharacterSets.uppercase)

  it 'cannot generate strings with uppercase letters' do
    refute_match(/[a-z]/, uppercase_string)
  end

  it 'generates strings with uppercase letters' do
    assert_match(/[A-Z]/, uppercase_string)
  end

  it 'cannot generate strings with digits' do
    refute_match(/\d/, uppercase_string)
  end

  it 'cannot generate strings with non-word characters' do
    refute_match(/\W/, uppercase_string)
  end

  it 'cannot generate strings with underscores' do
    refute_match(/_/, uppercase_string)
  end
end

describe 'lowercase character set' do
  lowercase_string = OpenString.randomize(rand_size, CharacterSets.lowercase)

  it 'generates strings with lowercase characters' do
    assert_match(/[a-z]+/, lowercase_string)
  end

  it 'cannot generate strings with uppercase characters' do
    refute_match(/[A-Z]+/, lowercase_string)
  end

  it 'cannot generate strings with digits' do
    refute_match(/\d/, lowercase_string)
  end

  it 'cannot generate strings with non-word characters' do
    refute_match(/\W/, lowercase_string)
  end

  it 'cannot generate strings with underscores' do
    refute_match(/_/, lowercase_string)
  end
end

describe 'randomize' do
  it 'returns a string of the correct length' do
    (1..1_000).each do |n|
      str = OpenString.randomize(n, CharacterSets.lowercase)
      assert_equal n, str.length
    end
  end

  it 'raises ArgumentError when receiving no character set' do
    assert_raises ArgumentError do
      OpenString.randomize(10)
    end
  end

  it 'raises ArgumentError when receiving a nil length' do
    assert_raises ArgumentError do
      OpenString.randomize(nil, CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving an empty string length' do
    assert_raises ArgumentError do
      OpenString.randomize('', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving all white space for length' do
    assert_raises ArgumentError do
      OpenString.randomize('     ', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving no arguments' do
    assert_raises ArgumentError do
      OpenString.randomize
    end
  end

  it 'raises ArgumentError when receiving a numerical string length' do
    assert_raises ArgumentError do
      OpenString.randomize('10', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving mixed letters and numbers length' do
    assert_raises ArgumentError do
      OpenString.randomize('abc123', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving all letters for length' do
    assert_raises ArgumentError do
      OpenString.randomize('abc', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving mixed special and letter length' do
    assert_raises ArgumentError do
      OpenString.randomize('!@#abc', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving mixed special and number length' do
    assert_raises ArgumentError do
      OpenString.randomize('!@#123', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving all special characters length' do
    assert_raises ArgumentError do
      OpenString.randomize('!@#', CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving a length of 0' do
    assert_raises ArgumentError do
      OpenString.randomize(0, CharacterSets.lowercase)
    end
  end

  it 'raises ArgumentError when receiving a negative number for length' do
    assert_raises ArgumentError do
      OpenString.randomize(0 - rand(1_000), CharacterSets.lowercase)
    end
  end
end
