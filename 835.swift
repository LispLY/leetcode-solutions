// passed. O(n^4) is best


835 Image Overlap

class Solution {
    // 对于AB的所有值为1的点做笛卡尔积，求任意两点的transform；对transform做统计
    struct Point: Hashable {
        let x: Int
        let y: Int
    }
    
    func trans(_ a: Point, _ b: Point) -> Point { // x, y
        return Point(x: b.x - a.x, y: b.y - a.y)
    } 
    
    func ones(_ mtx: [[Int]]) -> [Point] {
        var res = [Point]()
        for i in 0..<mtx.count {
            for j in 0..<mtx.count {
                if mtx[i][j] == 1 {
                    res.append(Point(x: i, y: j))
                }
            }
        }
        return res
    }
    
    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        let a = ones(A)
        let b = ones(B)
        let pairs = a.flatMap { pa in 
            b.map { pb in trans(pa, pb) } 
        }

        var res = [Point: Int]()
        for p in pairs {
            res[p] = (res[p] ?? 0) + 1
        }
        return res.values.max() ?? 0
    }
}


class Solution1 {
    // 暴力法 太慢了
    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        // 所有可能的情况: (A.length * 3 - 2)^2, 为了方便，不减2
        let len = B.count
        let row = Array(repeating: 0, count: len*3)
        var b = Array(repeating: row, count: len*3)
        // 把B放到中间
        for i in len..<len*2 {
            for j in len..<len*2 {
                b[i][j] = B[i-len][j-len]
            }
        }
        
        // 把A放到所有可能的位置
        var best = 0
        for i in 0..<len*2 {
            for j in 0..<len*2 {
                var a = Array(repeating: row, count: len*3)
                for r in 0..<len {
                    for c in 0..<len {
                        a[r+i][c+j] = A[r][c]
                    }
                }
                let pairs = zip(a.flatMap { $0 }, b.flatMap { $0 })
                let res = pairs.reduce(0) { $0 + ($1.0 & $1.1)}
                best = max(best, res)
            }
        }
        return best
    }
}
