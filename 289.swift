class Solution {
    
    func gameOfLife(_ board: inout [[Int]]) {
        // in-place: 每一位表示一个时间的状态，64位可以表示64个状态
        let rows = board.count
        let cols = board[0].count
        
        func aliveNow(_ x: Int, _ y: Int) -> Bool {
            guard (0..<rows).contains(x), (0..<cols).contains(y) else {
                return false
            }
            return board[x][y] % 2 == 1
        }
        
        func willBeAlive(_ x: Int, _ y: Int) -> Bool {
            let neighbours = [(x-1, y-1),
                             (x, y-1),
                             (x+1, y-1),
                             (x-1, y),
                             (x+1, y),
                             (x-1, y+1),
                             (x, y+1),
                             (x+1, y+1)]
            var aliveNeighbours = 0
            for (x, y) in neighbours where aliveNow(x, y) {
                aliveNeighbours += 1
            }

            let isAliveNow = aliveNow(x, y)
            return (2...3).contains(aliveNeighbours) && isAliveNow ||
                    aliveNeighbours == 3 && !isAliveNow
        }
        
        for x in board.indices {
            for y in board[0].indices where willBeAlive(x, y) {
                board[x][y] += 2
            }
        }
        
        for x in board.indices {
            for y in board[0].indices {
                board[x][y] /= 2
            }
        }
    }
}