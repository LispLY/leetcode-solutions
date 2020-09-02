// passed

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else { return false }
        
        var numsWithI = [(i: Int, n: Int)]()
        for (i, n) in nums.enumerated() {
            numsWithI.append((i, n))
        }
        let sorted = numsWithI.sorted {
            $0.n == $1.n ? ($0.i < $1.i) : ($0.n < $1.n)
        }
        for i in 0..<sorted.count-1 {
            if sorted[i].n == sorted[i+1].n, sorted[i+1].i - sorted[i].i <= k {
                return true
            }
        }
        return false
    }
}

// from others, BEAUTIFUL
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        for i in 0..<nums.count {
            if i > k { set.remove(nums[i-k-1]) } // 保证set中的元素都满足k要求
            if !set.insert(nums[i]).inserted { return true } // swifty! 如果重复插入，返回true
        }
        return false
    }
}
