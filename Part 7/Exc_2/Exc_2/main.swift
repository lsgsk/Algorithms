func LinearSearch(values: [Int], target: Int, position: Int = 0) -> Int{
    if position < values.count{
        if values[position] == target{
            return position
        } else if values[position] > target{
            return -1
        }
        else {
            return LinearSearch(values: values, target: target, position: (position + 1))
        }
    }else{
        return -1
    }
}

print("Hello, World!")
let sorted = [1,2, 2,2, 3,3,5,5,5,6,7,8,9,10, 12, 12, 14, 15, 16, 19, 20, 25, 26, 28, 29, 30]
print(LinearSearch(values: sorted, target: 10))
print(LinearSearch(values: sorted, target: 17))
print(LinearSearch(values: sorted, target: 60))


