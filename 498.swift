class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return [] }
        
        let rows = matrix.count
        let cols = matrix[0].count
        
        var up = true
        var result = [Int]()
        
        var coord: (i: Int, j: Int) = (0, 0)
        result.append(matrix[coord.i][coord.j])
        
        var sum = 0 // i, j 的和
        while result.count < (rows * cols) {
            // next: 如果继续走直线的坐标
            let next: (i: Int, j: Int) = (coord.i + (up ? -1 : 1), coord.j + (up ? 1 : -1))
            
            if (0..<rows).contains(next.i), (0..<cols).contains(next.j) { // 能否继续走直线
                coord = next
            } else {
                up.toggle()
                sum += 1
                let maxCoord = up ? (rows - 1) : (cols - 1) // 每个斜行起始处允许的最大坐标
                let big = (sum <= maxCoord) ? sum : maxCoord // 更大的坐标
                coord = up ? (big, sum - big) : (sum - big, big)
            }
            
            result.append(matrix[coord.i][coord.j])
        }
        return result
    }
}