// 因为解空间比较小，用 trie 有点用力过猛了

// 直接用集合(也可以用字典，可以省掉一个Set)
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let l = Array(s)
        guard l.count >= 10 else { return [] }
        
        var found = Set<String>()
        var res = Set<String>()
        
        for i in 0...(l.count - 10) {
            let str = String(l[i..<(i+10)])
            let (inserted, _) = found.insert(str)
            if !inserted {
                res.insert(str)
            }
        }
        return Array(res)
    }
}

// trie 慢
class Solution1 { 
    class Node {
        let val: Character
        var children = [Node]()
        init(_ val: Character) {
            self.val = val
        }
    }
    
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let l = Array(s)
        var res = Set<String>()
        guard l.count >= 10 else { return [String]() }
        
        let rt = Node("R")
        for i in 0...(l.count-10) {
            var match = true
            var cur = rt
            for j in i..<(i+10) {
                var next: Node? = cur.children.first { $0.val == l[j] }
                if next == nil {
                    next = Node(l[j])
                    cur.children.append(next!)
                    match = false
                }
                cur = next!
            }
            if match {
                res.insert(String(l[i..<(i+10)]))
            }
        }
        return Array(res)
    }
}