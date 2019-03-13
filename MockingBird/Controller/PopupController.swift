//
//  PopupController.swift
//  MockingBird
//
//  Created by Kim Page on 3/6/19.
//  Copyright © 2019 Kim Page. All rights reserved.
//


import UIKit

class PopupController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var wordTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var pickImageView: UIImageView!
    
    
    @IBOutlet weak var popupImageView: UIView!
    
    
    
    
    
    
    var delegate: PopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        popupImageView.layer.cornerRadius = 3
        popupImageView.layer.masksToBounds = true
        
        
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor(red: 255/255, green: 116/255, blue: 140/255, alpha: 0.3).cgColor
        descriptionTextView.layer.cornerRadius = 5
        
        
        wordTextField.layer.borderWidth = 1
        wordTextField.layer.borderColor = UIColor(red: 255/255, green: 116/255, blue: 140/255, alpha: 0.3).cgColor
        wordTextField.layer.cornerRadius = 5
        
    }
    
    
    
    @IBAction func pickImageViewTapped(_ sender: UITapGestureRecognizer) {
        
        
        let picker = UIImagePickerController()
        present(picker, animated: true, completion: nil)
        
        picker.delegate = self
        picker.allowsEditing = true
        
        
    }
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
            
            
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            selectedImageFromPicker = originalImage
            
            
        }
        
        if let selectedImage = selectedImageFromPicker {
            
            pickImageView.image = selectedImage
    
            
            
        }
        
    
        
        dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel picker")
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        
        dismiss(animated: true)
        
        let data = NSData(data: pickImageView.image!.pngData()!)

        delegate?.popValueSelected(word: wordTextField.text!, image: data, description: descriptionTextView.text!)
        
    }
    
    
    @IBAction func popupClosed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    
    
    
}


