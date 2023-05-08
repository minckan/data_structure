
import Foundation

class Node<T : Comparable> {
    var data: T
    var left : Node?
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T:Comparable> {
    var root: Node<T>?
    
    func insert(data: T) {
        guard let root = self.root else {
            return self.root = Node.init(data: data)
        }
        
        var currentNode = root
        while true {
            if currentNode.data > data {
                guard let nextNode = currentNode.left else {
                    return currentNode.left = Node.init(data: data)
                }
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    return currentNode.right = Node.init(data: data)
                }
                currentNode = nextNode
            }
        }
    }
    
    func search(from data: T) -> Bool {
        if root == nil {return false}
        
        var currentNode = root
        while let node = currentNode {
            if node.data == data {
                return true
            }
            
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        return false
    }
    
    func remove(from data:T) -> Bool {
        guard let root = self.root else {return false}
        
        var parentNode = root
        var currentNode: Node? = root
        
        // 삭제할 노드 탐색
        while let node = currentNode {
            if node.data == data {break}
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
            
            parentNode = node
        }
        
        guard let deleteNode = currentNode else { // 탐색 실패
            return false
        }
        
        // 1. 자식이 없는 노드 삭제 (Leaf Node)
        if deleteNode.left == nil && deleteNode.right == nil {
            if parentNode.data > data {
                parentNode.left = nil
            } else {
                parentNode.right = nil
            }
            return true
        }
        
        // 2. child node가 하나만 있는 node 객체
        if deleteNode.left == nil || deleteNode.right == nil {
            if let node = deleteNode.left {
                parentNode.left = node
            }
            if let node = deleteNode.right {
                parentNode.right = node
            }
        }
        
        // 3. chile node 가 두개있는 node 삭제.
        if deleteNode.left !== nil && deleteNode.right !== nil {
            
        }
        
        return false
    }
    
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
    
    func drawDiagram() {
        print(diagram(for: root))
    }

}


let BST = BinarySearchTree<Int>()
BST.insert(data: 20)
BST.insert(data: 15)
BST.insert(data: 12)
BST.insert(data: 35)
BST.insert(data: 65)
BST.insert(data: 85)



BST.remove(from: 15)
BST.drawDiagram()
