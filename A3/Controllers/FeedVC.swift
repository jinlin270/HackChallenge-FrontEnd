//
//  FeedVC.swift
//  A3
//
//  Created by Vin Bui on 10/31/23.
//

import UIKit

class FeedVC: UIViewController {

    // MARK: - Properties (view)

    private var collectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()

    // MARK: - Properties (data)
    private var posts: [Post] = []

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ChatDev"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.a3.offWhite
        getPost()
        setupCollectionView()
       
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
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

// MARK: - UICollectionViewDelegate

extension FeedVC: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension FeedVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // TODO: Return the cells for each section
        // HINT: Use `indexPath.section` with an if statement
        if indexPath.section == 0{
            
           
                return UICollectionViewCell()
            
            
        }
        else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuse, for: indexPath) as? PostCollectionViewCell{
                cell.configure(post: posts[indexPath.row])
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }

      
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Return the number of rows for each section
        // HINT: Use `section` with an if statement
        if section == 0{
            return 1
        }
        
        return posts.count // Replace this line
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // TODO: Return the number of sections in this table view
        
        return 2  // Replace this line
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Return the inset for the spacing between the two sections
        
        if section == 0{
            return UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        }
        return UIEdgeInsets(top: 16, left: 24, bottom: 0, right: 24) // Replace this line
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 131)
        }
        else{
            return CGSize(width: collectionView.frame.width, height: 184)
        }
        // TODO: Return the size for each cell per section
        // HINT: Use `indexPath.section` with an if statement
    
        
//        return CGSize() // Replace this line
    }
    
    func didLikePostUpdate() {
            // Refresh your data or collection view
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing() // End refresh control
        }
        }

}
