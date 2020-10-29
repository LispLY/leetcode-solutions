class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        // 简单的状态机: 当前是否是第一个数，当前是什么数，下一个数是否连续
        guard !nums.isEmpty else { return [] }
        
        var first = nums[0]
        var cur = first // 可以省略掉，需要每次查找一下
        var result = [String]()
        
        func printLastRange() {
            if first == cur {
                result.append(String(first))
            } else {
                result.append("\(first)->\(cur)")
            }
        }
        
        for n in nums.dropFirst() {
            if (n - cur > 1) { // 不相邻, 相邻的话只需要更新cur就好了
                printLastRange()
                first = n
            }
            cur = n
        }
        
        printLastRange()
        
        return result
    }
}