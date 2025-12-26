//
//  NewsModel.swift
//  News
//
//  Created by Ece Akcay on 25.12.2025.
//

import Foundation

struct NewsModel : Codable {
    let articles : [Article]
}


struct Article : Codable {
    let title : String?
    let description : String?
}
