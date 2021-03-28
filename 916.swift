class Solution {
    func wordSubsets(_ A: [String], _ B: [String]) -> [String] {
        // 遍历 B 得到需求，遍历 A 得到结果
        var demand = [Character: Int]() 
        
        func charCount(_ s: String) -> [Character: Int] {
            var res = [Character: Int]()
            for c in s {
                res[c, default: 0] += 1
            }
            return res
        }
        
        for b in B {
            for (k, v) in charCount(b) {
                if demand[k, default: 0] < v {
                    demand[k] = v
                }
            }
        }
        
        let result = A.filter {
            let supply = charCount($0)
            for (k, v) in demand {
                if supply[k, default: 0] < v { return false }
            }
            return true
        }
        
        return result
    }
}