//
//  RegisterRequest.swift
//  sopt-37th-Seminar-01
//
//  Created by 김나연 on 11/8/25.
//


/// 유저 등록 API
struct RegisterRequest: Encodable {
    let username: String
    let password: String
    let name: String
    let email: String
    let age: Int
}
