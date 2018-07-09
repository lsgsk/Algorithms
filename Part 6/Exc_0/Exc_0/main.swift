import Foundation

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
    for i in 0..<array.count{
        for j in 0..<array.count{
            if array[i] < array[j]{
                array[i] = array[i] ^  array[j];
                array[j] = array[j] ^ array[i];
                array[i] = array[i] ^ array[j];
            }
            print("Sort step \(array)")
        }
    }
}

var array = [2, 5, 1, 8, 4, 3, 6]
//insertionSort(&array)
//selectionSort(&array)
bablesSort(&array)
print(array)

