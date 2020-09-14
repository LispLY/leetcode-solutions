// passed

// looks like a dp problem.
// BUT IT IS NOT.

class Solution {
    func rob(_ nums: [Int]) -> Int {
        // 第n步当前最好的方案：1: 第n-2步最好的方案+n； 2：第n-1步最好的方案
        var minus1 = 0
        var minus2 = 0
        var cur = 0 // 可以省掉 cur，但这样比较清晰
        for i in nums.indices {
            cur = max(minus1, minus2 + nums[i])
            minus2 = minus1
            minus1 = cur
        }
        return cur
    }
}

class Solution2 {
    func rob(_ nums: [Int]) -> Int {
        // 第n步当前最好的方案：1: 第n-2步最好的方案+n； 2：第n-1步最好的方案
        switch nums.count {
        case 0:
            return 0
        case 1:
            return nums[0]
        case 2:
            return max(nums[0], nums[1])
        default:
            break
        }
        
        var dp = Array(repeating: 0, count: nums.count)
        
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i])
        }
        
        return dp.last!
    }
}

