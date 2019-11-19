---
title: 15 Swift Task      
date: 2019-11-15 15:08:35
tags: swift, closure
category: swift
---

# Closure

<br>

### Optimize clousre

```swift
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
    let isAscending: Bool

    if s1 > s2 {
        isAscending = true
    } else {
        isAscending = false
    }

    return isAscending
}

let optimizedSomeClosure: (String, String) -> Bool = { $0 > $1 }

someClosure("apple", "banana")
// false
optimizedSomeClosure("apple", "banana")
// false

someClosure("banana", "apple")
// ture
optimizedSomeClosure("banana", "apple")
// ture

let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
    var count: Int = 0
    for _ in values {
        count += 1
    }
    return count
}

let optimizedOtherClosure: ([Int]) -> Int = { $0.count }

otherClosure([0, 1, 2, 3, 4])
optimizedOtherClosure([0, 1, 2, 3, 4])

otherClosure([0])
optimizedOtherClosure([0])
```

These functions might seem work differently but short form of closures are optimized so they return same value.