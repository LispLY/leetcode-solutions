class Solution1 {
    func jump(_ nums: [Int]) -> Int {
        // 要点：1.同上一题，能到达的点是连续的；2.我们不关心怎么走，只关心最少的步数
        // 思路：当不能继续前进了，就从当前可达的格子里走出最远的一步（具体是哪一步不重要，只关心最值）
        
        var reachable = 0
        var farestNextStep = nums[0]
        var steps = 0
        
        for i in nums.indices {
            if i > reachable {
                steps += 1
                reachable = farestNextStep
            }
            farestNextStep = max(farestNextStep, i + nums[i])
        }
        
        return steps
    }
}

class Solution2 {
    func jump(_ nums: [Int]) -> Int {
        // 传说中的广度优先搜索？
        // 返回最少步数
        if nums.count == 1 { return 0 }
        
        var nextStep = Set<Int>()
        var thisStep = Set<Int>()
        
        thisStep.insert(0)
        
        var steps = 0
        
        while true {
            steps += 1
            for n in thisStep {
                for m in 0...nums[n] {
                    let next = n + m
                    if next == nums.count - 1 {
                        return steps
                    } else if next < nums.count - 1, !thisStep.contains(next) {
                        nextStep.insert(next)
                    }
                }
            }
            // print(thisStep, nextStep)
            thisStep = nextStep
            nextStep = Set<Int>()
        }
        fatalError()
    }
}