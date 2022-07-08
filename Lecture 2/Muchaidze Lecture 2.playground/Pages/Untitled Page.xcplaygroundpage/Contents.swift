//: [Previous](@previous)

import Foundation

let startList: Int? = nil

print(startList ?? "araa araperi anu nili")

var endList: Int

if let value = startList{
    endList = value
}else{
    print("araa")
}

print(endList)
