//
//  EditUserProfileViewController.swift
//  A3
//
//  Created by Lin Jin on 5/2/24.
//


import UIKit

protocol updateTextDelegate: AnyObject {
    func updateText(newName:String, newEmail:String)
}

class UserProfileViewController: UIViewController {
    
    // MARK: - Properties (view)
    public let editProfileButton = UIButton()
    public let saveProfileButton = UIButton()
    private let titleLabel = UILabel()
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let nameLabelField = UITextField()
//    private let bioLabel = UILabel()
    private let emailLabel = UILabel()
  
//    private let majorLabel = UILabel()
    private let emailTextField = UITextField()
    private weak var delegate: updateTextDelegate?

    // MARK: - Properties (data)

    private var nameText: String
    private var emailText: String

    init(nameText: String = "Name", emailText: String = "emailText", delegate: updateTextDelegate) {
        self.nameText = nameText
        self.emailText = emailText
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
            setupEditProfileButton()
            setupSaveProfileButton()
            setupTitleLabel()
            setupProfileImageView()
            setupNameLabel()
            setupNameTextField()
            setupEmailLabel()
            setupEmailTextField()
          
        }
 

    
    public func setupEditProfileButton() {
            // Set button title, color, background color, and corner radius
            editProfileButton.setTitle("Edit Profile", for: .normal)
            editProfileButton.setImage(UIImage(named:"user"), for: .normal)
            editProfileButton.setTitleColor(.white, for: .normal)
            editProfileButton.backgroundColor = UIColor(red: 0xCA/255.0, green: 0x42/255.0, blue: 0x38/255.0, alpha: 1.0)
            editProfileButton.layer.cornerRadius = 16
            
            // Add target for button tap
            editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
            
            // Add button to the view
            view.addSubview(editProfileButton)
            editProfileButton.translatesAutoresizingMaskIntoConstraints = false
            
            // Set up constraints
            NSLayoutConstraint.activate([
                editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                editProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49),
                editProfileButton.heightAnchor.constraint(equalToConstant: 49)
            ])
        }
        
    @objc private func editProfileButtonTapped() {
           // Implement your functionality when the "Edit Profile" button is tapped
           // For example, you can navigate to the edit profile screen
         navigationController?.popViewController(animated: true)
        
       }
    
    public func setupSaveProfileButton() {
            // Set button title, color, background color, and corner radius
            saveProfileButton.setTitle("Save", for: .normal)
            saveProfileButton.setTitleColor(.white, for: .normal)
            saveProfileButton.backgroundColor = UIColor(red: 0xCA/255.0, green: 0x42/255.0, blue: 0x38/255.0, alpha: 1.0)
            saveProfileButton.layer.cornerRadius = 16
                
                // Add target for button tap
            saveProfileButton.addTarget(self, action: #selector(saveProfileButtonTapped), for: .touchUpInside)
                
                // Add button to the view
                view.addSubview(saveProfileButton)
            saveProfileButton.translatesAutoresizingMaskIntoConstraints = false
            
            // Set up constraints
            NSLayoutConstraint.activate([
                saveProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                saveProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
                saveProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49),
                saveProfileButton.heightAnchor.constraint(equalToConstant: 49)
            ])
        }
    
    
    @objc private func saveProfileButtonTapped() {
        delegate?.updateText(newName: nameLabelField.text ?? "", newEmail: emailTextField.text ?? "")
        navigationController?.popViewController(animated: true)
       }
    
    
    
    
    func getEditProfileButton() -> UIButton {
           return editProfileButton
       }
    
    private func setupTitleLabel() {
        // 3. Configure the view's properties
        titleLabel.text = "Edit Profile"
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textColor = UIColor.black
        
        // 4. Add view as a subview and enable auto-layout
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set Up Constraints
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 19),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -32),
        ])
    }
    
    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: "User")
        
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Add width and height constraints to ensure the image view remains square
            profileImageView.widthAnchor.constraint(equalToConstant: 96),
            profileImageView.heightAnchor.constraint(equalToConstant: 96)
        ])
        
        view.layoutIfNeeded()
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.layer.masksToBounds = true
        
    }

    private func setupNameLabel() {
        // 3. Configure the view's properties
        nameLabel.text = "Name"
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = UIColor.black
        
        // 4. Add view as a subview and enable auto-layout
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set Up Constraints
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameLabel.heightAnchor.constraint(equalToConstant: 29),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 15),
        ])
    }
    

    
    
    
    
    
    private func setupNameTextField() {
            // Configure the text field properties
        nameLabelField.translatesAutoresizingMaskIntoConstraints = false
        nameLabelField.placeholder = nameLabel.text
        nameLabelField.textAlignment = .left
        nameLabelField.font = UIFont.systemFont(ofSize: 16.0)
        nameLabelField.textColor = .black
            
        nameLabelField.layer.borderWidth = 1.0
        nameLabelField.layer.borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0).cgColor
        nameLabelField.layer.cornerRadius = 8.0
            
            // Add the text field to the view
            view.addSubview(nameLabelField)
            
            // Set up constraints for the text field
            NSLayoutConstraint.activate([
                nameLabelField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                nameLabelField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                nameLabelField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                nameLabelField.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    
    
    private func setupEmailLabel() {
        // 3. Configure the view's properties
        emailLabel.text = "Email"
        emailLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        emailLabel.textColor = UIColor.black
        emailLabel.numberOfLines = 0
        
        // 4. Add view as a subview and enable auto-layout
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set Up Constraints
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailLabel.heightAnchor.constraint(equalToConstant: 17),
            emailLabel.topAnchor.constraint(equalTo: nameLabelField.bottomAnchor, constant: 32),
        ])
    }
    
    private func setupEmailTextField() {
            // Configure the text field properties
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = emailText
        emailTextField.textAlignment = .left
        emailTextField.font = UIFont.systemFont(ofSize: 16.0)
        emailTextField.textColor = .black
            
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0).cgColor
        emailTextField.layer.cornerRadius = 8.0
            
            // Add the text field to the view
            view.addSubview(emailTextField)
            
            // Set up constraints for the text field
            NSLayoutConstraint.activate([
                emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
                emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                emailTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
        }

    
}
