class Solution {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        func dist(_ p: [Int]) -> Int {
            return abs(p[0] + p[1] - x - y)
        }
        var index = -1
        var val = Int.max
        for (i, p) in points.enumerated() where p[0] == x || p[1] == y {
            let d = dist(p)
            if d < val {
                index = i
                val = d
            }
        }
        return index
    }
}