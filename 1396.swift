
class UndergroundSystem {
    
    private var trips = [Int: (from: String, t1: Int)]()
    private var sum = [String: [(to: String, t1: Int, t2: Int)]]()

    init() {
        
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        trips[id] = (stationName, t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        let (from, t1) = trips[id]!
        trips[id] = nil
        
        sum[from, default: [(to: String, t1: Int, t2: Int)]()].append((stationName, t1, t))
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let data = sum[startStation]!.filter { $0.to == endStation }
        let total = data .map { $0.t2 - $0.t1 } .reduce(0, +)
        return Double(total) / Double(data.count)
    }
}

/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */