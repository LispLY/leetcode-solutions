// passed
// Another solution: build a set.

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count < 2 { return false }
        
        let nums = nums.sorted()
        for i in 0..<nums.count-1 {
            if nums[i] == nums[i+1] {
                return true
            }
        }
        return false
    }
}