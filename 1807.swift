class Solution {
    func evaluate(_ s: String, _ knowledge: [[String]]) -> String {
        var dict = [String: String]()
        for pair in knowledge {
            dict[pair[0]] = pair[1]
        }
                
        var s = s
        for i in s.indices.reversed() where s[i] == "(" {
            s.insert("?", at: s.index(after: i))
        }
        
        var words = s.split(separator: "(").flatMap { $0.split(separator: ")")}
        
        return words.map { 
            if $0.hasPrefix("?") {
                return dict[String($0.dropFirst())] ?? "?"
            } else {
                return String($0)
            }
        }.joined()
    }
}