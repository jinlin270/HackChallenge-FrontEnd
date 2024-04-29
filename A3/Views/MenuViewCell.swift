//
//  MenuViewCell.swift
//  A3
//
//  Created by Lin Jin on 4/28/24.
//

import UIKit
import Foundation

class MenuViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
//    weak var delegate: MenuViewCellDelegate?
    
    
    private let UserProfileButton = UIButton()
    private let HomePageButton = UIButton()
    
    
   
    
    static let reuse = "MenuViewCellReuse"
    
    // MARK: - init
    
    // NOTE: Compare init with a `UITableViewCell`
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUserProfileButton()
        setupHomePageButton()
        
        
        //        setupLikeButton()
        //        setupNumLikesLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    
    func configure(post: Post) {
        
        UserProfileButton.setImage(UIImage(named:"user"), for: .normal)
        HomePageButton.setImage(UIImage(named:"home"), for: .normal)
        
    }
    
    func setupUserProfileButton(){
        
    }
    func setupHomePageButton(){
        
    }
    
    // MARK: - Set Up Views
    
    


}
