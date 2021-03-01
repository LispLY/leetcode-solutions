class Solution {
    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        // 选一个base，每种topping可能是 0，1，2
        // 数值较小，应该可以用暴力法
        
        var best = Int.max
        
        func better(_ l: Int, _ r: Int) -> Int {
            let lLoss = abs(l - target)
            let rLoss = abs(r - target)
            if lLoss == rLoss {
                return min(l, r)
            } else {
                return lLoss < rLoss ? l : r
            }
        }
        
        func addTopping(_ current: Int, _ index: Int) -> Int {
            if index == toppingCosts.count {
                return current
            } else {
                let cur = addTopping(current, index + 1)
                let one = addTopping(current + toppingCosts[index], index + 1)
                let two = addTopping(current + toppingCosts[index] * 2, index + 1)
                return better(cur, better(one, two))
            }
        }
        
        for base in baseCosts {
            best = better(best, addTopping(base, 0)) 
        }
        
        return best
    }
}