// passed

class WordDictionaryOld { // 过早优化，性能反倒更低
    // 每个词一个index
    // 每个字母一个字典
    // 每个字母对应一个各个位置的dic
    // 每个dict装一个set，set中是符合的每个词的index
    // len array，每个词的长度索引
    // true: 所有字母都能取到位置
    
    var store = [Character: [Int: Set<Int>]]()
    var len = [Int]() // len.count = 总的个数
    var wordSet = Set<String>()
    var searchCache = Set<String>()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        if wordSet.contains(word) { return }
        wordSet.insert(word)
        
        let wordIndex = len.count
        len.append(word.count)
        for (i, c) in word.enumerated() {
            if store[c] == nil {
                store[c] = [i: Set([wordIndex])]
            } else {
                if store[c]?[i] == nil {
                    store[c]?[i] = Set([wordIndex])
                } else {
                    store[c]?[i]?.insert(wordIndex)
                }
            }
        }
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        if searchCache.contains(word) { return true }
        
        var currentWordIndices = Set(0..<len.count)
        currentWordIndices = currentWordIndices.filter { len[$0] == word.count }
        for (i, c) in word.enumerated() {
            if c == Character(".") { continue }
            currentWordIndices = currentWordIndices.filter { store[c]?[i]?.contains($0) ?? false }
        }
        let isIn = !currentWordIndices.isEmpty
        if isIn {
            searchCache.insert(word)
        }
        return isIn
    }
}


///


class WordDictionary {
    // 把不同长度的词分开处理
    // cache
    
    var store = [Int: [String]]()
    var wordSet = Set<String>()
    var searchCache = Set<String>()

    /** Initialize your data structure here. */
    init() {
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        if wordSet.contains(word) { return }
        wordSet.insert(word)
        
        let len = word.count
        if store[len] == nil {
            store[len] = [word]
        } else {
            store[len]?.append(word)
        }
    }
    
    func match(word: String, pattern: String) -> Bool { // sure to have same len
        for i in pattern.indices {
            if pattern[i] == Character(".") { continue }
            if pattern[i] != word[i] { return false }
        }
        return true
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        if searchCache.contains(word) { return true }
        guard let dict = store[word.count] else {
            return false
        }
        let isIn = dict.first { match(word: $0, pattern: word) } != nil
        if isIn {
            searchCache.insert(word)
        }
        return isIn
    }
}


/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */

let d = WordDictionary()
d.addWord("aat")
d.search("aat")
d.addWord("bat")
d.search(".at")

