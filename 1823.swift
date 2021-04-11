class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        // 模拟
        var ring = Array(1...n)
        var cur = 0
        while ring.count > 1 {
            cur = (cur + k - 1) % ring.count
            ring.remove(at: cur)
        }
        return ring.first!
    }
}