import UIKit
import Darwin

//შექმენი კლასი 'უნივერსიტეტი', რომელსაც ექნება შემდეგი თვისებები:
//- დასახელება
//- დაარსების წელი
//- სტრუდენტების სია (ქვემოთ არის აღწერა)
//- ლექტორების სია (ქვემოთ არის აღწერა)
//- ფაკულტეტების სია (შექმენი ენამი და ჩამოწერე სასურველი ფაკულტეტები)

enum Faculty{
    case IT
    case BusinessAdministration
    case Managemen
}

class University{
    let name: String
    let foundationYear: Int
    let students: [Student]
    let lecturers: [Lecturer]
    let faculties: [Faculty]
    
    init(name: String, foundationYear: Int, students: [Student], lecturers: [Lecturer], faculties: [Faculty]){
        self.name = name
        self.foundationYear = foundationYear
        self.students = students
        self.lecturers = lecturers
        self.faculties = faculties
    }
}

// წესით შუალედურს, ფინალურს და აქტივომას მაქსიმალური ნიშანი აქვთ ხოლმე რაც @propertyWrapper-ით მოვაგვარე, ეს უზრუნველყოფს იმასაც რომ ქულათა ჩამი არ გასცდება 100-ს
struct Grade{
    let subject: Subject
    @maximumOfTwenty var activenessGrade: Double
    @maximumOfForty var midTermGrade: Double
    @maximumOfForty var finalExamGrade: Double
}

@propertyWrapper struct maximumOfForty{
    var wrappedValue: Double {
        didSet {
            wrappedValue = wrappedValue > 40 ? 40 : wrappedValue
        }
    }
    
    init(value: Double){
        wrappedValue = value > 40 ? 40 : value
    }
}

@propertyWrapper struct maximumOfTwenty{
    var wrappedValue: Double {
    didSet {
            wrappedValue = wrappedValue > 20 ? 20 : wrappedValue
        }
    }
    
    init(value: Double){
        wrappedValue = value > 20 ? 20 : value
    }
}

//შექმენი 'ლექტორის' კლასი შემდეგი ველებით:
//- სახელი და გვარი
//- პირადი ნომერი
//- ფაკულტეტი
//- საგნების სია, რასაც ასწავლის ( გამოიყენე ენამი )
//- ცხრილი

class Lecturer{
    let fullName: String
    let privateID: String
    let faculty: Faculty
    let subjects: [Subject]
    let schedule: Schedule
    
    init(fullName: String, privateID: String, faculty: Faculty, subjects: [Subject], schedule: Schedule){
        self.fullName = fullName
        self.privateID = privateID
        self.faculty = faculty
        self.subjects = subjects
        self.schedule = schedule
    }
}

enum Subject{
    case FrontEnd
    case BackEnd
    case MobileDev
    case DesktopApps
}

//ცხრილი:
//აღწერე სტრუქტურა, რომელის ველებიც იქნება კვირის დღეები (ორშაბათიდან შაბათის ჩათვლით. გაითვალისწინეთ, შეიძლება რომელიმე დღეს საერთოდ არ ჰქონდეს ლექცია ჩასატარებელი (ოფშენალი) )

struct Schedule{
    let monday: WeekDay?
    let tuesday: WeekDay?
    let wednesday: WeekDay?
    let thursday: WeekDay?
    let friday: WeekDay?
    let saturday: WeekDay?
}

//კვირის დღე:
//აღწერე სტრუქრურა, რომელსაც ექნება ერთი ველი - ჩასატარებელი ლექციების სია

struct WeekDay{
    let lectures: [Lecture]
}

//ჩასატარებელი ლექცია:
//იქნება სტრუქტურა ველებით
//- საგანი
//- ფაკულტეტი
//- დაწყების საათი (ტექსტი)
//- დასრულების საათი (ტექსტი)
//- აუდიტორიის ნომერი

struct Lecture{
    let subject: String
    let Faculty: Faculty
    let StartTime: String
    let EndTime: String
    let RoomNumber: Int
}


