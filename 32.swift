// O(n)
class Solution1 {
    func longestValidParentheses(_ s: String) -> Int {
        // 记录每个左括号的index，用右括号消掉它。
        // 消掉时，局部解就是剩余左括号的下一个index；如果没有剩余左括号，那就是从 index 0 开始
        
        let l = Array(s)
        
        var left = [Int]()
        var res = 0
        var leftBound = -1
        for i in l.indices {
            if l[i] == "(" {
                left.append(i)
            } else if !left.isEmpty {
                left.popLast()
                res = max(res, i - (left.last ?? leftBound))
            } else { // 多余的右括号
                leftBound = i
                left.removeAll()
            }
        }
        return res
    }
}

// O(n^2)
class Solution2 {
    func longestValidParentheses(_ s: String) -> Int {
        // 以暴力法为基础，发现多余的右括号，就从下一个左括号开始继续
        var res = 0
        let l = Array(s)
        var start = 0
        while start < l.endIndex {
            var left = 0
            var this = start
            while left >= 0, this < l.endIndex {
                left += (l[this] == "(" ? 1 : -1)
                if left == 0 {
                    res = max(res, this - start + 1)
                }
                
                // 小小的优化，跳过多余的右括号
                if left < 0 {
                    start = this
                    break
                }
                
                this += 1
            }
            start += 1
        }
        return res
    }
}