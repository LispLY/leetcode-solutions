class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        return s.isEmpty ? 0 : (s == String(s.reversed()) ? 1 : 2)
    }
}

class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }

        var s = s
        while !s.isEmpty {
            let l = s.removeFirst()
            let r = s.popLast() ?? l
            if l != r {
                return 2
            }
        }
        return 1
    }
}