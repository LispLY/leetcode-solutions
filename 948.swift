// 更清晰一点的方法
class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
        var tokens = tokens.sorted()
        var p = P
        var score = 0
        while !tokens.isEmpty {
            if tokens.first! <= p {
                p -= tokens.removeFirst()
                score += 1
            } else if score > 0, tokens.count > 1 {
                p += tokens.removeLast()
                score -= 1
            } else {
                break
            }
        }
        return score
    }
}

class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
        // token 排序，从小到大取，当P不够时 && 剩余最大的index大于当前index时，face down 一个最大的
        // !!! score 不能为负
        let tokens = tokens.sorted()
        var up = 0, down = tokens.count - 1
        var p = P
        var score = 0
        while up <= down {
            if tokens[up] <= p {
                p -= tokens[up]
                up += 1
                score += 1
            } else if score > 0, up < down {
                p += tokens[down]
                down -= 1
                score -= 1
            } else {
                break
            }
        }
        return score
    }
}

