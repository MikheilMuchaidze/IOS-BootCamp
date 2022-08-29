import UIKit

/*
 შექმენი კლასი 'უნივერსიტეტი', რომელსაც ექნება შემდეგი თვისებები:
 - დასახელება ✅
 - დაარსების წელი ✅
 - სტრუდენტების სია (ქვემოთ არის აღწერა) ✅
 - ლექტორების სია (ქვემოთ არის აღწერა) ✅
 - ფაკულტეტების სია (შექმენი ენამი და ჩამოწერე სასურველი ფაკულტეტები)✅
 
 შექმენი 'სტუდენტის' კლასი შემდეგი ველებით:
 - სახელი და გვარი ✅
 - პირადი ნომერი✅
 - ფაკულტეტი✅
 - ჩაბარების წელი✅
 - ქულების სია ( შექმენი სტრუქრურა ველებით: [გაითვალისწინეთ ქულების მაქსიმალური რაოდენობა არის 100] ✅
 - საგნის დასახელება (აღწერე ენამი ), ✅
 - აქტიურობის ქულა, (Double) ✅
 - შუალედურების ქულა, (Double)✅
 - საბოლოო გამოცდის ქულა (Double)✅
 - GPA✅
 
 
 შექმენი 'ლექტორის' კლასი შემდეგი ველებით:
 - სახელი და გვარი✅
 - პირადი ნომერი✅
 - ფაკულტეტი✅
 - საგნების სია, რასაც ასწავლის ( გამოიყენე ენამი ) ✅
 - ცხრილი ✅
 
 ცხრილი:
 აღწერე სტრუქტურა, რომელის ველებიც იქნება კვირის დღეები (ორშაბათიდან შაბათის ჩათვლით. გაითვალისწინეთ, შეიძლება რომელიმე დღეს საერთოდ არ ჰქონდეს ლექცია ჩასატარებელი (ოფშენალი) )✅
 კვირის დღე:
 აღწერე სტრუქრურა, რომელსაც ექნება ერთი ველი - ჩასატარებელი ლექციების სია ✅
 ჩასატარებელი ლექცია:
 იქნება სტრუქტურა ველებით
 - საგანი✅
 - ფაკულტეტი✅
 - დაწყების საათი (ტექსტი)✅
 - დასრულების საათი (ტექსტი)✅
 - აუდიტორიის ნომერი✅
 
 */

//Faculty
enum Faculty {
    case science
    case psychology
    case law
    case medicine
    case Politics
    case ComputerProgramming
}

//University
class University {
    let name: String
    let dateOfEstablish: Int
    var students: [Student] = [] {
        didSet {
            print("University has \(students.count) students")
        }
    }
    var lecturers: [Lecturer] = [] {
        didSet {
            print("University has \(lecturers.count) lecturers")
        }
    }
    
    var faculties: [Faculty] {
        get {
            return self.faculties
        }
    }
    

    init(name: String, dateOfEstablish: Int) {
        self.name = name
        self.dateOfEstablish = dateOfEstablish
    }
}


//Student
class Student {
    let name, surname: String
    let id: Int
    let faculty: Faculty
    let dateOfEnroll: Int
    var points: [Point]
    
    init(name: String, surname: String, id: Int, faculty: Faculty, dateOfEnroll: Int, points: [Point]) {
        self.name = name
        self.surname = surname
        self.id = id
        self.faculty = faculty
        self.dateOfEnroll = dateOfEnroll
        self.points = points
    }
    
    //1
    func countStudentYears(to currentYear: Int) -> Int {
        return currentYear - dateOfEnroll
    }
    
    //2
    func getFullName() -> (firstName: String, lastName: String) {
        return (name, surname)
    }
    
    //3
    func getStudentYearOfBirth(ageWhenEnrolled: Int) -> Int {
        guard ageWhenEnrolled >= 18 else {
            print("Student age must be equal or higher than 18")
            return 0
        }
        
        return dateOfEnroll - ageWhenEnrolled
    }
    
    //4
    func getHighestScoreSubjects() -> [Subject] {
        var highScoreSubjects = [Subject]()
        for point in points {
            if point.overallPoint > 89 {
                highScoreSubjects.append(point.subject)
                print(point.subject)
            }
        }
        highScoreSubjects.isEmpty ? print("There are no subjects with higher score than 89") : print("")
        
        return highScoreSubjects
    }
    
    //5
    func getLowestScoreSubjects() -> [Subject] {
        let lowestScoreSubjects = points.filter({ $0.overallPoint < 51 }).map({$0.subject})
        lowestScoreSubjects.isEmpty ? print("Student did not fail in any subject") : lowestScoreSubjects.forEach { print($0) }

        return lowestScoreSubjects
    }
    
