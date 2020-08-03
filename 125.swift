// passed

class Solution {
    // lowercased
    // 双指针直到右边的小于等于左边的
    func isPalindrome(_ s: String) -> Bool {
        let s = s.lowercased().filter { $0.isLetter || $0.isNumber } // 可以在双指针走路时判断，那样更快，这样更清晰
        if s.isEmpty { return true }
        var leftIndex = s.startIndex
        var rightIndex = s.index(before: s.endIndex)
        while leftIndex < rightIndex {
            if s[leftIndex] != s[rightIndex] {
                return false
            }
            leftIndex = s.index(after: leftIndex)
            rightIndex = s.index(before: rightIndex)
        }
        return true
    }
}

// test

Solution().isPalindrome("0P")

