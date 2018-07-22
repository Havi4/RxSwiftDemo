//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var aOptional: String? = nil
var array: Array? = ["1",aOptional,"li"]

var values:[Int?] = [1,3,5,7,9,nil]
let flattenResult = values.flatMap{ $0 }


