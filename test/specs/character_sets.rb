require File.expand_path '../../helpers/helper', __FILE__

specials = %w{ ~ ! @ # $ % ^ & * ( ) - _ = + [ ] < > ; : ' " , . ? \ | / }

describe 'contents of String::CharacterSets.lowercase' do
  it 'contains no uppercase letters' do
    refute_empty(Array('A'..'Z') - CharacterSets.lowercase)
  end

  it 'contains only lowercase letters' do
    assert_empty(Array('a'..'z') - CharacterSets.lowercase)
  end

  it 'contains no special characters' do
    refute_empty(specials - CharacterSets.lowercase)
  end

  it 'contains no numbers' do
    refute_empty(Array('0'..'9') - CharacterSets.lowercase)
  end
end

describe 'contents of String::CharacterSets.numbers' do
  it 'contains no uppercase letters' do
    refute_empty(Array('A'..'Z') - CharacterSets.numbers)
  end

  it 'contains no lowercase letters' do
    refute_empty(Array('a'..'z') - CharacterSets.numbers)
  end

  it 'contains no special characters' do
    refute_empty(specials - CharacterSets.numbers)
  end

  it 'contains only numbers' do
    assert_empty(Array('0'..'9') - CharacterSets.numbers)
  end
end

describe 'contents of String::CharacterSets.specials' do
  it 'contains no uppercase letters' do
    refute_empty(Array('A'..'Z') - CharacterSets.specials)
  end

  it 'contains no lowercase letters' do
    refute_empty(Array('a'..'z') - CharacterSets.specials)
  end

  it 'contains only special characters' do
    assert_empty(specials - CharacterSets.specials)
  end

  it 'contains no numbers' do
    refute_empty(Array(0..9) - CharacterSets.specials)
  end
end

describe 'contents of String::CharacterSets.uppercase' do
  it 'contains only uppercase letters' do
    assert_empty(Array('A'..'Z') - CharacterSets.uppercase)
  end

  it 'contains no lowercase letters' do
    refute_empty(Array('a'..'z') - CharacterSets.uppercase)
  end

  it 'contains no special characters' do
    refute_empty(specials - CharacterSets.uppercase)
  end

  it 'contains no numbers' do
    refute_empty(Array('0'..'9') - CharacterSets.uppercase)
  end
end
