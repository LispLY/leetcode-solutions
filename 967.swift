// passed

class Solution {
    
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        // corner cases
        // if N < 1 { return [Int]() } // not used
        if N == 1 { return Array(0...9) }
        
        func extend(_ num: Int) -> [Int] {
            guard K > 0 else {
                return [num * 10 + num % 10]
            }
            
            var res = [Int]()
            let tail = num % 10
            
            if tail - K >= 0 {
                res.append(num * 10 + tail - K)
            }
            if tail + K < 10 {
                res.append(num * 10 + tail + K)
            }
            return res
        }
        
        var result = Array(1...9)
        for _ in 1..<N {
            result = result.flatMap(extend)
        }
            
        return result
    }
}

// test
print(Solution().numsSameConsecDiff(9, 3))


