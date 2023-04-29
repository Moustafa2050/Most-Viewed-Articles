//
//  articleModel.swift
//  Most Viewed Articles
//
//  Created by Moustafa on 29/04/2023.
//

import Foundation

struct responseGetArticles: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [ArticleModel]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct ArticleModel: Codable {
    let uri: String?
    let url: String?
    let id, assetID: Int?
    let source, publishedDate, updated, section: String?
    let subsection, nytdsection, adxKeywords: String?
    let byline, type, title, abstract: String?
    let desFacet, orgFacet: [String]?
    let perFacet, geoFacet: [String]?
    let media: [Media]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case  byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type, subtype, caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: String?
    let height, width: Int?
}





