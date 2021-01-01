class Solution {
    func canFormArray(_ arr: [Int], _ pieces: [[Int]]) -> Bool {
        // 使用字典：线性的时间和空间复杂度
        // 字典也可以用来存index，这样更节省空间
        
        var dict = [Int: [Int]]()
        for p in pieces {
            dict[p[0]] = p
        }
        
        var pos = 0
        while pos < arr.count {
            guard let piece = dict[arr[pos]] else {
                return false
            }
            
            for i in piece.indices {
                if piece[i] != arr[pos + i] {
                    return false
                }
            }
            
            pos += piece.count
        }
        return true
    }
}