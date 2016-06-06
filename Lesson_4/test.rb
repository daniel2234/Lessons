arr = [1, 2, 3]

def joinor(arr, delimiter = ', ' , word = ' or ')
  arr[-1] = "#{word} #{arr.last}" 
  arr.join(delimiter)
end

joinor(arr)