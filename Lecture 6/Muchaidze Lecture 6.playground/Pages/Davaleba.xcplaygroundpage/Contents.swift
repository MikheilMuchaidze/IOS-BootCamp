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
    
    var aQula: Double {
        get {
            let jamiQula: Double = qulebSia.aqtQula + qulebSia.shualedQula + qulebSia.sabQul
            return jamiQula
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
//1. რომელიც პარამეტრად მიიღებს მიმდინარე წელს და დაგვიბრუნებს, რამდენი წელია, რაც სწავლობს ეს სტუდენტი
print("1 davaleba")
let studenti1 = Students(name: "Mikheil", surName: "Muchaidze", ID: 0102706, pakulteti: .Informatika, chabWeli: 2022, mimdinareWeli: 2025, qulebSia: .init(sagnDasax: .IOSdevelopment, aqtQula: 5.0, shualedQula: 3.5, sabQul: 5.0))

print("studentiss wavlis dro wlebshi: \(studenti1.mimdinareWeli-studenti1.chabWeli), swavlis dro dgeebshia: \(studenti1.swavlidDroDge)")
print("Studentis GPA = \(studenti1.GPA) ")
//2. რომელიც დაგვიბრუნებს თაფლს (firstName: String, lastName: String), სადაც firstName და lastName სახელი და გვარისგან მიიღება (ჩავთვალოთ რომ ” ” სფეისი არის გამყოფი)
print("2 davaleba")
let student2 = Students(name: "Giorgia", surName: "Magradze", ID: 5220206, pakulteti: .Ingineria, chabWeli: 2015, mimdinareWeli: 2020, qulebSia: .init(sagnDasax: .Konsruqciebi, aqtQula: 1.5, shualedQula: 5.0, sabQul: 5.5))

let student2FullName = student2.nameAndSurToString
print(student2FullName)
//3. რომელიც გვეტყვის, რომელ წელს დაიბადა სტუდენტი (თუ პარამეტრად ჩავაწვდით, ჩაბარების დროს რამდენი წლისაც იყო, ვიგულისხმოთ, რომ 18 წლისანი აბარებენ უნივერსიტეტში)
print("3 davaleba")
let student3 = Students(name: "Nika", surName: "Yipshidze", ID: 1213123, pakulteti: .Ingineria, chabWeli: 2015, mimdinareWeli: 2020, qulebSia: .init(sagnDasax: .Konsruqciebi, aqtQula: 1.5, shualedQula: 5.0, sabQul: 5.5))

let student3DabWeli = student3.dabWeli
print("student3-is dabadebis weli: \(student3DabWeli)")
//4. რომელიც დაგვიბრუნებს იმ საგნების სიას, სადაც სტუდენტს 89+ ქულა აქვს
 


