class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        return nums.reduce(1) { $0 * ($1 == 0 ? 0 : (($1 > 0) ? 1 : -1)) }
    }
}