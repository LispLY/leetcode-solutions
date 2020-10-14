class Solution {
    func rob(_ nums: [Int]) -> Int {
        func easyRob<T>(_ nums: T) -> Int where T: Sequence, T.Element == Int {
            var oldmax = 0
            var newmax = 0
            for n in nums {
                (oldmax, newmax) = (newmax, max(oldmax + n, newmax))
            }
            return newmax
        }
        
        return max(easyRob(nums.dropFirst()),
                   easyRob(nums.dropLast()),
                   nums.first ?? 0)
    }
}