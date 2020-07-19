//
//  DataModel.swift
//  TechDemo
//
//  Created by SachchidaNand Mishra on 19/07/20.
//  Copyright © 2020 Sachchida Nand Mishra. All rights reserved.
//

import Foundation
import UIKit

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
    case NoURL = "URL not found..."
}

struct ResponseData: Codable {
    var responseTitle: String?
    var responseDataResults: [ResponseDataResult]
    
    private enum CodingKeys : String, CodingKey {
        case responseTitle = "title"
        case responseDataResults = "rows"
    }
}

struct ResponseDataResult: Codable {
    var resultTitle: String?
    var resultDescription: String?
    var resultImageURL: URL?
    
    private enum CodingKeys : String, CodingKey {
        case resultTitle = "title"
        case resultDescription = "description"
        case resultImageURL = "imageHref"
    }
}

class DataModel {
    static let instance = DataModel()
    var responseResultData: ResponseData?
    
    public static func getData(from urlString:String, success:@escaping(ResponseData)->(Void)){
        guard let url = NSURL(string: urlString) else {
            print(JSONError.NoURL)
            return
        }
        
        let request = NSMutableURLRequest(url:url as URL)
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let responseData = data else {
                return
            }
            
            if let utf8Data = String(decoding: responseData, as: UTF8.self).data(using: .utf8) {
                let response: ResponseData = try! JSONDecoder().decode(ResponseData.self, from: utf8Data)
                print(response.responseTitle!)
                DataModel.instance.responseResultData = response
                success(response)
            } else {
                print(JSONError.ConversionFailed)
            }
        }.resume()
    }
}
