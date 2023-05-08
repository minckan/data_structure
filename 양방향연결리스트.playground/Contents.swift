class Node<T>{
    var prev: Node?
    var data: T?
    var next: Node?
    
    init(data: T?, prev: Node? = nil, next: Node? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}

class DoublyLinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func append(data: T?) {
        // 연결리스트가 빈 경우, Node를 생성 후 head, tail로 지정한다.
        if head == nil || tail == nil {
            head = Node.init(data: data)
            tail = head
            
            return
        }
        
        let newNode = Node.init(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    func searchNode(from data: T?) -> Node<T>?{
        if head == nil || tail == nil {return nil}
        
        var node = head
        while node?.next != nil {
            if node?.data == data {break}
            node = node?.next
        }
        return node
    }
    
    func searchNodeFromTail(from data: T?) -> Node<T>? {
        if head == nil || tail == nil {return nil}
        
        var node = tail
        while node?.prev != nil {
            if node?.data == data {break}
            node = node?.prev
        }
        
        return node
    }
    
    func removeLast() {
        if head == nil || tail == nil {return}
        
        // head를 삭제하는 경우 (연결 리스트에 노드가 1개 밖에 없는 경우)
        if head?.next == nil {
            head = nil
            tail = nil
        }
        
        tail?.prev?.next = tail?.next
        tail = tail?.prev
    }
}

var list = DoublyLinkedList<String>()
list.append(data: "가")
list.append(data: "나")
list.append(data: "다")
list.append(data: "라")
list.removeLast()

