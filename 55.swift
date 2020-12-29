class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        // 关键：能到达的地点是连续的，所以只需要保存最远能到达的点，不需要保存每个点是否能到达
        var farest = nums[0]
        for i in nums.indices {
            if i > farest {
                return false
            }
            farest = max(farest, i + nums[i])
        }
        return true
    }
}

class Solution2 {
    func canJump(_ nums: [Int]) -> Bool {
        // 从头开始涂格子
        // 二次时间复杂度
        var res = Array(repeating: false, count: nums.count)
        res[0] = true
        
        for i in nums.indices where res[i] {
            for j in i...min(nums.count - 1, i + nums[i]) {
                res[j] = true
            }
        }
        
        return res.last!
    }
}