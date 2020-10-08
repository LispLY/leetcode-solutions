// passed

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 普通的折半查找
        var start = 0
        var end = nums.count
        while start < end {
            let mid = (start + end) / 2
            if target < nums[mid] {
                end = mid
            } else if target > nums[mid] {
                start = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
}