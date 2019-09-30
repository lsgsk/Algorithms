
func countingsort(values : inout [Int]){
    
    var max_value = values[0]
    for i in 0..<values.count{
        if max_value < values[i]{
            max_value = values[i]
        }
    }
    
    var counts = Array(repeating: 0, count: max_value+1)
    for i in 0..<values.count{
        counts[values[i]] = counts[values[i]] + 1
    }
    
    var index = 0
    for i in 0..<max_value{
        for _ in 0..<counts[i]{
            values[index] = i
            index = index + 1
        }
    }
}
