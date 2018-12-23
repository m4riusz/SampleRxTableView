//
//  SampleRxTableViewCell.swift
//  SampleRxTableView
//
//  Created by Mariusz Sut on 23/12/2018.
//

import UIKit
import SnapKit

struct Spacing {
    static let none: CGFloat = 0.0
    static let normal: CGFloat = 8.0
    static let big: CGFloat = 16.0
}

class SampleRxTableViewCell: UITableViewCell {
    
    var repositoryNameLabel: UILabel?
    var repositoryUserNameLabel: UILabel?
    var repositoryUrlLabel: UILabel?
    var repositoryStarsLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    fileprivate func initialize() {
        self.initializeRepositoryNameLabel()
        self.initializeRepositoryUserNameLabel()
        self.initializeRepositoryUrlLabel()
        self.initializeRepositoryStarsLabel()
    }
    
    fileprivate func initializeRepositoryNameLabel() {
        self.repositoryNameLabel = UILabel()
        self.repositoryNameLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.repositoryNameLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.addSubview(self.repositoryNameLabel!)
        
        self.repositoryNameLabel?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(Spacing.normal)
            make.left.equalToSuperview().offset(Spacing.normal)
        })
    }
    
    fileprivate func initializeRepositoryUserNameLabel() {
        self.repositoryUserNameLabel = UILabel()
        self.repositoryUserNameLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.repositoryUserNameLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        self.repositoryUserNameLabel?.textColor = .darkGray
        self.addSubview(self.repositoryUserNameLabel!)
        
        self.repositoryUserNameLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.repositoryNameLabel!.snp.bottom).offset(Spacing.normal)
            make.left.equalToSuperview().offset(Spacing.normal)
            make.right.equalToSuperview().offset(-Spacing.normal)
        })
    }
    
    fileprivate func initializeRepositoryUrlLabel() {
        self.repositoryUrlLabel = UILabel()
        self.repositoryUrlLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.repositoryUrlLabel?.textColor = .lightGray
        self.addSubview(self.repositoryUrlLabel!)
        
        self.repositoryUrlLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.repositoryUserNameLabel!.snp.bottom).offset(Spacing.normal)
            make.left.equalToSuperview().offset(Spacing.normal)
            make.right.equalToSuperview().offset(-Spacing.normal)
            make.bottom.equalToSuperview().offset(-Spacing.normal)
        })
    }
    
    fileprivate func initializeRepositoryStarsLabel() {
        self.repositoryStarsLabel = UILabel()
        self.repositoryStarsLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.repositoryStarsLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.addSubview(self.repositoryStarsLabel!)
        
        self.repositoryStarsLabel?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(Spacing.normal)
            make.left.equalTo(self.repositoryNameLabel!.snp.right).offset(Spacing.normal)
            make.right.equalToSuperview().offset(-Spacing.normal)
            make.bottom.equalTo(self.repositoryUserNameLabel!.snp.top).offset(-Spacing.normal)
        })
    }
    
}
