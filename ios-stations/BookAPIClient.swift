//
//  BookAPIClient.swift
//  ios-stations
//
import Alamofire
import Foundation
import UIKit

protocol BookAPIClientProtocol {
    func fetchBooks(offset: Int, completion: @escaping ([Book]?) -> Void)
}

class BookAPIClient: BookAPIClientProtocol {
    func fetchBooks(offset: Int, completion: @escaping ([Book]?) -> Void) {
        let apiURL = "https://railway.bookreview.techtrain.dev/public/books"
        AF.request(apiURL).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let books = try JSONDecoder().decode([Book].self, from: data)
          
                        completion(books)
                    } catch {
                        print("デコードエラー: \(error)")
                        completion(nil)
                    }
                } else {
                    print("データがありません")
                    completion(nil)
                }
            case .failure(let error):
                print("リクエストエラー: \(error)")
                completion(nil)
            }
        }
    }
}
