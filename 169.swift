// passed

// 普通方法
class Solution1 {
    func majorityElement(_ nums: [Int]) -> Int {
        // 遍历一遍，给出现最多的数字计数
        // 只会有一个数满足条件
        // O(n)空间复杂度
        var lookup = [Int: Int]()
        for n in nums {
            lookup[n, default: 0] += 1
        }
        return lookup.first { $0.value > nums.count / 2 }!.key
    }
}

// Boyer-Moore Voting Algorithm
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var cur = 0
        var candidate = nums[0]
        var count = 1
        while cur < nums.count - 1 {
            cur += 1
            count += nums[cur] == candidate ? 1 : -1
            if count == 0 { // count == 0 时必然还有剩余
                cur += 1
                candidate = nums[cur]
                count = 1
            }
        }
        return candidate
    }
}

// 别人的更简洁的实现
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0 
        var current = nums[0]
        
        for i in 0..<nums.count {
            if count == 0 {
                current = nums[i]
                count += 1
            } else if current == nums[i] {
                count += 1
            } else {
                count -= 1
            }
        }
        return current 
    }
}
