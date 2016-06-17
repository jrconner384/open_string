require File.expand_path '../../helpers/helper', __FILE__

describe 'palindrome?' do
  it 'identifies single-word palindromes using all lowercase' do
    assert('deified'.palindrome?)
  end

  it 'identifies single-word palindromes using all uppercase' do
    assert('DEIFIED'.palindrome?)
  end

  it 'identifies single-word palindromes with inconsistent casing' do
    assert('Deified'.palindrome?)
  end

  it 'identifies palindrome phrases using all lowercase' do
    assert('never odd or even'.palindrome?)
  end

  it 'identifies palindrome phrases using all uppercase' do
    assert('NEVER ODD OR EVEN'.palindrome?)
  end

  it 'identifies palindrome phrases with inconsistent casing' do
    assert('Never Odd Or Even'.palindrome?)
  end
end
