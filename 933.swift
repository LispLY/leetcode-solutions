// passed

class RecentCounter {
    var calls = [Int]()
    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        calls.append(t)
        while calls.first! < t-3000 {
            calls.removeFirst()
        }
        return calls.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */