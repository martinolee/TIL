//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit
import MobileCoreServices

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController.delegate = self
    }
    
    @IBAction private func pickImage(_ sender: Any) {
        print("\n---------- [ pickImage ] ----------\n")
        
        imagePickerController.sourceType = .savedPhotosAlbum
        
        present(imagePickerController, animated: true)
    }
    
    
    @IBAction private func takePicture(_ sender: Any) {
        print("\n---------- [ takePicture ] ----------\n")
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        
        imagePickerController.sourceType = .camera
        
        imagePickerController.mediaTypes = [kUTTypeImage as String]
        
        present(imagePickerController, animated: true)
    }
    
    @IBAction private func takePictureWithDelay(_ sender: Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n")
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        
        imagePickerController.sourceType = .camera
        
        imagePickerController.mediaTypes = [kUTTypeImage as String]
        
        present(imagePickerController, animated: true) {
            let delay: DispatchTime = .now() + 2
            DispatchQueue.main.asyncAfter(deadline: delay) {
                self.imagePickerController.takePicture()
            }
        }
    }
    
    
    @IBAction private func recordingVideo(_ sender: Any) {
        print("\n---------- [ recordingVideo ] ----------\n")
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        
        imagePickerController.sourceType = .camera
        
        imagePickerController.mediaTypes = [kUTTypeMovie as String]
        
        imagePickerController.cameraCaptureMode = .video
        
        imagePickerController.cameraDevice = .rear
        
        imagePickerController.videoQuality = .typeIFrame1280x720
        
        present(imagePickerController, animated: true)
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) {
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        
        imagePickerController.allowsEditing.toggle()
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[.mediaType] as! NSString
        
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            
            if picker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            }
            
            imageView.image = selectedImage
            
        } else if UTTypeEqual(mediaType, kUTTypeMovie) {
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path,
                UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
            }
        }
        
        picker.dismiss(animated: true) {
            print("dismiss")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            print("dismiss")
        }
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}
