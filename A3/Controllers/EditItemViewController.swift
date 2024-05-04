//
//  EditItemViewController.swift
//  A3
//
//  Created by Lin Jin on 5/2/24.
//

import UIKit


protocol UpdateItemDelegate: AnyObject {
    func UpdateItem(newTitle:String, newItem:String)
}

class EditItemViewController: UIViewController {
//    Post(id: 1,
//         time: Date(),
//        title: "Found these AirPods",
//        item: "AirPods",
//        status: "Lost",
//        text: "I found these yesterday - message me if they are yours!",
//        location: "Morrison Dining Hall",
//         user_id: 1),
    
    // MARK: - Properties (view)
    public let addItemButton = UIButton()
    public let saveItemButton = UIButton()
    private let PagetitleLabel = UILabel()
    
    private let ItemImageView = UIImageView()
    private let titleLabel = UILabel()
    private let titleLabelField = UITextField()
//    private let bioLabel = UILabel()
    private let itemLabel = UILabel()
  
//    private let majorLabel = UILabel()
    private let itemTextField = UITextField()
    private weak var delegate: UpdateItemDelegate?
   

    // MARK: - Properties (data)

    private var titleText: String
    private var itemText: String

    init(titleText: String = "title", itemText: String = "itemText", delegate: UpdateItemDelegate) {
        self.titleText = titleText
        self.itemText = itemText
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    // MARK: - viewDidLoad and init
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupAddItemButton()
            setupSaveItemButton()
            setupPageTitleLabel()
            setupItemImageView()
            setuptitleLabel()
            setuptitleTextField()
            setupitemLabel()
            setupitemTextField()
          
        }
 

    
    public func setupAddItemButton() {
            // Set button title, color, background color, and corner radius
            addItemButton.setTitle("Add Item", for: .normal)
            addItemButton.setImage(UIImage(named:"<3"), for: .normal)
            addItemButton.setTitleColor(.white, for: .normal)
            addItemButton.backgroundColor = UIColor(red: 0xCA/255.0, green: 0x42/255.0, blue: 0x38/255.0, alpha: 1.0)
            addItemButton.layer.cornerRadius = 16
            
            // Add target for button tap
            addItemButton.addTarget(self, action: #selector(addItemButtonTapped), for: .touchUpInside)
            
            // Add button to the view
            view.addSubview(addItemButton)
            addItemButton.translatesAutoresizingMaskIntoConstraints = false
            
            // Set up constraints
            NSLayoutConstraint.activate([
                addItemButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                addItemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                addItemButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49),
                addItemButton.heightAnchor.constraint(equalToConstant: 49)
            ])
        }
        
    @objc private func addItemButtonTapped() {
           // Implement your functionality when the "Edit Item" button is tapped
           // For example, you can navigate to the edit Item screen
        
        
        NetworkManager.shared.addPost(title: self.titleText, item: self.itemText) { (post: Post) in
            print("Post added successfully with title: \(post.title)")
          
        }

        
         navigationController?.popViewController(animated: true)
       }
    
    public func setupSaveItemButton() {
            // Set button title, color, background color, and corner radius
            saveItemButton.setTitle("Save", for: .normal)
            saveItemButton.setTitleColor(.white, for: .normal)
            saveItemButton.backgroundColor = UIColor(red: 0xCA/255.0, green: 0x42/255.0, blue: 0x38/255.0, alpha: 1.0)
            saveItemButton.layer.cornerRadius = 16
                
                // Add target for button tap
            saveItemButton.addTarget(self, action: #selector(saveItemButtonTapped), for: .touchUpInside)
                
                // Add button to the view
                view.addSubview(saveItemButton)
            saveItemButton.translatesAutoresizingMaskIntoConstraints = false
            
            // Set up constraints
            NSLayoutConstraint.activate([
                saveItemButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                saveItemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                saveItemButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49),
                saveItemButton.heightAnchor.constraint(equalToConstant: 49)
            ])
        }
    
    
    @objc private func saveItemButtonTapped() {
        delegate?.UpdateItem(newTitle: titleLabelField.text ?? "", newItem: itemTextField.text ?? "")
        navigationController?.popViewController(animated: true)
       }
    
    
    
    
    func getaddItemButton() -> UIButton {
           return addItemButton
       }
    
    private func setupPageTitleLabel() {
        // 3. Configure the view's properties
        titleLabel.text = "Add Item"
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textColor = UIColor.black
        
        // 4. Add view as a subview and enable auto-layout
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set Up Constraints
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 19),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
        ])
    }
    
    private func setupItemImageView() {
        ItemImageView.image = UIImage(named: "+")
        
        view.addSubview(ItemImageView)
        ItemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ItemImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            ItemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Add width and height constraints to ensure the image view remains square
            ItemImageView.widthAnchor.constraint(equalToConstant: 96),
            ItemImageView.heightAnchor.constraint(equalToConstant: 96)
        ])
        
        view.layoutIfNeeded()
        ItemImageView.layer.cornerRadius = ItemImageView.bounds.width / 2
        ItemImageView.layer.masksToBounds = true
        
    }

    private func setuptitleLabel() {
        // 3. Configure the view's properties
        titleLabel.text = "title"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = UIColor.black
        
        // 4. Add view as a subview and enable auto-layout
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set Up Constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.heightAnchor.constraint(equalToConstant: 29),
            titleLabel.topAnchor.constraint(equalTo: ItemImageView.bottomAnchor, constant: 15),
        ])
    }
    

    
    
    
    
    
    private func setuptitleTextField() {
            // Configure the text field properties
        titleLabelField.translatesAutoresizingMaskIntoConstraints = false
        titleLabelField.placeholder = titleLabel.text
        titleLabelField.textAlignment = .left
        titleLabelField.font = UIFont.systemFont(ofSize: 16.0)
        titleLabelField.textColor = .black
            
        titleLabelField.layer.borderWidth = 1.0
        titleLabelField.layer.borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0).cgColor
        titleLabelField.layer.cornerRadius = 8.0
            
            // Add the text field to the view
            view.addSubview(titleLabelField)
            
            // Set up constraints for the text field
            NSLayoutConstraint.activate([
                titleLabelField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                titleLabelField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                titleLabelField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                titleLabelField.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    
    
    private func setupitemLabel() {
        // 3. Configure the view's properties
        itemLabel.text = "item name"
        itemLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        itemLabel.textColor = UIColor.black
        itemLabel.numberOfLines = 0
        
        // 4. Add view as a subview and enable auto-layout
        view.addSubview(itemLabel)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set Up Constraints
        NSLayoutConstraint.activate([
            itemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            itemLabel.heightAnchor.constraint(equalToConstant: 17),
            itemLabel.topAnchor.constraint(equalTo: titleLabelField.bottomAnchor, constant: 32),
        ])
    }
    
    private func setupitemTextField() {
            // Configure the text field properties
        itemTextField.translatesAutoresizingMaskIntoConstraints = false
        itemTextField.placeholder = itemText
        itemTextField.textAlignment = .left
        itemTextField.font = UIFont.systemFont(ofSize: 16.0)
        itemTextField.textColor = .black
            
        itemTextField.layer.borderWidth = 1.0
        itemTextField.layer.borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0).cgColor
        itemTextField.layer.cornerRadius = 8.0
            
            // Add the text field to the view
            view.addSubview(itemTextField)
            
            // Set up constraints for the text field
            NSLayoutConstraint.activate([
                itemTextField.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 10),
                itemTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                itemTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                itemTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
        }

    
}

