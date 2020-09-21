// passed

class Solution {
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        // 回溯法
        // 当消耗掉所有可用点并回到结束点时，算作一个成功的路径
        // 失败条件：到不了结束点 || 多余的点
        // 递归传参数：可用点的集合，当前点；
        // 返回：找到的路径数
        
        var grid = grid

        
        func neighbors(_ p: [Int]) -> [[Int]] {
            var res = [[Int]]()
            let rows = grid.count
            let cols = grid[0].count
            let r = p[0]
            let c = p[1]
            if r > 0 {
                res.append([r-1, c])
            }
            if r < rows - 1 {
                res.append([r+1, c])
            }
            if c > 0 {
                res.append([r, c-1])
            }
            if c < cols - 1 {
                res.append([r, c+1])
            }
            return res
        }
        
        func recurv(_ cur: [Int], _ remain: Int) -> Int {
            // 终止条件：bucket中有且只有一个方块，这个方块是 ending，并且是邻居
            if grid[cur[0]][cur[1]] == 2 {
                return remain == 0 ? 1 : 0
            }
            
            var cnt = 0
            let tmp = grid[cur[0]][cur[1]]
            grid[cur[0]][cur[1]] = -2
            for p in neighbors(cur).filter({ grid[$0[0]][$0[1]] >= 0 }) {
                cnt += recurv(p, remain - 1)
            }
            grid[cur[0]][cur[1]] = tmp
            return cnt
        }
        
        var remain = 0
        var start = [0, 0]
        for i in grid.indices {
            for j in grid[i].indices {
                switch grid[i][j] {
                case 1:
                    start = [i, j]
                case 0, 2:
                    remain += 1
                default:
                    break
                }
            }
        }
        return recurv(start, remain)
    }
}


Solution().uniquePathsIII([[1,0,0],[0,0,0],[0,0,0],[0,0,2]])
