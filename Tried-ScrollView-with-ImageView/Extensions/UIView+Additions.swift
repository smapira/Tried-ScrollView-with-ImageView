import UIKit

extension UIView {
  func anchor(
    top: NSLayoutYAxisAnchor? = nil,
    left: NSLayoutXAxisAnchor? = nil,
    bottom: NSLayoutYAxisAnchor? = nil,
    right: NSLayoutXAxisAnchor? = nil,
    paddingTop: CGFloat = 0,
    paddingLeft: CGFloat = 0,
    paddingBottom: CGFloat = 0,
    paddingRight: CGFloat = 0,
    width: CGFloat = 0,
    height: CGFloat = 0,
    centerX: NSLayoutXAxisAnchor? = nil,
    centerY: NSLayoutYAxisAnchor? = nil
  ) {

    translatesAutoresizingMaskIntoConstraints = false

    if let top = top {
      topAnchor.constraint(
        equalTo: top,
        constant: paddingTop
      ).isActive = true
    }
    if let left = left {
      leftAnchor.constraint(
        equalTo: left,
        constant: paddingLeft
      ).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(
        equalTo: bottom,
        constant: -paddingBottom
      ).isActive = true
    }
    if let right = right {
      rightAnchor.constraint(
        equalTo: right,
        constant: -paddingRight
      ).isActive = true
    }
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    if let centerX = centerX {
      centerXAnchor.constraint(lessThanOrEqualTo: centerX).isActive = true
    }
    if let centerY = centerY {
      centerYAnchor.constraint(lessThanOrEqualTo: centerY).isActive = true
    }
  }
}
