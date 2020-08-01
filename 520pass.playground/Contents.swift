import Cocoa


// 如果首字母小写，则全部大小写都一样；如果首字母大写，则剩下的都一样

class Solution {
    func allUpperOrLower<T>(_ word: T) -> Bool where T: StringProtocol {
        guard let f = word.first else { return true }
        let isFirstUpper = f.isUppercase
        for c in word.dropFirst() {
            if c.isUppercase != isFirstUpper {
                return false
            }
        }
        return true
    }
    
    func detectCapitalUse(_ word: String) -> Bool {
        guard let f = word.first else { return true }
        if f.isUppercase {
            return allUpperOrLower(word.dropFirst())
        }
        return allUpperOrLower(word)
    }
}

Solution().detectCapitalUse("G")
