// 更简单的方法：所有数的和 - 数组中数的和 就是结果

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // 异或
        let target = Array(0...nums.count)
        return (nums + target).reduce(0) { $0 ^ $1 }
    }
}