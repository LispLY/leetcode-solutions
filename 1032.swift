// NOT PASSED: TIME OUT

// 最后查找的连续的k个字母能够组成一个单词

class StreamChecker {
    class Node: Hashable {
        static func == (lhs: StreamChecker.Node, rhs: StreamChecker.Node) -> Bool {
            return lhs.val == rhs.val
        }
        
        func hash(into hasher: inout Hasher) {
            val.hash(into: &hasher)
        }

        
        var val: Character
        var branches: Set<Node>
        var isEnd: Bool
        init(_ val: Character, branches: Set<Node> = [], isEnd: Bool = false) {
            self.val = val
            self.branches = branches
            self.isEnd = isEnd
        }
        
        func append(word: String) {
            append(Substring(word))
        }
        
        func append(_ characters: Substring) {
            guard let first = characters.first else {
                isEnd = true
                return
            }
            let tail = characters.dropFirst()
            if let branch = branches.first(where: { $0.val == first }) {
                branch.append(tail)
            } else {
                let branch = Node(first)
                branches.insert(branch)
                branch.append(tail)
            }
        }
    }
    
    // 给每个词维护一个当前进度（index）
    // 构造一个查找树
    // 维持一个正在查找的（尚未失败的）集合
    
    let trie: Node = Node(".")
    var curQuerys: [Node] = []
    
    init(_ words: [String]) {
        for word in words {
            trie.append(word: word)
        }
    }
    
    func query(_ letter: Character) -> Bool {
        curQuerys.append(trie)

        curQuerys = curQuerys.compactMap({ node in
            return node.branches.first { $0.val == letter }
        })
        
        return curQuerys.contains { $0.isEnd }
    }
}

// Use array instead of set
/**
 * Your StreamChecker object will be instantiated and called as such:
 * let obj = StreamChecker(words)
 * let ret_1: Bool = obj.query(letter)
 */


//// 最后查找的连续的k个字母能够组成一个单词
//
//class StreamChecker {
//    class Node: CustomDebugStringConvertible {
//        var debugDescription: String {
//            let star = isEnd ? "*" : ""
//            var res = "\(val)\(star): ["
//            for b in branches {
//                res.append(b.debugDescription)
//                res.append(", ")
//            }
//            return res + "]"
//        }
//
//        var val: Character
//        var branches: [Node]
//        var isEnd: Bool
//        init(_ val: Character, branches: [Node] = [], isEnd: Bool = false) {
//            self.val = val
//            self.branches = branches
//            self.isEnd = isEnd
//        }
//
//        func append(word: String) {
//            append(Substring(word))
//        }
//
//        func append(_ characters: Substring) {
//            guard let first = characters.first else {
//                isEnd = true
//                return
//            }
//            let tail = characters.dropFirst()
//            if let branch = branches.first(where: { $0.val == first }) {
//                branch.append(tail)
//            } else {
//                let branch = Node(first)
//                branches.append(branch)
//                branch.append(tail)
//            }
//        }
//    }
//
//    // 给每个词维护一个当前进度（index）
//    // 构造一个查找树
//    // 维持一个正在查找的（尚未失败的）集合
//
//    let trie: Node = Node(".")
//    var curQuerys: [Node] = []
//
//    init(_ words: [String]) {
//        for word in words {
//            trie.append(word: word)
//        }
//    }
//
//    func query(_ letter: Character) -> Bool {
//        curQuerys.append(trie)
//
//        curQuerys = curQuerys.compactMap({ node in
//            return node.branches.first { $0.val == letter }
//        })
//
//        return curQuerys.contains { $0.isEnd }
//    }
//}
//
//
///**
// * Your StreamChecker object will be instantiated and called as such:
// * let obj = StreamChecker(words)
// * let ret_1: Bool = obj.query(letter)
// */
