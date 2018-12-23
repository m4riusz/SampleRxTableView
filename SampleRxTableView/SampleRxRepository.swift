//
//  SampleRxRepository.swift
//  SampleRxTableView
//
//  Created by Mariusz Sut on 23/12/2018.
//

import Foundation
import RxSwift
import Alamofire

protocol ISampleRxRepository {
    func searchForRepositories(_ text: String)-> Observable<[SampleRepositoryModel]>
}

class SampleRxRepository: ISampleRxRepository{
    func searchForRepositories(_ text: String) -> Observable<[SampleRepositoryModel]> {
        return Observable<[SampleRepositoryModel]>.create({ (observer) -> Disposable in
            Alamofire.request("https://api.github.com/search/repositories?q=\(text.count > 0 ? text : "''")&sort=stars&order=desc")
                .responseData(completionHandler: { (data) in
                    switch data.result {
                    case .success(let value):
                        do {
                            let decoder = JSONDecoder()
                            let json = try decoder.decode(Resonse<SampleRepositoryModel>.self, from: value)
                            observer.onNext(json.items)
                            observer.onCompleted()
                        } catch let error {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
            })
            return Disposables.create()
        })
    }
}

struct Resonse<T: Codable>: Codable {
    let items: [T]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
