class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 行判断：判断在行的前、中、后
        // 行内判断：判断有没有
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }
        
        var start = 0
        var end = matrix.count
        while start < end {
            let mid = (start + end) / 2
            if target < matrix[mid].first! {
                end = mid
            } else if target > matrix[mid].last! {
                start = mid + 1
            } else { // 就在这行中
                // search in row
                let row = matrix[mid]
                start = 0
                end = row.count
                while start < end {
                    let mid = (start + end) / 2
                    if target < row[mid] {
                        end = mid
                    } else if target > row[mid] {
                        start = mid + 1
                    } else {
                        return true
                    }
                }
                return false
            }
        }
        return false 
    }
}