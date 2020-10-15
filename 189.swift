extension Array {
    mutating func reverseBetween(_ start: Int, _ end: Int) { // inclusive end
        var start = start, end = end
        while start < end {
            self.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        // 使用 reverse 方法
        let k = k % nums.count        
        nums.reverse()
        nums.reverseBetween(0, k - 1)
        nums.reverseBetween(k, nums.count - 1)
    }
}

// 也可以使用循环方法，但要监控提前终止的小循环