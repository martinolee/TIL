//
//  ViewController.swift
//  UIPageControlTask
//
//  Created by Soohan Lee on 2020/01/10.
//  Copyright © 2020 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var sixthView: UIView!
    @IBOutlet weak var seventhView: UIView!
    @IBOutlet weak var eighthView: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var viewList = [UIView]()
    
    private var isUsingPageControl = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configScrollView()
        setupPageControl()
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        
        let newX = scrollView.frame.width * CGFloat(currentPage)
        
        let newOffset = CGPoint(x: newX,
                                y: scrollView.contentOffset.y)
        
        scrollView.setContentOffset(newOffset, animated: true)
    }
    
    private func setupViews() {
        viewList.append(firstView)
        viewList.append(secondView)
        viewList.append(thirdView)
        viewList.append(fourthView)
        viewList.append(fifthView)
        viewList.append(sixthView)
        viewList.append(seventhView)
        viewList.append(eighthView)
    }

    private func setupPageControl() {
        pageControl.numberOfPages = viewList.count
    }
    
    private func configScrollView() {
        scrollView.delegate = self
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let fractionalPage = self.scrollView.contentOffset.x / pageWidth
        
        let page = lround(Double(fractionalPage))
        
        pageControl.currentPage = page
    }
}
