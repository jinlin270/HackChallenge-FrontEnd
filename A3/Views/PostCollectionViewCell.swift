//
//  PostCollectionViewCell.swift
//  A3
//
//  Created by Lin Jin on 4/9/24.
//

import UIKit

protocol PostCollectionViewCellDelegate: AnyObject {
    func didLikePostUpdate()
}

class PostCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    weak var delegate: PostCollectionViewCellDelegate?

   
    private let postTitle = UILabel()
    private let postTime = UILabel()
    private let postStatus = UILabel()
    private let postImage = UIImageView()
  
//    private let likeButton = UIButton()
//    private let postNumLikes = UILabel()
    private let postText = UILabel()
    private let postLocation = UILabel()
    private let postItem = UILabel()
//    private let postOwner = UILabel()
    

    private let padding = CGFloat(24)
    private let gap = CGFloat(8)
    private var post : Post?
    
    
    static let reuse = "TextCollectionViewCellReuse"
    
    // MARK: - init
    
    // NOTE: Compare init with a `UITableViewCell`
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNameLabel()
        setupPostImage()
        setupItemLabel()
        setupTimeLabel()
        setupLocationLabel()
        setupTextLabel()
        
//        setupLikeButton()
//        setupNumLikesLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    
    func configure(post: Post) {

        postTitle.text = post.title
        postTime.text = post.time.convertToAgo()
        postStatus.text = post.status
        postText.text = post.text
        postLocation.text = post.location
        postItem.text = post.item
        postImage.image = UIImage(named: "appdev")

        
    
        self.post = post
        
        
    }
    
    // MARK: - Set Up Views
    

    private func setupNameLabel() {
        postTitle.textColor = .label
        
        postTitle.font = .systemFont(ofSize: 14, weight: .medium)
        
        contentView.addSubview(postTitle)
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            postTitle.heightAnchor.constraint(equalToConstant: 17),

        ])
 }
    
    private func setupPostImage() {
        postImage.contentMode = .scaleAspectFit
        
        // NOTE: we are using `contentView` here
        contentView.addSubview(postImage)
        postImage.translatesAutoresizingMaskIntoConstraints = false
                        
        // NOTE: we do not need to use `safeAreaLayoutGuide`
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            postImage.heightAnchor.constraint(equalToConstant: 32),
            postImage.widthAnchor.constraint(equalToConstant: 32)
        ])
    }


    private func setupItemLabel() {
        postItem.textColor = UIColor.lightGray
        postItem.font = .systemFont(ofSize: 12, weight: .medium)
        
        contentView.addSubview(postItem)
        postItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postItem.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            postItem.leadingAnchor.constraint(equalTo: postTitle.leadingAnchor),
            postItem.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    
    private func setupTimeLabel() {
        postTime.textColor = UIColor.lightGray
        postTime.font = .systemFont(ofSize: 12, weight: .medium)
        
        contentView.addSubview(postTime)
        postTime.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postTime.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            postTime.leadingAnchor.constraint(equalTo: postItem.trailingAnchor, constant: gap),
            postTime.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    private func setupLocationLabel() {
        postLocation.textColor = UIColor.lightGray
        postLocation.font = .systemFont(ofSize: 12, weight: .medium)
        
        contentView.addSubview(postLocation)
        postLocation.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postLocation.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            postLocation.leadingAnchor.constraint(equalTo: postTime.trailingAnchor, constant: gap),
            postLocation.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    
    
    
        private func setupTextLabel(){
            postText.textColor = .label
            postText.font = .systemFont(ofSize: 14, weight: .medium)
    
            contentView.addSubview(postText)
            postText.translatesAutoresizingMaskIntoConstraints = false
    
            NSLayoutConstraint.activate([
                postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),

                postText.topAnchor.constraint(equalTo: postItem.bottomAnchor, constant: gap),
                postText.heightAnchor.constraint(equalToConstant: 50)
            ])
    
        }


//    
//    private func setupLikeButton() {
//        likeButton.backgroundColor = UIColor.a3.white
//        likeButton.layer.cornerRadius = 4
//        likeButton.setTitleColor(UIColor.a3.white, for: .normal)
//        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
//
//        contentView.addSubview(likeButton)
//        likeButton.translatesAutoresizingMaskIntoConstraints = false
//
//        let sidePadding: CGFloat = 24
//        NSLayoutConstraint.activate([
//           likeButton.topAnchor.constraint(equalTo: postMessage.bottomAnchor, constant: gap),
//           likeButton.leadingAnchor.constraint(equalTo: postImage.leadingAnchor),
//           likeButton.heightAnchor.constraint(equalToConstant: sidePadding),
//           likeButton.widthAnchor.constraint(equalToConstant: sidePadding)
//       ])
//    }
//    
//    private func setupNumLikesLabel(){
//        postNumLikes.textColor = .label
//        postNumLikes.font = .systemFont(ofSize: 12, weight: .medium)
//        
//        contentView.addSubview(postNumLikes)
//        postNumLikes.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            postNumLikes.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: gap),
//            postNumLikes.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
//            postNumLikes.heightAnchor.constraint(equalToConstant: 14)
//        ])
//        
//    }
//    
//    @objc func likeButtonTapped() {
//        if let p = self.post{
//            if p.likes.contains("lj233") {
//                unlikePost()
//            }else {
//                likePost()
//            }
//        }else{
//            print("error")
//        }
//        delegate?.didLikePostUpdate()
//    }
//
//    
//    @objc func likePost(){
//        
//        if let p = self.post{
//            NetworkManager.shared.likePost(post_id: p.id){ liked in
//                if liked {
//                    UIView.animate(withDuration: 0.3, animations: {
//                        // Scale the button up
//                        self.likeButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                    }) { (_) in
//                        // Completion block
//                        UIView.animate(withDuration: 0.3) {
//                            // Scale the button back to its original size
//                            self.likeButton.transform = CGAffineTransform.identity
//                        }
//                    }
//
//                    
//                    print("liked post")
//                    self.likeButton.setImage(UIImage(named: "filled_<3"), for: .normal)
//                    self.postNumLikes.text = String(p.likes.count + 1) + " likes"
//                
//                    var newLikes = p.likes
//                    newLikes.append("lj233")
//                    self.post = Post(id: p.id, time: p.time, message: p.message, likes: newLikes)
//                
//                }
//                else{
//                    print("unknown error, try again")
//                }
//            }
//        } else{return}
//            
//    }
//    
//    @objc func unlikePost(){
//        
//        if let p = self.post{
//            NetworkManager.shared.unlikePost(post_id: p.id){ unliked in
//                if unliked {
//                    print("unliked post")
//                    self.likeButton.setImage(UIImage(named: "<3"), for: .normal)
//                    self.postNumLikes.text = String(p.likes.count - 1) + " likes"
//                    if let index = p.likes.firstIndex(of: "lj233") {
//                        var newLikes = p.likes
//                        newLikes.remove(at: index)
//                        self.post = Post(id: p.id, time: p.time, message: p.message, likes: newLikes)
//                    }
//                }
//                else{
//                    print("unknown error, try again")
//                }
//            }
//        } else{return}
//            
//    }

}

