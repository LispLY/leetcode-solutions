// passed but slow

class Solution {
    // 折半查找 返回相等或者第一个大于目标的 index
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var pool = [Int]()
        
        func indexToInsert(num: Int) -> Int {
            // 问题：找到数组中第一个大于等于 num 的数的 index
            // 没找到的话，返回 pool.count

            guard pool.count > 0 else { return 0 }
            
            var l = 0
            var r = pool.count-1
            while l<r {
                let m = (l+r)/2
                if pool[m] == num {
                    return m
                } else if pool[m] < num {
                    l = m + 1
                } else {
                    if m > 0, pool[m-1] < num {
                        return m
                    } else if m == 0 {
                        return m
                    } else {
                        r = m
                    }
                }
            }
            return pool[r] < num ? r + 1 : r
        }
        
        for i in 0..<nums.count {
            if i > k {
                let iToRemove = indexToInsert(num: nums[i-k-1])
                pool.remove(at: iToRemove)
            }
            let index = indexToInsert(num: nums[i])
            if (index > 0 && nums[i] - pool[index-1] <= t) ||
               (index < pool.count && pool[index] - nums[i] <= t) {
                // it's pool.count NOT pool.count - 1, because pool is short by 1 by now.
                // AND pool[indexToInsert] NOT pool[indexToInsert+1] for the same reason
                return true
            }
            pool.insert(nums[i], at: index)
        }
        return false
    }
}


class Solution1 {
    // 暴力法：遍历所有 pairs O(n^2)
    // 优化：对于每一个i,只需要向后找k个 O(n*k)
    // 超时失败
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k>0 else { return false }
        for i in 0..<(nums.count - 1) {
            for j in i+1..<min(nums.count, i+k+1) {
                if abs(nums[i] - nums[j]) <= t {
                    return true
                }
            }
        }
        return false
    }
}

class Solution2 {
    // 先不排序，维护一个大小为k的排序数组，判断新插入的数字与邻居的距离
    // 先试试不使用折半查找的简化版 依然超时！！
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var pool = [Int]()
        for i in 0..<nums.count {
            if i > k { 
                pool.removeAll { $0 == nums[i-k-1] } // It will always be 1.
            }
            let indexToInsert = pool.firstIndex { $0 > nums[i] } ?? pool.endIndex
            if (indexToInsert > 0 && nums[i] - pool[indexToInsert-1] <= t) ||
               (indexToInsert < pool.count && pool[indexToInsert] - nums[i] <= t) {
                // it's pool.count NOT pool.count - 1, because pool is short by 1 by now. 
                // AND pool[indexToInsert] NOT pool[indexToInsert+1] for the same reason
                   return true
               }
            pool.insert(nums[i], at: indexToInsert)
        }
        return false
    }
}


// from others
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        return solution1(nums, k, t)
    }
}

// O(N^2)
extension Solution {
    func solution1(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard nums.count > 1 else { return false }
        if t == 0 {
           return duplicateAtDistance(nums, k)
        } else {
           return quadraticSolution(nums, k, t)
        }
    }
    
    func duplicateAtDistance(_ nums: [Int], _ k: Int) -> Bool {
        var dict: [Int: Int] = [:]
        for i in 0..<nums.count {
            if let j = dict[nums[i]], i - j <= k {
                 return true
            } else {
                dict[nums[i]] = i
            }            
        }
        return false
    }
    
    func quadraticSolution(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard nums.count > 1 else { return false }
        for i in 0..<nums.count {
            for j in 0..<nums.count where abs(i - j) <= k && i != j {
                if abs(nums[i] - nums[j]) <= t {
                    return true
                }
            }
        }
        return false
    }
}
