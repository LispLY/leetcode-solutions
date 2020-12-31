// 也可以使用迭代来实现wfs，除了taken数组外，还需要使用一个队列

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        // dfs，通过缓存结果防止循环，线性的时间和空间复杂度
        var taken = Array(repeating: false, count: arr.count)
        
        func dfs(_ index: Int) -> Bool {
            guard arr.indices.contains(index), !taken[index] else {
                return false
            }
            if arr[index] == 0 {
                return true
            }
            taken[index] = true

            return dfs(index + arr[index]) || dfs(index - arr[index])
        }
        
        return dfs(start)
    }
}

