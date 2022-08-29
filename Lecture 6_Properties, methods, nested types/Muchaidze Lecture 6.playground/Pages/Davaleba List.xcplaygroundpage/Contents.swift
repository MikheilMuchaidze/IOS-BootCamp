import UIKit
import Darwin

enum PakultetebisSia {
    case Informatika
    case Ingineria
    case Matematika
    case Istoria
    case Xelovneba
}
enum sagnebisSia {
    case IOSdevelopment
    case Konsruqciebi
    case Geometira
    case AxaliIstoria
    case Mxatvroba
}
class University {
    let dasaxeleba: String
    let daarsWeli: Int
    let studentebiSia: Students
    let leqtorebisSia: Lectors
    let pakultSia: PakultetebisSia
    
    init (dasaxeleba: String,
          daarsWeli: Int,
          studentebiSia: Students,
          leqtorebisSia: Lectors,
          pakultSia: PakultetebisSia) {
        
        self.dasaxeleba = dasaxeleba
        self.daarsWeli = daarsWeli
        self.studentebiSia = studentebiSia
        self.leqtorebisSia = leqtorebisSia
        self.pakultSia = pakultSia
    }
}
//@propertyWrapper struct under100Qula {
//    var wrappedValue: Int {
//        willSet{
//            print("🟢")
//            wrappedValue = wrappedValue.capitalized
//        }
//    }
//
//    init(wrappedValue: String) {
//        print("🌕")
//        self.wrappedValue = wrappedValue.capitalized
//    }
//}
struct QulebisSia {
    let sagnDasax: sagnebisSia
    let aqtQula: Double
    let shualedQula: Double
    let sabQul: Double
    //გაითვალისწინეთ ქულების მაქსიმალური რაოდენობა არის 100)

}
class Students {
    let name: String
    let surName: String
    let ID: Int
    let pakulteti: PakultetebisSia
    var chabWeli: Int
    var mimdinareWeli: Int
    let qulebSia: QulebisSia
        
    var jamiQula: Double {
        get {
            qulebSia.aqtQula + qulebSia.shualedQula + qulebSia.sabQul
        }
    }

    
    var dabWeli: Int {
        get {
            chabWeli - 18
        }
    }
    
    var nameAndSurToString: (firstName: String, lastName: String) {
        get {
            (self.name, self.surName)
        }
    }
    
    var GPA: Double {
        get {
            (qulebSia.aqtQula + qulebSia.shualedQula + qulebSia.sabQul) / 3
        }
    }
    
    var swavlidDroDge: Int {
        get {
            (mimdinareWeli - chabWeli) * 365
        }
    }
    
    func swavlisWlebi(aqamde wlamde: Int) {
        print("chabarebidan am wlamde : \(wlamde) : shen iswavle : \((wlamde - chabWeli) * 365) : dge")
    }

    init (name: String,
          surName: String,
          ID: Int,
          pakulteti: PakultetebisSia,
          chabWeli: Int,
          mimdinareWeli: Int,
          qulebSia: QulebisSia ) {
              self.name = name
              self.surName = surName
              self.ID = ID
              self.pakulteti = pakulteti
              self.chabWeli = chabWeli
              self.mimdinareWeli = mimdinareWeli
              self.qulebSia = qulebSia
    }
}
class Lectors {
    let name: String
    let surName: String
    let pakulteti: PakultetebisSia
    let sagnSia: sagnebisSia
    let cxrili: CxriliSaswavloDgis
    
    init (name: String,
          surName: String,
          pakulteti: PakultetebisSia,
          sagnSia: sagnebisSia,
          cxrili: CxriliSaswavloDgis ) {
            self.name = name
            self.surName = surName
            self.pakulteti = pakulteti
            self.sagnSia = sagnSia
            self.cxrili = cxrili
    }
}
struct CxriliSaswavloDgis {
    let orshabati: String?
    let samshabati: String?
    let otxshabati: String?
    let xutshabati: String?
    let paraskevi: String?
    let shabati: String?
}
struct KvirisDge {
    let chasLeqcSia: ChasatarebeLiLeqcia
}
struct ChasatarebeLiLeqcia {
    let sagani: sagnebisSia
    let pakulteti: PakultetebisSia
    let dawySaati: String
    let dasasrSaati: String
    let auditNom: Int
}

let studenti1 = Students(name: "Mikheil", surName: "Muchaidze", ID: 0102706, pakulteti: .Informatika, chabWeli: 2022, mimdinareWeli: 2025, qulebSia: .init(sagnDasax: .IOSdevelopment, aqtQula: 35.0, shualedQula: 15.0, sabQul: 20.0))

let student2 = Students(name: "Giorgia", surName: "Magradze", ID: 5220206, pakulteti: .Ingineria, chabWeli: 2015, mimdinareWeli: 2020, qulebSia: .init(sagnDasax: .Konsruqciebi, aqtQula: 40.0, shualedQula: 20.0, sabQul: 30.0))

let student3 = Students(name: "Nika", surName: "Yipshidze", ID: 1213123, pakulteti: .Ingineria, chabWeli: 2017, mimdinareWeli: 2020, qulebSia: .init(sagnDasax: .Konsruqciebi, aqtQula: 30.0, shualedQula: 17.0, sabQul: 26.0))

let studentList = [studenti1, student2, student3]
//1. რომელიც პარამეტრად მიიღებს მიმდინარე წელს და დაგვიბრუნებს, რამდენი წელია, რაც სწავლობს ეს სტუდენტი
print("1 davaleba")

studentList.forEach { elem in
    print("\(elem.name) \(elem.swavlidDroDge)")
}

studenti1.swavlisWlebi(aqamde: 2024)

studentList.forEach { elem in
    print("\(elem.name) \(elem.GPA)")
}
//2. რომელიც დაგვიბრუნებს თაფლს (firstName: String, lastName: String), სადაც firstName და lastName სახელი და გვარისგან მიიღება (ჩავთვალოთ რომ ” ” სფეისი არის გამყოფი)
print("2 davaleba")

studentList.forEach { elem in
    print("\(elem.nameAndSurToString.firstName) \(elem.nameAndSurToString.lastName)")
}
//3. რომელიც გვეტყვის, რომელ წელს დაიბადა სტუდენტი (თუ პარამეტრად ჩავაწვდით, ჩაბარების დროს რამდენი წლისაც იყო, ვიგულისხმოთ, რომ 18 წლისანი აბარებენ უნივერსიტეტში)
print("3 davaleba")

studentList.forEach { elem in
    print("\(elem.nameAndSurToString.firstName) \(elem.nameAndSurToString.lastName) \(elem.dabWeli)")
}
//4. რომელიც დაგვიბრუნებს იმ საგნების სიას, სადაც სტუდენტს 89+ ქულა აქვს
print("4 davaleba")

studentList.forEach { elem in
    if elem.jamiQula > 89.0 {
        print("\(elem.nameAndSurToString.firstName) \(elem.nameAndSurToString.lastName) \(elem.jamiQula)")
    }
}
//5. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (51 ქულაზე ნაკლები აქვს)


let aa = Students(name: "sss", surName: "sss", ID: <#T##Int#>, pakulteti: <#T##PakultetebisSia#>, chabWeli: <#T##Int#>, mimdinareWeli: <#T##Int#>, qulebSia: <#T##QulebisSia#>)
