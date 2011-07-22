def sift(a, start, count)
  root = start
  while (root * 2) + 1 < count
    child = (root * 2) + 1
    if child < (count - 1) && a[child] < a[child + 1]
      child += 1
    end
    if a[root] < a[child]
      a[root], a[child] = a[child], a[root]
      a.log
      root = child
    else
      return
    end
  end
end

def heapsort(a)
  a.start_logging

  start = a.length / 2 - 1
  finish = a.length - 1
  while start >= 0
    sift(a, start, a.length)
    start -= 1
  end
  while finish > 0
    a[finish], a[0] = a[0], a[finish]
    a.log
    sift(a, 0, finish)
    finish -= 1
  end

  a
end