/**
 ⭐️배열과 연결리스트⭐️
* 배열은 메모리에 저장할 때 인덱스를 통해 데이터에 접근할 수 있고, 인덱스만 알면 값에 대한 접근이 매우 빠른 장점이 있으나,
 마지막 인덱스가 아닌 element를 삭제하거나 삽입 할 경우 element를 재배치 하는 작업 때문에 오버헤드가 발생하는 단점이 있음.
* 연결리스트는 이러한 배열의 단점을 보완한다.
 배열처럼 순차적으로 데이터를 보관하는 것이 아닌, 각각 떨어진 공간에 존재하는 데이터를 연결해 놓은것.
 단점은 배열처럼 인덱스로 접근하는 것이 아니기 때문에 데이터에 접근하려면 처음부터 원하는 데이터 까지 순차적으로 찾아가야 해서 접근 속도가 느림.
 또한, 내 다음 데이터에 대한 연결 정보를 저장하는 별도의 데이터 공간이 필요해서 저장공간의 효율이 높지 않다.
 */

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T : Equatable>{
    private var head: Node<T>?
    
    func append(data: T?) {
        // head가 없는 경우 node를 생성 후 head로 지정해준다.
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
        
       
    }
    
    func insert(data: T?, at index: Int) {
        // head가 없는 경우 Node를 생성 후 head로 지정한다.
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next == nil {break}
            node = node?.next
        }
        
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = nextNode
    }
    
    func removeLast() {
        if head == nil {return}
        
        // head를 삭제하는 경우
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        
        while node?.next?.next != nil {
            node = node?.next
            print(node?.data)
        }
        
        node?.next = node?.next?.next
    }
    
    func remove(at index: Int) {
        if head == nil {return}
        
        // head를 삭제하는 경우
        if index == 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        var node = head
        print(head?.data)
        for _ in 0..<(index - 1) {
           
            if node?.next?.next == nil {break}
            node = node?.next
        }
        
        node?.next = node?.next?.next // 삭제할 노드의 바로 이전 노드의 넥스트를 삭제할 노드의 넥스트로 바꿔줌.
    }
    
    func searchNode(from data: T?) -> Node<T>? {
        if head == nil {return nil}
        
        var node = head
        
        while node?.next != nil {
            if node?.data == data {break}
            node = node?.next
        }
        
        
        return node
    }
}

var linkedList = LinkedList<Int>()

linkedList.append(data: 1)
linkedList.append(data: 2)
linkedList.append(data: 3)
linkedList.append(data: 4)
linkedList.searchNode(from: 3)



