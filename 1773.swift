class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        let keys = ["type", "color", "name"]
        let ruleIndex = keys.firstIndex(of: ruleKey)!
        return items.filter { $0[ruleIndex] == ruleValue }.count
    }
}