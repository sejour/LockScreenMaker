//
//  ViewController.swift
//  LockScreenMaker
//
//  Created by Shuka Takakuma on 2016/09/08.
//  Copyright © 2016年 Shuka Takakuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var foregroudImageView: UIImageView!
    @IBOutlet weak var backgroundImageVIew: UIImageView!
    weak var pickingImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickImageViewFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = .PhotoLibrary
            presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            pickingImageView?.image = image
        }
        pickingImageView = nil
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapForegroundImageView(sender: AnyObject) {
        pickingImageView = foregroudImageView
        pickImageViewFromLibrary()
    }
    
    @IBAction func didTapBackgroundImageView(sender: AnyObject) {
        pickingImageView = backgroundImageVIew
        pickImageViewFromLibrary()
    }
    
}

