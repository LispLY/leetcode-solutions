// passed

// 关键：1 ≤ a[i] ≤ n 

// simple, O(n), but uses O(n) space.
class Solution1 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var pool = Set<Int>()
        for num in nums {
            if pool.contains(num) {
                result.append(num)
            }
            pool.insert(num)
        }
        return result
    }
}

// swap 
class Solution2 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in 0..<nums.count {
            while nums[i] != i + 1, nums[nums[i] - 1] != nums[i] {
                (nums[i], nums[nums[i] - 1]) = (nums[nums[i] - 1], nums[i])
            }
        }
        var res = [Int]()
        for (i, n) in nums.enumerated() {
            if i + 1 != n {
                res.append(n)
            }
        }
        return res
    }
}

// use sign and position as storage
class Solution3 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var res = [Int]()
        for i in 0..<nums.count {
            //
        }
        return res
    }
}
