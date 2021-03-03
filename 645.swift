// 注： 此题有很多种解法，不要被关键字set迷惑了。相当于数组中找到唯一的重复数字和唯一缺少的数字

class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        // 找到序号和值不一样的，序号是缺少的，值是多的 ❌ 因为没有保证数组是排好序的！
        // for (i, n) in nums.enumerated() {
        //     let index = i + 1
        //     if index != n {
        //         return [n, index]
        //     }
        // }
        // fatalError()
        
        // 从标准set中向外取，取不到的就是重复的（因为取了一次）；剩下的就是多的
        var set = Set(1...nums.count)
        
        var res = [Int]()
        
        for n in nums {
            if set.remove(n) == nil {
                res.append(n)
            }
        }
        
        res.append(set.first!)
        
        return res
    }
}