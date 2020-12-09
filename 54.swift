// 方法一：缺点，要修改矩阵本身
class Solution {
    enum Direction: Int {
        case right, down, left, up
        
        func nextDirection() -> Self {
            return Direction(rawValue: (self.rawValue + 1) % 4)!
        }
        
        func nextCoord(_ x: Int, _ y: Int) -> (Int, Int) {
            switch self {
            case .right: 
                return (x + 1, y)
            case .down:
                return (x, y + 1)
            case .left: 
                return (x - 1, y)
            case .up:
                return (x, y - 1)
            }
        }
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        // 这样的话，成本就高了
        var matrix = matrix
        // 矩阵大小不为0
        let empty = 101
        let valid: (Int, Int) -> Bool = { x, y in
            (0..<(matrix[0].count)).contains(x) && (0..<(matrix.count)).contains(y) && matrix[y][x] != empty
        }
        var result = [Int]()
        
        var size = matrix.count * matrix[0].count
        var coord: (x: Int, y: Int) = (0, 0)
        var direction = Direction.right
        
        for _ in 0..<size {
            var nextCoord: (x: Int, y: Int) = direction.nextCoord(coord.x, coord.y)
            if !valid(nextCoord.x, nextCoord.y) {
                direction = direction.nextDirection()
                nextCoord = direction.nextCoord(coord.x, coord.y)
            }
            result.append(matrix[coord.y][coord.x])
            matrix[coord.y][coord.x] = empty
            coord = nextCoord
        }
        return result
    }
}