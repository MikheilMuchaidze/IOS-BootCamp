//
//  ViewController.swift
//  Muchaidze_Lecture_15
//
//  Created by Misha Muchaidze on 20220712...
//

import UIKit

class ViewController: UIViewController {
    
    struct Movie {
        let title: String
        let releaseDate: String
        let imdb: Double
        let mainActor: String
        let seen: Bool
        let isFavourite: Bool
        let description: String
    }
    
    let moviesList = [
        Movie(title: "Avatar", releaseDate: "2009", imdb: 8.0, mainActor: "Sam Worthington", seen: true, isFavourite: false, description: "About humans controlling humanoid robots with help of specific technology"),
        Movie(title: "I Am Legend", releaseDate: "2007", imdb: 6.7, mainActor: "Will Smith", seen: true, isFavourite: true, description: "About lonely man and his dog surviving post-apocalyptic world and fighting zombies from time to time"),
        Movie(title: "300", releaseDate: "2006", imdb: 7.8, mainActor: "Gerard Butler", seen: true, isFavourite: false, description: "About last 300 spartans standing and fihting for there country against great enemy"),
        Movie(title: "The Avengers", releaseDate: "2012", imdb: 8.9, mainActor: "Robert Downey Jr.", seen: true, isFavourite: true, description: "About group of superheroes which are united and fighting agains all kind of enemies which appear on earth"),
        Movie(title: "The Wolf of Wall Street", releaseDate: "2013", imdb: 9.2, mainActor: "Leonardo DiCaprio", seen: true, isFavourite: true, description: "About very smart salesman which got really wealth but get cought in the end for his criminal activity"),
        Movie(title: "Interstellar", releaseDate: "2014", imdb: 9.6, mainActor: "Matthew McConaughey", seen: true, isFavourite: true, description: "About group of people sent into space to find new planet for mankind"),
        Movie(title: "Game of Thrones", releaseDate: "2011", imdb: 9.8, mainActor: "Peter Dinklage", seen: true, isFavourite: true, description: "About people who are fighting for power and influance over country"),
        Movie(title: "Vikings", releaseDate: "2013", imdb: 5.9, mainActor: "Travis Fimmel", seen: true, isFavourite: false, description: "About historical lives and advantures of one specific vikings tribe"),
        Movie(title: "Gotham", releaseDate: "2014", imdb: 7.3, mainActor: "Ben McKenzie", seen: false, isFavourite: false, description: "About childhood and hisyory of becoming betman from his childhood"),
        Movie(title: "Narcos", releaseDate: "2015", imdb: 8.8, mainActor: "Wagner Moura", seen: false, isFavourite: false, description: "About one of the greatest drug dealers of all time")
    ]
    
    
        


    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

