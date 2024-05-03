//
//  FeedVC.swift
//  A3
//
//  Created by Vin Bui on 10/31/23.
//

import UIKit

class FeedVC: UIViewController{
 

    // MARK: - Properties (view)

    private var collectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    public let userButton = UIButton()
    public let addItemButton = UIButton()

    // MARK: - Properties (data)
    private var posts: [Post] = [
        
        Post(id: 1,
             time: Date(),
            title: "Found these AirPods",
            item: "AirPods",
            status: "Lost",
            text: "I found these yesterday - message me if they are yours!",
            location: "Morrison Dining Hall",
             user_id: 1),
        Post(id: 2,
             time: Date(),
            title: "Found these AirPods",
            item: "AirPods",
            status: "Lost",
            text: "I found these yesterday - message me if they are you want them back",
            location: "Morrison Dining Hall",
            user_id: 1)
    ]
    private let buttonsize = CGFloat(20)
    

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ChatDev"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.a3.offWhite
        getPost()
        setupCollectionView()
//        setupHomeButton()
        setUpUserButton()
        
       
    }

    // MARK: - Set Up Views
    @objc private func getPost() {
        NetworkManager.shared.getPost{ [weak self] posts in
            guard let self = self else { return }
            self.posts = posts
            print(self.posts)

            // Perform UI update on main queue
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing() // End refresh control
            }
        }
    }
    

    private func setupCollectionView() {
//        collectionView.backgroundColor = UIColor.a3.offWhite

        // TODO: Set Up CollectionView
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuse)
        
        refreshControl.addTarget(self, action: #selector(getPost), for: .valueChanged)
        collectionView.refreshControl = refreshControl

        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setUpHomeButton(){
//        HomePageButton.setImage(UIImage(named:"home"), for: .normal)
//        HomePageButton.backgroundColor = UIColor.a3.white
//        HomePageButton.layer.cornerRadius = 4
//        HomePageButton.setTitleColor(UIColor.a3.white, for: .normal)
//        HomePageButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
//       
//               contentView.addSubview(HomePageButton)
//        HomePageButton.translatesAutoresizingMaskIntoConstraints = false
//       
//               NSLayoutConstraint.activate([
//                HomePageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: gap),
//                HomePageButton.leadingAnchor.constraint(equalTo: postImage.leadingAnchor),
//                HomePageButton.heightAnchor.constraint(equalToConstant: 24),
//                HomePageButton.widthAnchor.constraint(equalToConstant: 24)
//              ])
    }
    func setUpUserButton(){
        
        userButton.setImage(UIImage(named: "User"), for: .normal)
        userButton.backgroundColor = UIColor.a3.white
        userButton.layer.cornerRadius = 4
        userButton.setTitleColor(UIColor.a3.white, for: .normal)
        view.addSubview(userButton)
        userButton.translatesAutoresizingMaskIntoConstraints = false
        userButton.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
        
       NSLayoutConstraint.activate([
        userButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        userButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
//        userButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        userButton.heightAnchor.constraint(equalToConstant: 50),
        userButton.widthAnchor.constraint(equalToConstant: 50)
      ])
    }
    
    @objc private func userButtonTapped() {
           // Implement your functionality when the "Edit Profile" button is tapped
           // For example, you can navigate to the edit profile screen
        let editProfileVC = UserProfileViewController(delegate: self)
         navigationController?.pushViewController(editProfileVC, animated: true)
       }
    




func setUpAddItemButton(){
    
    addItemButton.setImage(UIImage(named: "User"), for: .normal)
    addItemButton.backgroundColor = UIColor.a3.white
    addItemButton.layer.cornerRadius = 4
    addItemButton.setTitleColor(UIColor.a3.white, for: .normal)
    view.addSubview(addItemButton)
    addItemButton.translatesAutoresizingMaskIntoConstraints = false
    addItemButton.addTarget(self, action: #selector(addItemButtonTapped), for: .touchUpInside)
    
   NSLayoutConstraint.activate([
    addItemButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    addItemButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
//        userButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    addItemButton.heightAnchor.constraint(equalToConstant: 50),
    addItemButton.widthAnchor.constraint(equalToConstant: 50)
  ])
}

@objc private func addItemButtonTapped() {
       // Implement your functionality when the "Edit Profile" button is tapped
       // For example, you can navigate to the edit profile screen
    let editItemVC = EditItemViewController(delegate: self)
     navigationController?.pushViewController(editItemVC, animated: true)
   }


}

// MARK: - UICollectionViewDelegate

extension FeedVC: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension FeedVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // TODO: Return the cells for each section
        // HINT: Use `indexPath.section` with an if statement
      
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuse, for: indexPath) as? PostCollectionViewCell{
                cell.configure(post: posts[indexPath.row])
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        

      
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Return the number of rows for each section
        // HINT: Use `section` with an if statement
        
        
        return posts.count // Replace this line
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // TODO: Return the number of sections in this table view
        
        return 1  // Replace this line
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Return the inset for the spacing between the two sections
        
        
        return UIEdgeInsets(top: 16, left: 24, bottom: 0, right: 24) // Replace this line
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.width, height: 184)
        
        // TODO: Return the size for each cell per section
        // HINT: Use `indexPath.section` with an if statement
    
        
//        return CGSize() // Replace this line
    }
    
//    func didLikePostUpdate() {
//            // Refresh your data or collection view
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//            self.refreshControl.endRefreshing() // End refresh control
//        }
//        }

}
extension FeedVC: updateTextDelegate {
    func updateText(newName: String, newEmail: String){
    
    }
}
