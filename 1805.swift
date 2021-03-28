class Solution {
    func numDifferentIntegers(_ word: String) -> Int {
        let space = word.map { 
            $0.asciiValue! >= Character("a").asciiValue! && $0.asciiValue! <= Character("z").asciiValue! ? " " : $0 
        }
        
        let str = String(space).split(separator: " ").map { String($0.drop { $0 == Character("0") })}
        return Set(str).count
    }
}