// passed

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        func atoi(_ str: String) -> [Int] {
            return  str.split(separator: ".").map { Int($0)! }
        }
        
        var v1 = atoi(version1)
        var v2 = atoi(version2)
        let len = max(v1.count, v2.count)
        if v1.count < len {
            v1.append(contentsOf:Array(repeating: 0, count: len - v1.count))
        } else {
            v2.append(contentsOf:Array(repeating: 0, count: len - v2.count))
        }
        var i = 0
        for i in 0..<len {
            if v1[i] < v2[i] {
                return -1
            } else if v1[i] > v2[i] {
                return 1
            }
        }
        return 0
    }
}