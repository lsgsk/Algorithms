func insertionSort(_ array: inout [Int]){
    for i in 1..<array.count{
        var selected = array[i]
        for j in 0..<i{
            if selected < array[j]{
                let temp = array[j]
                array[j] = selected
                selected = temp
            }
        }
        array[i] = selected
        print("Sort step \(array)")
    }
}

var array = [2, 5, 1, 8, 4, 3, 6]
print(array)
insertionSort(&array)
print(array)