//შექმენი 'სტუდენტის' კლასი შემდეგი ველებით:
//- სახელი და გვარი
//- პირადი ნომერი
//- ფაკულტეტი
//- ჩაბარების წელი
//- ქულების სია ( შექმენი სტრუქრურა ველებით: [გაითვალისწინეთ ქულების მაქსიმალური რაოდენობა არის 100]
//- საგნების სია (აღწერე ენამი ),
//- აქტიურობის ქულა, (Double)
//- შუალედურების ქულა, (Double)
//- საბოლოო გამოცდის ქულა (Double)
//- GPA
//ქვემოთ მოცემული დავალების (ფუნქციების) გარდა, შეხედულებისამებრ, გამოიყენეთ ფროფერთი ობზერვერები, გამოთვლითი ფროფერთები, შექმენით სხვა, დამხმარე ფუნქციებიც.
//სტუდენტის ობიექტს უნდა ქონდეს მეთოდები:
//1. რომელიც პარამეტრად მიიღებს მიმდინარე წელს და დაგვიბრუნებს, რამდენი წელია, რაც სწავლობს ეს სტუდენტი
//
//2. რომელიც დაგვიბრუნებს თაფლს (firstName: String, lastName: String), სადაც firstName და lastName სახელი და გვარისგან მიიღება (ჩავთვალოთ რომ ” ” სფეისი არის გამყოფი)
//3. რომელიც გვეტყვის, რომელ წელს დაიბადა სტუდენტი (თუ პარამეტრად ჩავაწვდით, ჩაბარების დროს რამდენი წლისაც იყო, ვიგულისხმოთ, რომ 18 წლისანი აბარებენ უნივერსიტეტში)
//4. რომელიც დაგვიბრუნებს იმ საგნების სიას, სადაც სტუდენტს 89+ ქულა აქვს
//5. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (51 ქულაზე ნაკლები აქვს)
//6. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (ამ შემთხვევაში დავამატოთ პირობა, რომ საბოლოო გამოცდის ქულა მეტი უნდა იყოს 20-ზე)
//7. რომელიც გვეტყვის, რომელ საგანში იყო სტუდენტი ყველაზე მეტად აქტიური (აქტიურობის ქულის მიხედვით, შემდეგ შეადარეთ ჯამური ქულა)

@propertyWrapper struct maximumOfFour{
    var wrappedValue: Double {
        didSet {
            wrappedValue = wrappedValue > 4 ? 4 : wrappedValue
        }
    }
    
    init(value: Double){
        wrappedValue = value > 4 ? 4 : value
    }
}

class Student{
    let fullName: String
    let privateID: String
    let faculty: Faculty
    let entranceYear: Int
    let grades: [Grade]
    var GPA: Double {
        // * GPA-ს გამოთვლა არ ვიცი და ვითომ გამოვითვალე აქ :D *
        return Double.random(in: 1...4)
    }
    
    // დავალებები რომლებიც გამოთვლადი პარამეტრებითაც გამოვიდოდა გამოთვლადი პარამეტრებითაც შევასრულე, და ყოველი შემთხვევისთვის ფუნქციებიც დავტოვე უფრო სასურველი თუ იქნება
    var dividedName: (String, String){
        let splittedName = fullName.split(separator: " ")
        return (String(splittedName[0]), String(splittedName[1]))
    }
    
    var birthYear: Int{
        return entranceYear - 18
    }
    
    var AGradeSubjects: [Subject] {
        return grades.filter { $0.finalExamGrade + $0.midTermGrade + $0.activenessGrade > 89 }.map { $0.subject }
    }
    
    var failedSubjects: [Subject]{
        return grades.filter { $0.finalExamGrade + $0.midTermGrade + $0.activenessGrade < 51 }.map { $0.subject }
    }
    
    var failedSubjectsPassedFinal: [Subject]{
        return grades.filter { $0.finalExamGrade + $0.midTermGrade + $0.activenessGrade < 51 && $0.finalExamGrade > 20 }.map { $0.subject }
    }
    
    var mostActiveSubject: Subject {
        return grades.sorted{ $0.activenessGrade > $1.activenessGrade ||
            ($0.activenessGrade == $1.activenessGrade && $0.finalExamGrade + $0.midTermGrade > $1.finalExamGrade + $1.midTermGrade) }[0].subject
    }
    
    init(fullName: String, privateID: String, faculty: Faculty, entranceYear: Int, grades: [Grade]){
        self.fullName = fullName
        self.privateID = privateID
        self.faculty = faculty
        self.entranceYear = entranceYear
        self.grades = grades
    }
    
    func getYearsLearned(currentYear: Int) -> Int{
        return currentYear - entranceYear
    }
    
    func getDividedName() -> (String, String){
        let splittedName = fullName.split(separator: " ")
        return (String(splittedName[0]), String(splittedName[1]))
    }
    
    func getBirthYear() -> Int{
        return entranceYear - 18
    }
    
    func getSubjectsWithAGrade() -> [Subject]{
        return grades.filter { $0.finalExamGrade + $0.midTermGrade + $0.activenessGrade > 89 }.map { $0.subject }
    }
    
    func getFailedSubjects() -> [Subject]{
        return grades.filter { $0.finalExamGrade + $0.midTermGrade + $0.activenessGrade < 51 }.map { $0.subject }
    }
    
    func getFailedSubjectsPassedFinal() -> [Subject]{
        return grades.filter { $0.finalExamGrade + $0.midTermGrade + $0.activenessGrade < 51 && $0.finalExamGrade > 20 }.map { $0.subject }
    }
    
    func getMostActiveSubject() -> Subject {
        return grades.sorted{ $0.activenessGrade > $1.activenessGrade ||
            ($0.activenessGrade == $1.activenessGrade && $0.finalExamGrade + $0.midTermGrade > $1.finalExamGrade + $1.midTermGrade) }[0].subject
    }
}

let sdsd = Student(fullName: "sdsds", privateID: "23123123", faculty: .BusinessAdministration, entranceYear: 2020, grades: [.init(subject: .BackEnd, activenessGrade: 20.0, midTermGrade: 40.0, finalExamGrade: 40.0)])
