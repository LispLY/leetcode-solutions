// passed
// 更严肃的实现应该用链表来存储

import Cocoa

class MyHashSet {
    static let space = 999
    var stores: [[Int]]
    
    /** Initialize your data structure here. */
    init() {
        stores = Array(repeating: [Int](), count: MyHashSet.space)
    }
    
    func hashValue(_ num: Int) -> Int {
        return num % MyHashSet.space
    }
    
    func add(_ key: Int) {
        let index = hashValue(key)
        if !stores[index].contains(key) {
            stores[index].append(key)
        }
    }
    
    func remove(_ key: Int) {
        let index = hashValue(key)
        stores[index].removeAll { $0 == key }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let index = hashValue(key)
        return stores[index].contains(key)
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
