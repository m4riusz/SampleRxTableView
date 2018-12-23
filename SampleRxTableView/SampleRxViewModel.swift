//
//  SampleRxViewModel.swift
//  SampleRxTableView
//
//  Created by Mariusz Sut on 23/12/2018.
//

import Foundation
import RxSwift

class SampleRxViewModel {
    
    let searchText = Variable<String?>("")
    let repositories = Variable([SampleRepositoryModel]())
    fileprivate var bag = DisposeBag()
    
    init() {
        let repository: ISampleRxRepository = SampleRxRepository()
        self.searchText.asObservable()
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { (text) in
                repository.searchForRepositories(text ?? "").subscribe(onNext: { items in
                    self.repositories.value = items
                }, onError: { error in
                    
                }).disposed(by: self.bag)
            }).disposed(by: self.bag)
    }
}
