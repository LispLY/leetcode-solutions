class Solution {
    func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
        // 每次operation可能有6种价值：0, 1，2，3，4，5
        // 从价值5往下，使用贪婪法取一下
        let sum1 = nums1.reduce(0, +)
        let sum2 = nums2.reduce(0, +)
        var diff = abs(sum1 - sum2)
        if diff == 0 {
            return 0
        }
        let greater = sum1 > sum2 ? nums1 : nums2
        let smaller = sum1 < sum2 ? nums1 : nums2
        
        // 获取每个可能操作的价值（可能操作：大的变小，小的变大，其他的无意义）
        func getVal(_ nums: [Int], _ target: Int) -> [Int] {
            var res = Array(repeating: 0, count: 6)
            for n in nums {
                res[abs(target - n)] += 1
            }
            return res
        }
        
        let val1 = getVal(greater, 1)
        let val2 = getVal(smaller, 6)
        var val = { () -> [Int] in
            var v = [Int]()
            for i in val1.indices {
                v.append(val1[i] + val2[i])        
            }
            return v
        }()
        
        // 在val上使用贪婪法
        var res = 0
        var index = 5
        while index > 0 {
            guard val[index] > 0 else {
                index -= 1
                continue
            }
            val[index] -= 1
            diff -= index
            res += 1
            if diff <= 0 {
                return res
            }
        }
        return -1
    }
}