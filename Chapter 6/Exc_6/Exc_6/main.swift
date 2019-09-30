var steps = 0
func bablesSort(_ array: inout [Int]){
    for j in 0..<array.count{
        var min =  j
        for i in j..<array.count - j - 1{
            if array[i] > array[i+1]{
                array[i] = array[i] ^ array[i+1];
                array[i+1] = array[i+1] ^ array[i];
                array[i] = array[i] ^ array[i+1];
            }
            if array[i] < array[min]{
                min = i
            }
           print("Sort step \(array)")
           steps += 1
        }
        if array[j] > array[min]{
            array[j] = array[j] ^ array[min];
            array[min] = array[min] ^ array[j];
            array[j] = array[j] ^ array[min];
             print("Sort step \(array)")
        }
        if j >= array.count - j - 1{
            return
        }
        print("------")
    }
}
func bablesSort2(_ array: inout [Int]){
    var count = array.count
    for i in 0..<count{
        var max = count-1
        for j in i..<count{
            if array[i] > array[j]{
                array[i] = array[i] ^  array[j];
                array[j] = array[j] ^ array[i];
                array[i] = array[i] ^ array[j];
            }
            if array[j] > array[max] {
                max = j
            }
            
         
        }
        let temp = array[count-1]
        array[count-1] = array[max]
        array[max] = temp
        count -= 1
        print("Fix max/min position \(i)/\(max), \(array)")
        if i >= count{
            return
        }
    }
}

var array = [2, 12, 5, 11, 7, 19, 1, 14, 8, 4, 9, 3, 6, 18, 10, 15, 0, 13, 16, 20, 17]
print(array)
bablesSort(&array)
print("Array: \(array), steps to sort: \(steps)")

