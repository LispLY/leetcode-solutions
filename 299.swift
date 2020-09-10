// passed

class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        // A: 按位匹配，B: 字典里有的，去掉按位匹配成功的

        let g = Array(guess)
        let s = Array(secret)
        var stat = [Character: (g: Int, s: Int)]()
        var bulls = 0
        for i in g.indices {
            if (s[i] == g[i]) {
                bulls += 1
            } else {
                stat[s[i], default: (0, 0)].s += 1
                stat[g[i], default: (0, 0)].g += 1
            }
        }
         
        let cows = stat.values.map { min($0.g, $0.s) }.reduce(0, +)
        
        return "\(bulls)A\(cows)B"
    }
}