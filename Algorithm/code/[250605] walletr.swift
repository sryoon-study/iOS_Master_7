func solution(_ sizes: [[Int]]) -> Int {
  var maxSize: (width: Int, height: Int) = (.min, .min)
  for size in sizes {
    maxSize.width = max(max(size[0], size[1]), maxSize.width)
    maxSize.height = max(min(size[0], size[1]), maxSize.height)
  }
  return maxSize.width * maxSize.height
}


//https://school.programmers.co.kr/learn/courses/30/lessons/86491?language=swift