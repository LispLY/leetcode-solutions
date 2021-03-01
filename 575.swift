class Solution {
    func distributeCandies(_ candyType: [Int]) -> Int {
        // 数学题
        // 答案就是 min(n/2，糖种类数)
        
        let types = Set(candyType)
        return min(candyType.count/2, types.count)
    }
}