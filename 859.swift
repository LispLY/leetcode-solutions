class Solution {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        // 长度相等
        // 恰好两个位置不相等
        // 看两个位置是否交叉相等
        
        // !!! 如果双方全等，并有一个重复的字母，也是可以的
        let a = Array(A)
        let b = Array(B)
        guard a.count == b.count else {
            return false
        }
        
        var diff = [Int]()
        for i in a.indices {
            if a[i] != b[i] {
                diff.append(i)
            }
        }
        
        switch diff.count {
        case 2:
            return a[diff[0]] == b[diff[1]] && a[diff[1]] == b[diff[0]]
        case 0:
            return Set(a).count < a.count // 表示有重复的字母
        default:
            return false
        }
        fatalError()
    }
}