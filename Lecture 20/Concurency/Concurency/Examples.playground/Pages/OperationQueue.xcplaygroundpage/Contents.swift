//: [Previous](@previous)

import Foundation

struct OperationExample {
    
    func useOperation() {
        let operation = BlockOperation()
        operation.qualityOfService = .utility
        operation.addExecutionBlock {
            print("🟢")
        }
        
        operation.addExecutionBlock {
            print("🌕")
        }
        
        operation.addExecutionBlock {
            print("🔴")
        }
        
        let newOperation = BlockOperation()
        newOperation.qualityOfService = .background
        
        print(newOperation.qualityOfService)
        newOperation.addExecutionBlock {
            print("🟢🟢")
        }
        
        newOperation.addExecutionBlock {
            print("🌕🌕")
        }
        
        newOperation.addExecutionBlock {
            print("🔴🔴")
        }
        
        let queue = OperationQueue()
        
        queue.addOperation(operation)
        queue.addOperation(newOperation)
    }
}

let object = OperationExample()
object.useOperation()
