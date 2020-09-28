// passed

class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        // 1 从 equations 和 values 中解析参数名，缓存比值
        var lookup = [String: [String: Double]]()
        for i in values.indices {
            let (a, b) = (equations[i].first!, equations[i].last!)
            lookup[a, default: [String: Double]()][b] = values[i]
            lookup[b, default: [String: Double]()][a] = 1 / values[i]
        }

        // 2 根据 queries 使用回溯法搜索所有可能的结果
        var used = [String]()
        func solve(_ x: String, _ y: String, _ cur: Double) -> Double {
            if let res = lookup[x]?[y] {
                return cur * res
            }
            if lookup[x] != nil {
                for next in lookup[x]!.keys.filter({ !used.contains($0) }) {
                    used.append(next)
                    let res = solve(next, y, lookup[x]![next]!)
                    used.removeLast()
                    if res != -1.0 {
                        // 优化可能性：这里可以缓存中间结果
                        return cur * res
                    }
                }
            }
            return -1.0
        }
        
        return queries.map { q in
            solve(q[0], q[1], 1.0)
        }
    }
}
