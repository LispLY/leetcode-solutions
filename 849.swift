class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        // 最大的左边界，最大的中间数，最大的右边界
        var l = Int.max, r = Int.max, mid = 0
        var last = Int.max
        for i in seats.indices where seats[i] == 1 {
            l = min(l, i)
            r = min(r, seats.count - 1 - i)
            mid = max(mid, i - last)
            last = i
        }
        return [l, r, mid / 2].max()!
    }
}