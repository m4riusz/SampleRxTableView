//
//  SampleRepositoryModel.swift
//  SampleRxTableView
//
//  Created by Mariusz Sut on 23/12/2018.
//

import Foundation

struct SampleRepositoryModel: Codable {
    let fullName: String
    let owner: Owner
    let htmlURL: String
    let description: String
    let forks, watchers: Int
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case description, forks, watchers
    }
}

struct Owner: Codable {
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
