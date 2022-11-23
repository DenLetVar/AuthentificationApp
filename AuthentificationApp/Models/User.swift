//
//  User.swift
//  AuthentificationApp
//
//  Created by Denis on 22.11.2022.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(userName: "User",
             password: "Password",
             person: Person(name: "Денис",
                            surname: "Бордунов",
                            age: 30,
                            about: "Привет, меня зовут Денис и я учусь программировать"))
    }
}

