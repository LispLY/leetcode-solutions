// 构造一个 trie
// 求所有叶子的深度的和


class Solution {
    class Trie {
        var key: Character
        var children: [Character: Trie]
        
        init(key: Character) {
            self.key = key
            children = [Character: Trie]()
        }
        
        func add<S: StringProtocol>(_ s: S) {
            guard !s.isEmpty else { return }
            // print("add \(s.last!)")
            if children[s.last!] == nil {
                children[s.last!] = Trie(key: s.last!)
            }
            children[s.last!]!.add(s.dropLast())
            
            // 为什么这么写不行
            // children[s.last!, default: Trie(key: s.last!)].add(s.dropLast()) 
            // print("children: \(children)")
        }
    }
    
    func solve(_ trie: Trie, _ depth: Int) -> Int {
        // 如果是叶子，返回 depth + 1
        if trie.children.isEmpty {
            return depth + 1
        } else {
            return trie.children.values.map { solve($0, depth + 1) }.reduce(0, +)
        }
    }
    
    func minimumLengthEncoding(_ words: [String]) -> Int {
        var trie = Trie(key: "!")
        for w in words {
            trie.add(w)
        }
        return solve(trie, 0)
    }
}