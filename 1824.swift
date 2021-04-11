// 有点乱

class Solution {
    func minSideJumps(_ obstacles: [Int]) -> Int {
        // 贪心法可解，搜索最晚出现的下一块石头
        
        // 模拟：不得不跳时，跳；选择下一个障碍最远的赛道
        var res = 0
        var lane = 2 // 1,2,3
        
        var i = 0
        while i < obstacles.count {
            let obstacle = obstacles[i]
            if obstacle == lane {
                // 跳
                res += 1
                // print("jump at: ", i-1)
                // 寻找下一个赛道
                var next = [1, 0, 0, 0]
                next[obstacle] = 1
                if i > 0 {
                    next[obstacles[i-1]] = 1 // 只能往没石头的方向跳
                }
                
                var j = i
                while j < obstacles.count {
                    next[obstacles[j]] = 1
                    if next == [1,1,1,1] {
                        lane = obstacles[j]
                        // print("jump to: ", lane)
                        i = j - 1 // 为什么
                        break
                    }
                    j += 1
                }
                // 如果最终没确定，那么提前结束
                if j == obstacles.count {
                    break
                }
            }
            // print("position: ", i, ", lane: ", lane)
            i += 1
        }
        // print("-----")
        return res
    }
}