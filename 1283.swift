class Solution {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        // 条件：每个数除以 divisor 的和小于等于 threshold
        // 目标：找到符合条件的最小的 divisor
        // 可能的结果值 1...max(nums)， 因为 threshold >= nums.len
        // 二分查找
        func isLegal(_ divisor: Int) -> Bool {
            return nums.reduce(0) { $0 + ($1 + divisor - 1) / divisor } <= threshold
        }
        
        var l = 1
        var r = nums.max()!
        while l <= r {
            let mid = (l + r) / 2
            if isLegal(mid) {
                if mid == 1 || !isLegal(mid-1) {
                    return mid
                } else {
                    r = mid - 1
                }
            } else {
                l = mid + 1                    
            }
        }
        fatalError()
    }
}