    //6
    func getFailedSubjects() -> [Subject] {
        let failedSubjects = points.filter { $0.finalExamPoint <= 20 }.map { $0.subject }
        failedSubjects.isEmpty ? print("Student did not fail in any final exam") : failedSubjects.forEach { print($0) }
        
        return failedSubjects
    }
    
    //7
    func getStudentActivityBySubject() {
        let activity = points.sorted(by: { $0.activityPoint > $1.activityPoint }).first
        let overall = points.sorted(by: { $0.overallPoint > $1.overallPoint }).first
        
        if let highestActivity = activity, let highestOverall = overall {
            highestActivity.activityPoint >= highestOverall.activityPoint && highestActivity.overallPoint > highestOverall.overallPoint ? print(highestActivity.subject) : print(highestOverall.subject)
        }
    }
}


//Subject
enum Subject {
    case subject1
    case subject2
    case subject3
    case subject4
    case subject5
    case subject6
}


//Point
struct Point {
    let subject: Subject
    let activityPoint: Double
    let middleExamPoint: Double
    var finalExamPoint: Double
    var GPA: Double {
        4 * (overallPoint/100)
    }
    
    var overallPoint: Double {
        activityPoint + middleExamPoint + finalExamPoint
    }
    
    init(subject: Subject) {
        self.subject = subject
        self.activityPoint = round(Double.random(in: 0...20))
        self.middleExamPoint = round(Double.random(in: 0...40))
        self.finalExamPoint = round(Double.random(in: 0...40))
    }
    
    ///Init for hand typed objects
//    init(subject: Subject, activityPoints: Double, middleExamPoint: Double, finalExamPoint: Double) {
//        self.subject = subject
//        self.activityPoint = activityPoints
//        self.middleExamPoint = middleExamPoint
//        self.finalExamPoint = finalExamPoint
//    }
    
}


//Lecturer
class Lecturer {
    let name, surname: String
    let id: Int
    let faculty: Faculty
    let subjects: [Subject]
    let schedule: [Schedule]
    
    init(name: String, surname: String, id: Int, faculty: Faculty, subjects: [Subject], schedule: [Schedule]) {
        self.name = name
        self.surname = surname
        self.id = id
        self.faculty = faculty
        self.subjects = subjects
        self.schedule = schedule
    }
}

//Schedule
struct Schedule {
    var monday, tuesday, wednesday, thursday, friday, saturday: WeekDay?
}

//WeekDay
struct WeekDay {
    let todaysLectures: [Lecture]?
}

//Lecture
struct Lecture {
    let subject: Subject
    let faculty: Faculty
    let startTime: String
    let endTime: String
    let numberOfAuditorium: Int
    
    func calculatedLectureDuration() -> Double {
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm"
        let startDate = formatter.date(from: startTime)
        let endDate = formatter.date(from: endTime)
        if let start = startDate, let end = endDate {
            let elapsedTime = end.timeIntervalSince(start)
            let hour = floor(elapsedTime / 60 / 60)
            return hour
        }
        return 0.0
    }
}

 
 /*
 ქვემოთ მოცემული დავალების (ფუნქციების) გარდა, შეხედულებისამებრ, გამოიყენეთ ფროფერთი ობზერვერები, გამოთვლითი ფროფერთები, შექმენით სხვა, დამხმარე ფუნქციებიც.
 
 
 სტუდენტის ობიექტს უნდა ქონდეს მეთოდები:
 1. რომელიც პარამეტრად მიიღებს მიმდინარე წელს და დაგვიბრუნებს, რამდენი წელია, რაც სწავლობს ეს სტუდენტი
 2. რომელიც დაგვიბრუნებს თაფლს (firstName: String, lastName: String), სადაც firstName და lastName სახელი და გვარისგან მიიღება (ჩავთვალოთ რომ ” ” სფეისი არის გამყოფი)
 3. რომელიც გვეტყვის, რომელ წელს დაიბადა სტუდენტი (თუ პარამეტრად ჩავაწვდით, ჩაბარების დროს რამდენი წლისაც იყო, ვიგულისხმოთ, რომ 18 წლისანი აბარებენ უნივერსიტეტში)
 4. რომელიც დაგვიბრუნებს იმ საგნების სიას, სადაც სტუდენტს 89+ ქულა აქვს
 5. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (51 ქულაზე ნაკლები აქვს)
 6. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (ამ შემთხვევაში დავამატოთ პირობა, რომ საბოლოო გამოცდის ქულა მეტი უნდა იყოს 20-ზე)
 7. რომელიც გვეტყვის, რომელ საგანში იყო სტუდენტი ყველაზე მეტად აქტიური (აქტიურობის ქულის მიხედვით, შემდეგ შეადარეთ ჯამური ქულა)
 */


