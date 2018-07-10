func selectionSort(_ array: inout [Int]){
    for i in 0..<array.count{
        var maxindex = i
        for j in i..<array.count{
            if array[j] < array[maxindex]{
                maxindex = j
            }
        }
        if(i != maxindex){
            array[i] = array[i] ^  array[maxindex];
            array[maxindex] = array[maxindex] ^ array[i];
            array[i] = array[i] ^ array[maxindex];
        }
        print("Sort step \(array)")
    }
}


var array = [2, 5, 1, 8, 4, 3, 6]
print(array)
selectionSort(&array)
print(array)
