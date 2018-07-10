func insertionSort(_ array: inout [Int]){
    for i in 0..<array.count{
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

func bablesSort(_ array: inout [Int]){
    for j in 0..<array.count{
        for i in 0..<array.count-j-1{
            if array[i] > array[i+1]{
                array[i] = array[i] ^ array[i+1];
                array[i+1] = array[i+1] ^ array[i];
                array[i] = array[i] ^ array[i+1];
            }
            print("Sort step \(array)")
        }
    }
}

