//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by Ignacio Arias on 2021-02-27.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    //With MVVM, the viewController will need the listViewModel to operate, that's why we forceUnwrap
    private var viewModel: RestaurantsListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel // When the view loads we can subscribe to our fetchRestaurant viewModel
        return viewController 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() // Will create an empty space at the bottom
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        // MARK: - While MVVM
        //But before subscribing we need to finish on ListViewModel fetchRestaurantViewModels() then we can subscribe here for an array of restaurantViewModels
        // BUT, we actually want to bind to our tableView, after having the tableView on the storyBoard, come here create the outlet and import RxCocoa, which is going to help us to BIND our observable to the tableView. Make sure to put it on the mainThread by observe on the MainScheduler
        //RxCocoa
        viewModel.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
        
  
        // MARK: - While no MVVM
        
        // MARK: - Option 1 - Preferred
//        let service = RestaurantService()
//        service.fetchRestaurantsFromLocalFile().subscribe(onNext: { (restaurants) in
//            print(restaurants)
//        }).disposed(by: disposeBag)

        // MARK: - Option 2 - test - done
//        let service = RestaurantService()
//        service.fetchRestaurantsFromLocalFile().subscribe { (restaurants) in
//            print(restaurants)
//        } onError: { (error) in
//            print(error)
//        } onCompleted: { 
//            print("Completed")
//        } onDisposed: {
//            print("DeInited")
//        }.disposed(by: disposeBag)
    }


}

