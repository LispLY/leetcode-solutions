// passed 

class Solution {
    // pass1 分割，pass2 找0，pass3&4 solve bidirectional 有点慢
    func maxProduct(_ nums: [Int]) -> Int {
        // element 是 int 所以 除了0不会变小，只会变负；0相当于分成两个任务
        // 最基本的是二次复杂度，有没有办法变成线性复杂度？缓存最大值和最大绝对值？
        // 先考虑分治法
        // 偶数个负数：全都要
        // 奇数个负数：从两边向对方推直到遇到最后一个负数，丢掉乘积绝对值小的半边
        func maxNoneZero(_ nums:[Int]) -> Int {
            let negs = nums.reduce(0) { $1<0 ? $0+1 : $0 }
            if negs % 2 == 0 {
                return nums.reduce(1, *)
            } else {
                let firstN = nums.firstIndex { $0 < 0 }!
                let lastN = nums.lastIndex { $0 < 0 }!
                let firstHalf = nums[..<lastN]
                let secondHalf = nums[(firstN+1)...]
                return max( firstHalf.isEmpty ? nums[firstN] : firstHalf.reduce(1, *),
                            secondHalf.isEmpty ? nums[lastN] : secondHalf.reduce(1, *))
            }
        }
        
        let subArrays = nums.split(separator: 0)
        let hasZero = nums.contains(0)
        
        let resultOfSubs = subArrays.map { maxNoneZero(Array($0)) }.max() ?? 0
        return hasZero ? max(0, resultOfSubs) : resultOfSubs
    }
}


// from others O(n)
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var maxProd = 1 //nums[0]
        var minProd = 1 //nums[0]
        var maxx = nums[0]
        
        for i in 0..<nums.count {
            let big=maxProd
            let small=minProd
            maxProd = max(nums[i], big*nums[i], small*nums[i])
            minProd = min(nums[i], big*nums[i], small*nums[i])
            maxx = max(maxx, maxProd)
        }   
        return maxx
    }
}
