//
//  ViewController.swift
//  SephoraDemo
//
//  Created by Aladdin HOUAS on 04/01/2024.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private let bag = DisposeBag()
    private let viewModel = ItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: bag)
        
        bindTableView()
        viewModel.fetchProductList()
    }
    
    private func bindTableView() {
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ItemTableViewCell")
        
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "ItemTableViewCell", cellType: ItemTableViewCell.self)) { (row,item,cell) in
            cell.item = item
        }.disposed(by: bag)
        
        tableView.delegate = self
    }
    
    
}

extension ViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

