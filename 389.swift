// passed

// 也可以使用异或，因为除了要找的字母外，其它的都成对出现

class Solution1 {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let tsum = t.utf8.reduce(0, &+) // overflows
        let ssum = s.utf8.reduce(0, &+)
        
        return Character(Unicode.Scalar(tsum &- ssum))
    }
}

class Solution2 {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var sum = Array(repeating: 0, count: 26)
        let a = Int(Character("a").asciiValue!)
        for c in s {
            sum[Int(c.asciiValue!)-a] += 1
        }
        for c in t {
            sum[Int(c.asciiValue!)-a] -= 1
        }
        let ascii = sum.firstIndex { $0 < 0 }! + a
        return Character(Unicode.Scalar(ascii)!)
    }
}