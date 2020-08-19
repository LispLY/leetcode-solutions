// passed 
// IN TERRIBLE STYLE

// not a good problem
class Solution {
    func toGoatLatin(_ S: String) -> String {
        let vowels = Set("AEIOUaeiou")
        let ma = Array("ma")
        let words = Array(S).split(separator: " ", omittingEmptySubsequences: true)

        var result = [[Character]]()
        
        for (i, w) in words.enumerated() {
            let w = Array(w)
            let tail = Array(repeating: Character("a"), count: i+1)
            if vowels.contains(w[0]) {
                let res = w + ma + tail
                result.append(res)
            } else {
                let res = Array(w.dropFirst()) + [w[0]] + ma + tail
                result.append(res)
            }
        }

        return String(result.joined(separator: " "))
    }
}

print(Solution().toGoatLatin("I speak Goat Latin"))
