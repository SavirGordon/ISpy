//
//  ViewController.swift
//  ISpy
//
//  Created by 4d on 12/15/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale

    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var imageView: UIImageView!
}

