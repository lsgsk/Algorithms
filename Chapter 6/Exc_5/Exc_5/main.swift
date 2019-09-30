func bablesSort(_ array: inout [Int]){
    for j in 0..<array.count{
        for i in 0..<array.count-1{
            if array[i] > array[i+1]{
                array[i] = array[i] ^ array[i+1];
                array[i+1] = array[i+1] ^ array[i];
                array[i] = array[i] ^ array[i+1];
            }
            print("Sort step \(array)")
        }
        print("------")
    }
}
//var array = [2, 12, 5, 11, 7, 1, 14, 8, 4, 9, 3, 6, 10, 15, 0, 13]
//var array = [2, 5, 1, 8, 4, 3, 6]
var array = [8, 7, 6, 5, 4, 3, 2, 1]
print(array)
bablesSort(&array)
print(array)
