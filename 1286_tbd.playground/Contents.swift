// 1286
// to be done

// 1 原来的审题错了，不是排列，是组合
// 2 时间留的不够
// 3 目前bug，最后一位的处理逻辑有问题

/*
 思路
 限制：全部字母的集合，已经被使用的字母
 迭代：
    从最后一位向前
        最后一位替换成它的的<下一个可用字母>，如果没有，前进至前一位

 <下一个可用字母>
    排序字母表中，从当前字母开始问：是否已被占用？
        没占用：bingo
        已占用：继续...

 复杂度：A(m,n)  m!/(m-n)!
    莫非接近 m^m * m * n

 */

class CombinationIterator {
    let letters: [Character]
    let len: Int
    var cur: [Character]?

    init(_ characters: String, _ combinationLength: Int) {
        letters = Array(characters)
        cur = Array((Array(characters))[0..<combinationLength])
        len = combinationLength
    }

    func next() -> String {
        // cur 从后向前遍历，把cur变成set，
        guard let last = cur else {
            fatalError("No more combinations!")
        }

        for (i, c) in last.reversed().enumerated() {
            let cIndex = letters.firstIndex(of: c)!
            let prefix = last.dropLast(i+1)
            for letterIndex in (cIndex+1)..<letters.count {
                let letter = letters[letterIndex]
                if !prefix.contains(letter) {
                    self.cur = finish(Array(prefix) + [letter])
                    print("last: ", last)
                    return String(last)
                }
            }
        }
        self.cur = nil
        return String(last)
    }

    func finish(_ prefix: [Character]) -> [Character]? {
        print("prefix ", prefix)
        var result = Array(prefix)
        for _ in prefix.count..<len {
            let cIndex = letters.firstIndex(of: prefix.last!)!
            for i in (cIndex+1)..<letters.count {
                if !result.contains(letters[i]) {
                    result.append(letters[i])
                    break
                }
            }
        }
        return result.count == len ? result : nil
    }

    func hasNext() -> Bool {
        return cur != nil
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */

let o = CombinationIterator("abcdefg", 3)
for _ in 0..<35 {
    print(o.hasNext(), o.next())
}



// 倒序
// 在 characters 里面选数，L个数里找C个
//1234
//123
//124
//134
//234
// 每次最小的指针遍历完后，下一个接着遍历

//class CombinationIterator {
//    var all = [String]()
//    var index = 0
//
//    init(_ characters: String, _ combinationLength: Int) {
//        var pointers = Array(0..<combinationLength)
//        while true {
//            <#code#>
//        }
//
//
//        for _ in 0..<combinationLength { // 找洞的轮数
//            var place = combinationLength
//            for <#item#> in <#items#> {
//                <#code#>
//            }
//        }
//    }
//
//    func next() -> String {
//
//    }
//
//    func hasNext() -> Bool {
//
//    }
//}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
