class Solution {
    func maxPower(_ s: String) -> Int {
        // 状态机：默认为1，与上一个字相同+1，不同重置为1
        var result = 1
        var len = 1
        for i in s.dropFirst().indices {
            len = s[i] == s[s.index(before: i)] ? len + 1 : 1
            result = max(result, len)
        }
        return result
    }
}

class Solution {
    func maxPower(_ s: String) -> Int {
        // 状态机：默认为1，与上一个字相同+1，不同重置为1
        var result = 1
        var len = 1
        var last = s.first!
        for c in s.dropFirst() {
            len = c == last ? len + 1 : 1
            result = max(result, len)
            last = c
        }
        return result
    }
}