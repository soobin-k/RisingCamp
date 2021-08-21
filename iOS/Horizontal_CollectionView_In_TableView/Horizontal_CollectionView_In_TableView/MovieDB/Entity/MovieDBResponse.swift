//
//  MovieDBResponse.swift
//  Horizontal_CollectionView_In_TableView
//
//  Created by 김수빈 on 2021/07/30.
//

import Foundation

struct MovieDBResponse: Decodable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
}

struct Movie: Decodable{
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
}
