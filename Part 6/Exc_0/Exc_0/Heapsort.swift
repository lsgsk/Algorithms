
func headSort(values : inout [Int]){
    makeHeap(values: &values)
    print("Base heap: \(values)")
    for i in 0..<values.count{
        let max = removeTopItem(values: &values, count: values.count - i)
        values[values.count - 1 - i] = max
        print("Heap step: \(values)")
    }
}

fileprivate func makeHeap(values : inout [Int]){
    for i in 0..<values.count{
        var index = i
        while index != 0{
            let parent = (index - 1) / 2
            if values[index] <= values[parent]{
                break
            }
            let temp = values[index]
            values[index] = values[parent]
            values[parent] = temp
            index = parent
        }
    }
}

 fileprivate func removeTopItem(values : inout [Int], count : Int) -> Int{
    let result = values[0]
    values[0] = values[count-1]
    var index = 0
    while (true){
        var child1 = 2 * index + 1
        var child2 = 2 * index + 2
        if (child1 >= count){
            child1 = index
        }
        if (child2 >= count){
            child2 = index
        }
        if ((values[index] >= values[child1]) && (values[index] >= values[child2])) {
            break
        }
        var swap_child = 0
        if (values[child1] > values[child2]){
            swap_child = child1
        }
        else{
            swap_child = child2
        }
        // Меняем местами с большим дочерним элементом.
        let temp = values[index]
        values[index] = values[swap_child]
        values[swap_child] = temp
        index = swap_child
    }
    return result
}
