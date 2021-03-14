class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        
        // 遍历 string，只需要一趟
        let str = Array(s)
        
        // !!!
        guard k <= str.count else { return false }

        var set = Set<String>()
        for i in 0..<(str.count - k + 1) {
            set.insert(String(str[i..<(i+k)]))
        }
        
        return set.count == 1<<k
    }
}