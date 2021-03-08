class Solution {
    func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int {
        let n = nums.reduce(0, +)
        let diff = abs(goal - n)
        return (diff + limit - 1) / limit 
    }
}