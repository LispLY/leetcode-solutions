class Solution1 {
    // 暴力法：遍历所有 pairs O(n^2)
    // 优化：对于每一个i,只需要向后找k个 O(n*k)
    // 超时失败
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k>0 else { return false }
        for i in 0..<(nums.count - 1) {
            for j in i+1..<min(nums.count, i+k+1) {
                if abs(nums[i] - nums[j]) <= t {
                    return true
                }
            }
        }
        return false
    }
}

class Solution2 {
    // 先不排序，维护一个大小为k的排序数组，判断新插入的数字与邻居的距离
    // 先试试不使用折半查找的简化版 依然超时！！
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var pool = [Int]()
        for i in 0..<nums.count {
            if i > k { 
                pool.removeAll { $0 == nums[i-k-1] } // It will always be 1.
            }
            let indexToInsert = pool.firstIndex { $0 > nums[i] } ?? pool.endIndex
            if (indexToInsert > 0 && nums[i] - pool[indexToInsert-1] <= t) ||
               (indexToInsert < pool.count && pool[indexToInsert] - nums[i] <= t) {
                // it's pool.count NOT pool.count - 1, because pool is short by 1 by now. 
                // AND pool[indexToInsert] NOT pool[indexToInsert+1] for the same reason
                   return true
               }
            pool.insert(nums[i], at: indexToInsert)
        }
        return false
    }
}