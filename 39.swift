// passed

class Solution1 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // 如果动态规划的话如何解决重复？？
        // 用回溯法
        var result = [[Int]]()
        var part = [Int]()

        func search(_ cur: Int, from startIndex: Int) {
            for i in startIndex..<candidates.count {
                let next = cur + candidates[i]
                if next < target {
                    part.append(candidates[i])
                    search(next, from: i)
                    part.removeLast()
                } else if next == target {
                    result.append(part + [candidates[i]])
                }
            }
        }
        search(0, from: 0)
        return result
    }
}

/* DP: python
class Solution(object):
    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        dp = defaultdict(list)
        for c in candidates:
            dp[c]=[[c]]
        for i in range (target+1):
            for c in candidates:
                if(i+c<=target):
                    for l in dp[i]:
                        if(c>=l[-1]):
                            dp[i+c].append(l+[c])
        
        return dp[target]
*/