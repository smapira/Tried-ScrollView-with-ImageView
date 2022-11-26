//
//  ViewController.swift
//  Tried-ScrollView-with-ImageView
//
//  Created by bookair18 on 2022/11/26.
//

import UIKit

class ViewController: UIViewController {

  private let customImageView1: CustomImageView = {
    let iv = CustomImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.image = UIImage(named: "onepiece01_luffy")!
    return iv
  }()

  private let customImageView2: CustomImageView = {
    let iv = CustomImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.image = UIImage(named: "onepiece02_zoro_bandana")!
    return iv
  }()

  private var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.isPagingEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.backgroundColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 0.3)
    return scrollView
  }()

  private var pageControl: UIPageControl = {
    let pageControl = UIPageControl()
    pageControl.numberOfPages = 2
    pageControl.pageIndicatorTintColor = UIColor.lightGray
    pageControl.currentPageIndicatorTintColor = UIColor.black
    pageControl.currentPage = 0

    return pageControl
  }()

  let padding: CGFloat = 8
  let contentHeight: CGFloat = 300

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    displayScrollview()
    displayPageControl()

  }

  private func displayPageControl() {
    self.view.addSubview(pageControl)
    pageControl.anchor(
      top: scrollView.bottomAnchor,
      left: self.view.leftAnchor,
      right: self.view.rightAnchor,
      width: 80,
      height: 40)

    pageControl.addTarget(
      self, action: #selector(self.swichPage),
      for: .valueChanged)
    view.bringSubviewToFront(pageControl)

  }

  private func displayScrollview() {
    self.view.addSubview(scrollView)

    scrollView.anchor(
      top: self.view.topAnchor,
      left: self.view.leftAnchor,
      right: self.view.rightAnchor,
      width: self.view.frame.size.width,
      height: contentHeight)

    scrollView.delegate = self
    scrollView.contentSize = CGSize(
      width: self.view.frame.size.width * 2,
      height: contentHeight)

    scrollView.addSubview(customImageView1)
    scrollView.addSubview(customImageView2)

    displayContentsView()

  }

  private func displayContentsView() {
    customImageView1.frame = CGRect(
      x: 0,
      y: 0,
      width: self.view.frame.size.width,
      height: contentHeight)

    customImageView2.frame = CGRect(
      x: self.view.frame.size.width,
      y: 0,
      width: self.view.frame.size.width,
      height: contentHeight)
  }

  @objc func swichPage() {
    let xPosition = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
    let newScrollViewPosition = CGPoint(x: xPosition, y: 0)
    scrollView.setContentOffset(newScrollViewPosition, animated: true)
  }
}

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
  }
}
