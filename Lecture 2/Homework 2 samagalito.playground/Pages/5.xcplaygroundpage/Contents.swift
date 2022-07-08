import Cocoa

let names = ["გელა", "ზაირა", "შალვა", "მურადი", "მაყვალა"]
let grades = [80, 23, 71, 75, 100]
var namesAndMarksDictionary = [String : Int]()
var i = grades.count - 1
var maxMark = 0
var personWithMaxMark = String()

for name in names{
    namesAndMarksDictionary[name] = grades[i]
    if grades[i] > maxMark {
        maxMark = grades[i]
        personWithMaxMark = name
    }
    i -= 1
}

print(namesAndMarksDictionary)
print("\(personWithMaxMark) აქვს ყველაზე მაღალი შეფასება")
