// passed

// 低效的方法，每个字母遍历一趟
class Solution1 {
    func partitionLabels(_ S: String) -> [Int] {
        let chars = Set(S)
        var groups = S.map { String($0) }

        func merge(by char: Character) {
            let l: Int = groups.firstIndex { $0.contains(char) }!
            let r: Int = groups.lastIndex { $0.contains(char) }! + 1
            let left = Array(groups[..<l])
            let mid = groups[l..<r].reduce("") { $0 + $1 }
            let right = Array(groups[r...])

            groups = left + [mid] + right
        }

        for c in chars {
            merge(by: c)
        }

        return groups.map { $0.count }
    }
}

// 方法2 两趟的方法。要点：对于每个字母，只有最左边和最右边的重要。
class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var s = Array(S)
        var lastPositions = [Character: Int]()
        for (i, c) in s.enumerated() {
            lastPositions[c] = i 
        }

        var endPoint = -1        
        var finishedPos = -1
        var result = [Int]()
        for (i, c) in s.enumerated() {
            let lastC = lastPositions[c] ?? i 
            endPoint = max(lastC, endPoint)
            if endPoint == i {
                result.append(endPoint - finishedPos)
                finishedPos = i
            }
        }
        return result
    }
}

