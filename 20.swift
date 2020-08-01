// passed

class Solution {
    let left: Set = Set("([{")
    let right: Set = Set(")]}")
    
    func matches(_ l: Character, _ r:Character) -> Bool {
        return (l == "(" && r == ")") ||
               (l == "[" && r == "]") ||
               (l == "{" && r == "}")
    }
    
    func isValid(_ s: String) -> Bool {
        var pending = [Character]()
        for c in s {
            if left.contains(c) {
                pending.append(c)
            } else if right.contains(c) {
                if let l = pending.popLast() {
                    if !matches(l, c) { // 左右匹配
                        return false
                    }
                } else { // 多余的右括号
                    return false
                }
            }
        }
        return pending.isEmpty // 多余的左括号
    }
}

// test
print(Solution().isValid("[][]{}"))
 