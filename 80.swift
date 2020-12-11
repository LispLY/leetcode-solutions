class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 3 {
            return nums.count
        }
        
        var i = nums.count - 2 - 1
        while i >= 0 {
            if nums[i] == nums[i+1], nums[i] == nums[i+2] {
                nums.remove(at: i+2)
            }
            i -= 1
        }
        return nums.count
    }
}