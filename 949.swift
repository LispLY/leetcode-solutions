// passed

class Solution {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        // take 2,1,0 NO!!!! we should see if there are 2 nums which > 5
        // take 3,2,1,0 NO!!!! take all when starts with 0 or 1
        // take 5,4,3,2,1,0
        // take what ever left
        var A = A

        func takeNumMax(by max: Int) -> Int? {
            for num in stride(from: max, through: 0, by: -1) {
                if let idxToRemove = A.firstIndex(where: { $0 == num }) {
                    A.remove(at: idxToRemove)
                    return num
                }
            } 
            return nil
        }
        
        
        var result = [Int]()
        
        // First check if there are 2 nums which > 5
        let first = A.filter { $0 > 5 }.count > 1 ? 1 : 2
        
        if let firstDigit = takeNumMax(by: first) {
            result.append(firstDigit)
        } else {
            return ""
        }
        
        // Then check if there is 2 at first digit
        let next = result[0] == 2 ? [3, 5, 9] : [9, 5, 9]

        for max in next {
            if let num = takeNumMax(by: max) {
                result.append(num)
            } else {
                return ""
            }
        }

        return "\(result[0])\(result[1]):\(result[2])\(result[3])" 
    }
}