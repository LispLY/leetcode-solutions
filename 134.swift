// passed

// 优化之后比暴力法慢了3倍
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        // 暴力法：从每个点开始走个环，一旦出现负数就终止
        // 怎么减少计算量？给每个点缓存一个完蛋点（从这个点开始能达到的最远的点）和完蛋点的缺油值，后续如果能走到这个点，就表明能走到完蛋点
        // 怎么判断走了一圈？维护一个步数变量，步数等于count时就是走了一圈
        var lookup = [Int: (Int, Int)]() // (die point, result) 也可以用 array of tuple 
        for i in gas.indices {
            var steps = 0
            var remain = 0
            var cur = i
            while steps < gas.count {
                // Optimization start
                if let (farest, left) = lookup[i] {
                    let stepsToAdd = (farest - cur + gas.count) % gas.count
                    if stepsToAdd + steps >= gas.count {
                        return i
                    } else {
                        steps += stepsToAdd
                        cur = farest
                        remain += left
                    }
                } // Optimization end
                    
                remain += gas[cur] - cost[cur]
                
                if remain >= 0 {
                    steps += 1
                    cur = (cur + 1) % gas.count
                } else {
                    update lookup
                    lookup[i] = ((cur - 1 + gas.count) % gas.count, remain - gas[cur] + cost[cur])
                    break
                }
            }
            if steps == gas.count { return i }
        }
        return -1
    }
}