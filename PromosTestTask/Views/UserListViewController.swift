//
//  ViewController.swift
//  PromosTestTask
//
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    
    lazy var viewModel : UserListViewModelProtocol = UserListViewModel()
    
    private var dataSource : UserTableViewDataSource<UserTableViewCell,User>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
        initTableViewDataSource()
    }
    
    func initViewModel() {
        
        self.viewModel.bindViewModelToController = {
            self.updateDataSource()
        }
        viewModel.fetchUsers()
    }
    
    func initTableViewDataSource() {
        self.dataSource = UserTableViewDataSource(cellIdentifier: "UserTableViewCell",
                                                  configureCell: { (cell, user) in
                                                    cell.nameLabel.text = user.name
                                                    cell.userNameLabel.text = user.username
                                                  })
        
        userTableView.dataSource = self.dataSource
        userTableView.delegate = self
        
    }
    
    
    func updateDataSource() {
        DispatchQueue.main.async {
            self.dataSource.items = self.viewModel.users
            self.userTableView.reloadData()
        }
    }
    
    @IBAction func sortChanged(_ sender: UISegmentedControl) {
        viewModel.sortUser(sort: sender.selectedSegmentIndex == 0 ? .userName : .id );
    }
}

extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let userDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController {
            userDetailsVC.viewModel = UserDetailsViewModel(user: viewModel.users[indexPath.row])
            self.navigationController?.pushViewController(userDetailsVC, animated: true)
        }
    }
}

