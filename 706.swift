// 怎样实现动态分配内存呢？

class MyHashMap {
    
    struct Item {
        var key: Int
        var value: Int
    }
    
    private static let size = 2047 // op in [1, 10000].
    
    private var store: [[Item]] = Array(repeating: [Item](), count: MyHashMap.size)
    
    private func hash(_ key: Int) -> Int {
        return key % MyHashMap.size
    }
    
    /** Initialize your data structure here. */
    init() {}
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        // !! 需要更新现有值啊
        var found = false
        for i in store[hash(key)].indices{
            if store[hash(key)][i].key == key {
                store[hash(key)][i].value = value
                found = true    
            }
        }
        if !found {
            store[hash(key)].append(Item(key: key, value: value))
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        for item in store[hash(key)] {
            if item.key == key { return item.value }
        }
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        store[hash(key)].removeAll { $0.key == key }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */