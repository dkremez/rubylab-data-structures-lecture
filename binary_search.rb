def binary_search(n, arr)
  middle = arr.length / 2
  low = 0
  high = arr.length - 1

  while low < high
    if arr[middle] == n
      return true
    elsif arr[middle] < n
      low = middle
    else
      high = middle
    end

    middle = low + high / 2
  end
  false
end
