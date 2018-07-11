
func Mergesort(values: inout [Int], scratch : inout [Int], start: Int, end: Int) {
    if start == end{
        return
    }
    let midpoint = (start + end) / 2
    Mergesort(values: &values, scratch: &scratch, start: start, end: midpoint)
    Mergesort(values: &values, scratch: &scratch, start: midpoint+1, end: end)
    
    var left_index = start
    var right_index = midpoint + 1
    var scratch_index = left_index
    while ((left_index <= midpoint) && (right_index <= end)){
        if (values[left_index] <= values[right_index]){
            scratch[scratch_index] = values[left_index]
            left_index = left_index + 1
        }else{
            scratch[scratch_index] = values[right_index]
            right_index = right_index + 1
        }
        scratch_index = scratch_index + 1
    }
    // Завершаем копирование из непустой половины.
    if left_index <= midpoint {
        for i in left_index...midpoint{
            scratch[scratch_index] = values[i]
            scratch_index = scratch_index + 1
        }
    }
    if right_index<=end{
        for i in right_index...end{
            scratch[scratch_index] = values[i]
            scratch_index = scratch_index + 1
        }}
        // Копируем значения в исходный массив.
        for i in start...end{
            values[i] = scratch[i]
        }
}
