// 1 递归

class Solution1 {
    func getRow(_ rowIndex: Int) -> [Int] {
        func recur(_ rowIndex: Int) -> [Int] {
            switch rowIndex {
            case 0:
                return [1]
            case 1:
                return [1, 1]
            default:
                var result = Array(repeating: 1, count: rowIndex+1)
                let last = recur(rowIndex-1)
                for i in 0..<(last.count-1) {
                    result[i+1] = last[i] + last[i+1]
                }
                return result
            }
        }
        
        return recur(rowIndex)
    }
}

// 2 迭代 每一级都相当于错位的上一级相加 （用0补齐）

//[1]
//[1, 1]
//[1, 2, 1]
//[1, 3, 3,  1]
//[1, 4, 6,  4,  1]
//[1, 5, 10, 10, 5, 1]
//[1, 6, 15, 20, 15, 6, 1]
//[1, 7, 21, 35, 35, 21, 7, 1]
//[1, 8, 28, 56, 70, 56, 28, 8, 1]
//[1, 9, 36, 84, 126, 126, 84, 36, 9, 1]

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = Array(repeating: 0, count: rowIndex+1)
        result[0] = 1
        
        for i in 0..<rowIndex { // 遍历次数 = rowIndex
            for index in stride(from: i+1, through: 1, by: -1) { // i+1 第i层的最后一个index
                result[index] += result[index-1]
            }
        }
        
        return result
    }
}

// test
for i in 0..<10 {
    print(Solution().getRow(i))
}

