func LinearSearch(values: [Int], target: Int) -> Int{
    var steps = 0
    for i in 0..<values.count{
        steps += 1
        if values[i] == target{
            print("LinearSearch steps: \(steps) ")
            return i
        }
        if values[i] > target{
            print("LinearSearch steps: \(steps) ")
            return -1
        }
    }
    print("LinearSearch steps: \(steps) ")
    return -1
}

let sorted = [1,2, 2,2, 3,3,5,5,5,6,7,8,9,10, 12, 12, 14, 15, 16, 19, 20, 25, 26, 28, 29, 30]
print("LinearSearch of 15: \(LinearSearch(values: sorted, target: 15))\n")



