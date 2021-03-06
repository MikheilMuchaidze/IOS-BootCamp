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
//            print("๐ข")
//            wrappedValue = wrappedValue.capitalized
//        }
//    }
//
//    init(wrappedValue: String) {
//        print("๐")
//        self.wrappedValue = wrappedValue.capitalized
//    }
//}
struct QulebisSia {
    let sagnDasax: sagnebisSia
    let aqtQula: Double
    let shualedQula: Double
    let sabQul: Double
    //แแแแแแแแแกแฌแแแแ แฅแฃแแแแแก แแแฅแกแแแแแฃแ แ แ แแแแแแแแ แแ แแก 100)

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
//1. แ แแแแแแช แแแ แแแแขแ แแ แแแแฆแแแก แแแแแแแแ แ แฌแแแก แแ แแแแแแแ แฃแแแแก, แ แแแแแแ แฌแแแแ, แ แแช แกแฌแแแแแแก แแก แกแขแฃแแแแขแ
print("1 davaleba")

studentList.forEach { elem in
    print("\(elem.name) \(elem.swavlidDroDge)")
}

studenti1.swavlisWlebi(aqamde: 2024)

studentList.forEach { elem in
    print("\(elem.name) \(elem.GPA)")
}
//2. แ แแแแแแช แแแแแแแ แฃแแแแก แแแคแแก (firstName: String, lastName: String), แกแแแแช firstName แแ lastName แกแแฎแแแ แแ แแแแ แแกแแแ แแแแฆแแแ (แฉแแแแแแแแ แ แแ โ โ แกแคแแแกแ แแ แแก แแแแงแแคแ)
print("2 davaleba")

studentList.forEach { elem in
    print("\(elem.nameAndSurToString.firstName) \(elem.nameAndSurToString.lastName)")
}
//3. แ แแแแแแช แแแแขแงแแแก, แ แแแแ แฌแแแก แแแแแแแ แกแขแฃแแแแขแ (แแฃ แแแ แแแแขแ แแ แฉแแแแฌแแแแ, แฉแแแแ แแแแก แแ แแก แ แแแแแแ แฌแแแกแแช แแงแ, แแแแฃแแแกแฎแแแ, แ แแ 18 แฌแแแกแแแ แแแแ แแแแ แฃแแแแแ แกแแขแแขแจแ)
print("3 davaleba")

studentList.forEach { elem in
    print("\(elem.nameAndSurToString.firstName) \(elem.nameAndSurToString.lastName) \(elem.dabWeli)")
}
//4. แ แแแแแแช แแแแแแแ แฃแแแแก แแ แกแแแแแแแก แกแแแก, แกแแแแช แกแขแฃแแแแขแก 89+ แฅแฃแแ แแฅแแก
print("4 davaleba")

studentList.forEach { elem in
    if elem.jamiQula > 89.0 {
        print("\(elem.nameAndSurToString.firstName) \(elem.nameAndSurToString.lastName) \(elem.jamiQula)")
    }
}
//5. แ แแแแแแช แแแแแแแ แฃแแแแก แแ แกแแแแแแก, แกแแแแช แฉแแแญแ แ แกแขแฃแแแแขแ (51 แฅแฃแแแแ แแแแแแแ แแฅแแก)


let aa = Students(name: "sss", surName: "sss", ID: <#T##Int#>, pakulteti: <#T##PakultetebisSia#>, chabWeli: <#T##Int#>, mimdinareWeli: <#T##Int#>, qulebSia: <#T##QulebisSia#>)
