// 模拟方法
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
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        // 已知 n > 0
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)

        func valid(_ x: Int, _ y: Int) -> Bool {
            return (0..<n).contains(x) && (0..<n).contains(y) && result[y][x] == 0
        }
        
        var coord = (x: 0, y: 0)
        var direction = Direction.right
        result[coord.y][coord.x] = 1
        
        for num in 2..<(n*n + 1) {
            var nextCoord: (x: Int, y: Int) = direction.nextCoord(coord.x, coord.y)
            if !valid(nextCoord.x, nextCoord.y) {
                direction = direction.nextDirection()
                nextCoord = direction.nextCoord(coord.x, coord.y)
            }
            result[nextCoord.y][nextCoord.x] = num
            coord = nextCoord
        }
        
        return result
    }
}