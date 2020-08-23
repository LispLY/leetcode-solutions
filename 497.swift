// passed

// 思路：实现一个数轴上线段到矩形各个整数点的映射
// 求出rect对应的点的个数
// 求出序号对应的坐标
// 时间复杂度 O(n), 使用折半查找可以到对数复杂度。

class Solution {
    
    func pointCount(_ rect: [Int]) -> Int {
        let x1 = rect[0], y1 = rect[1], x2 = rect[2], y2 = rect[3]
        guard x2 >= x1, y2 >= y1 else { return 0 }
        return (x2 - x1 + 1) * (y2 - y1 + 1)
    }
    
    func pointFor(_ index: Int, in rect: [Int]) -> [Int] {
        let x1 = rect[0], y1 = rect[1], x2 = rect[2], y2 = rect[3]
        let w = x2 - x1 + 1
        return [index % w + x1, index / w + y1]
    }
    
    let rects: [[Int]]
    lazy var total: Int = { rects.reduce(0) {
        sum, rect in sum + pointCount(rect) } 
    }()
    
    init(_ rects: [[Int]]) {
        self.rects = rects
    }
    
    func pick() -> [Int] {
        var n = Int.random(in: 0..<total)
        for rect in rects {
            let count = pointCount(rect)
            if count <= n {
                n -= count
            } else {
                return pointFor(n, in: rect)
            }
        }
        fatalError()
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(rects)
 * let ret_1: [Int] = obj.pick()
 */