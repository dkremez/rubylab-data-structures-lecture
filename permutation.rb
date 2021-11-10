def permutate(str, permutation = '')
  return [permutation] if str.empty?

  result = []
  str.each_char do |char|
    substr = str.chars.reject { |x| x == char }.join
    result.concat(permutate(substr, permutation + char))
  end
  result
end
