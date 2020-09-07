// passed

// 另外的 online 方法：pattern 和 str 都维护一个字典。一边遍历一遍检查字典。

class Solution {
    // 给 pattern 和 str 的 element 分别编号，判断编号是否相等
    // O(m*n) n是总长度，m是字符个数，使用字典可以缩短到O(m)
    func rawPattern<Element>(_ seq: Array<Element>) -> [Int] where Element: Equatable {
        var curPattern = [Element]()
        var res = [Int]()
        for e in seq {
            if let index = curPattern.firstIndex(of: e) {
                res.append(index)
            } else {
                curPattern.append(e)
                res.append(curPattern.count-1)
            }
        }
        return res
    }
    
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let s = str.split(separator: " ")
        let p = Array(pattern)
        return rawPattern(s) == rawPattern(p)
    }
}