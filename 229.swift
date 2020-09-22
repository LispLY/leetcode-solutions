// passed

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        // 一样的投票算法，目的是找出最多的两个数（不一定都符合条件）
        var n1: Int?
        var n2: Int?
        var c1 = 0
        var c2 = 0
        for i in nums.indices {
            if nums[i] == n1 {
                c1 += 1
            } else if nums[i] == n2 {
                c2 += 1
            } else if c1 == 0 {
                n1 = nums[i]
                c1 = 1
            } else if c2 == 0 {
                n2 = nums[i]
                c2 = 1
            } else {
                c1 -= 1
                c2 -= 1
                if c1 == 0 { n1 = nil }
                if c2 == 0 { n2 = nil }
            }
        }
        var res = [Int]()
        
        var realC1 = nums.reduce(0) { $1 == n1 ? $0+1 : $0 }
        var realC2 = nums.reduce(0) { $1 == n2 ? $0+1 : $0 }
        
        if let n1 = n1, realC1 > nums.count / 3 {
            res.append(n1)
        }
        if let n2 = n2, realC2 > nums.count / 3 {
            res.append(n2)
        }
        return res
    }
}