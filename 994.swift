class Solution {
    // 最直接的思路直接模拟，每轮生成一个下一轮该有的样子，然后迭代
    // 降低复杂度：用两个集合装坐标，一个是可发展的烂橘子，一个是好橘子，把不可发展的烂橘子及时扔掉
    struct Coord: Hashable {
        let r: Int
        let c: Int
    }
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        
        var rotten = Set<Coord>()
        var fresh = Set<Coord>()
        
        func neighbours(_ coord: Coord) -> [Coord] {
            let r = coord.r, c = coord.c
            return [Coord(r:r-1, c:c),
                    Coord(r:r+1, c:c),
                    Coord(r:r, c:c-1),
                    Coord(r:r, c:c+1)]
        }
        
        func noUse(_ coord: Coord) -> Bool {
            return neighbours(coord).filter { fresh.contains($0) }.isEmpty
        }
        
        func rotOthers(_ coord: Coord) {
            for neighbour in neighbours(coord) {
                if fresh.contains(neighbour) {
                    fresh.remove(neighbour)
                    rotten.insert(neighbour)
                }
            }
        }
        
        for (r, row) in grid.enumerated() {
            for (c, val) in row.enumerated() {
                switch val {
                    case 1:
                    fresh.insert(Coord(r:r, c:c))
                    case 2:
                    rotten.insert(Coord(r:r, c:c))
                    default:
                    continue
                }
            }
        }
        
        var result = 0
        var freshLastRound = fresh.count
        while !fresh.isEmpty {
            for coord in rotten {
                if noUse(coord) { // trim
                    rotten.remove(coord)
                }
                rotOthers(coord)
            }
            if fresh.count == freshLastRound {
                return -1
            } else {
                freshLastRound = fresh.count
            }
            result += 1
        }
        return result
    }
}