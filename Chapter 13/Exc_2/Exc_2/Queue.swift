import Cocoa

class Queue<T>: CustomStringConvertible {
	private var head : QueueCell<T>?
	private var tail : QueueCell<T>?
	init() { }
	
	func enqueue(value : T){
		let newCell  = QueueCell<T>(value: value)
		guard let _ = head, let tl = tail else {
			head = newCell
			tail = newCell
			return
		}
		tl.prev = newCell
		newCell.next = tl
		tail = newCell
	}
	
	func dequeue() -> T?{
		guard let _ = head, let _ = tail else {
			return nil
		}
		let value = head?.value
		head = head?.prev
		head?.next = nil
		return value
	}
	
	public var description: String{
		var str = "DequeQueue: "
		var cell = head
		while let item = cell {
			str  += "\(String(describing: item.value)) "
			cell = cell?.prev
		}
		return str
	}
}

fileprivate class QueueCell<T>{
	init(value:T) {
		self.value = value
	}
	let value : T
	var next : QueueCell<T>?
	var prev : QueueCell<T>?
}