//MARK: -  Task 1
//1. რომელიც პარამეტრად მიიღებს მიმდინარე წელს და დაგვიბრუნებს, რამდენი წელია, რაც სწავლობს ეს სტუდენტი
print("1___")

/// here is hand typed code, if randomizer won't give you good examples
//var student1 = Student(name: "Jumber", surname: "Tkapladze", id: 010110, faculty: .ComputerProgramming, dateOfEnroll: 2016, points: [
//    Point(subject: .subject1, activityPoints: 20, middleExamPoint: 35, finalExamPoint: 30),
//    Point(subject: .subject2, activityPoints: 6, middleExamPoint: 15, finalExamPoint: 19),
//    Point(subject: .subject3, activityPoints: 18, middleExamPoint: 32, finalExamPoint: 25),
//    Point(subject: .subject4, activityPoints: 13, middleExamPoint: 40, finalExamPoint: 30),
//    Point(subject: .subject5, activityPoints: 20, middleExamPoint: 40, finalExamPoint: 35),
//    Point(subject: .subject6, activityPoints: 15, middleExamPoint: 20, finalExamPoint: 17)
//])

var student1 = Student(name: "Jumber", surname: "Tkapladze", id: 010110, faculty: .ComputerProgramming, dateOfEnroll: 2016, points: [
    Point(subject: .subject1),
    Point(subject: .subject2),
    Point(subject: .subject3),
    Point(subject: .subject4),
    Point(subject: .subject5),
    Point(subject: .subject6)
])



let currentYear = Calendar.current.component(.year, from: Date())
print(student1.countStudentYears(to: currentYear), "years", "\n")



//MARK: - Task 2
//2. რომელიც დაგვიბრუნებს თაფლს (firstName: String, lastName: String), სადაც firstName და lastName სახელი და გვარისგან მიიღება (ჩავთვალოთ რომ ” ” სფეისი არის გამყოფი)
print("2___")
let fullName = student1.getFullName()
print(fullName.firstName, fullName.lastName, "\n")



//MARK: - Task 3
//3. რომელიც გვეტყვის, რომელ წელს დაიბადა სტუდენტი (თუ პარამეტრად ჩავაწვდით, ჩაბარების დროს რამდენი წლისაც იყო, ვიგულისხმოთ, რომ 18 წლისანი აბარებენ უნივერსიტეტში)
print("3___")
print(student1.getStudentYearOfBirth(ageWhenEnrolled: 18), "\n")



//MARK: - Task 4
//4. რომელიც დაგვიბრუნებს იმ საგნების სიას, სადაც სტუდენტს 89+ ქულა აქვს
print("4___")
student1.getHighestScoreSubjects()



//MARK: - Task 5
//5. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (51 ქულაზე ნაკლები აქვს)
print("5___")
student1.getLowestScoreSubjects()



//MARK: - Task 6
//6. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (ამ შემთხვევაში დავამატოთ პირობა, რომ საბოლოო გამოცდის ქულა მეტი უნდა იყოს 20-ზე)
print("6___")
student1.getFailedSubjects()


//MARK: - Task 7
//7. რომელიც გვეტყვის, რომელ საგანში იყო სტუდენტი ყველაზე მეტად აქტიური (აქტიურობის ქულის მიხედვით, შემდეგ შეადარეთ ჯამური ქულა)
print("7___")
student1.getStudentActivityBySubject()



//MARK: - Optional Tasks
print("Optional____")

student1.points[0].GPA

let university = University(name: "Harvard", dateOfEstablish: 1636)
university.students.append(student1)

let lecture1 = Lecture(subject: .subject1, faculty: .Politics, startTime: "14:00", endTime: "17:00", numberOfAuditorium: 103)
let lecture2 = Lecture(subject: .subject2, faculty: .law, startTime: "09:00", endTime: "11:00", numberOfAuditorium: 103)

let lecturer = Lecturer(name: "Ushangi", surname: "Jgarkava", id: 0201345, faculty: .Politics, subjects: [.subject4], schedule: [Schedule(monday: nil, tuesday: WeekDay(todaysLectures: [lecture1]), wednesday: nil, thursday: WeekDay(todaysLectures: [lecture1, lecture2]), friday: nil, saturday: nil)])

university.lecturers.append(lecturer)

lecture1.calculatedLectureDuration()
lecture2.calculatedLectureDuration()


