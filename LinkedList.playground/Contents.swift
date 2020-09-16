

class Node {
    
    var value: Int!
    var next: Node?
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
    
}

class LinkedList {
    
    var head: Node? = nil
    var tail: Node? = nil
    var length = 0
    
    func append(value: Int) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
        length += 1
    }
    
    func prepend(value: Int) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = head
        } else {
            newNode.next = head
            head = newNode
            length += 1
        }
    }
    
    func insert(value: Int, at index: Int) {
        let insertNode = Node(value: value)
        let previousNode = findNode(at: index - 1)
        let nextNode = previousNode!.next
        previousNode!.next = insertNode
        insertNode.next = nextNode
        length += 1
    }
    
    func remove(at index: Int) {
        let previouNode = findNode(at: index - 1)
        let currentNode = previouNode!.next
        let nextNode = currentNode!.next
        previouNode?.next = nextNode
        length -= 1
    }
    
    func findNode(at index: Int) -> Node? {
        var counter = 0
        var temp = head
        while temp != nil {
            temp = temp!.next
            counter += 1
            if counter == index {
                return temp
            }
        }
        return nil
    }
    
    func printList() {
        var temp = head
        while temp != nil {
            print(temp!.value!)
            temp = temp!.next
        }
    }
    
}

let linkedList = LinkedList()
linkedList.append(value: 2)
linkedList.append(value: 3)
linkedList.append(value: 5)
linkedList.append(value: 8)
linkedList.prepend(value: 12)
linkedList.prepend(value: 1)
linkedList.insert(value: 4, at: 4)
linkedList.remove(at: 5)
linkedList.printList()
