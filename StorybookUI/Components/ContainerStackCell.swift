//
//  ContainerStackCell.swift
//  Storybook
//
//  Created by muukii on 2019/01/26.
//  Copyright © 2019 eure. All rights reserved.
//

import Foundation

class ContainerStackCell : CodeBasedView, StackCellType {
  
  private let titleContainerView = UIView()
  let contentView = UIView()
  
  private let titleLabel = UILabel()
  private let classNameLabel = UILabel()
  private let titleContainerViewViewShapeLayer = CAShapeLayer()
  private let contentViewShapeLayer = CAShapeLayer()
  
  init() {
    super.init(frame: .zero)
    
    layer.addSublayer(titleContainerViewViewShapeLayer)
    layer.addSublayer(contentViewShapeLayer)
    
    titleContainerViewViewShapeLayer.fillColor = UIColor(white: 0, alpha: 0.03).cgColor
    contentViewShapeLayer.fillColor = UIColor(white: 0, alpha: 0.02).cgColor
    
    addSubview(titleContainerView)
    addSubview(contentView)
    
    titleLabel.numberOfLines = 0
    titleLabel.textColor = UIColor(white: 0, alpha: 0.6)
    titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    
    classNameLabel.numberOfLines = 0
    classNameLabel.textColor = UIColor(white: 0, alpha: 0.4)
    classNameLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
    
    do {
      titleContainerView.addSubview(titleLabel)
      titleContainerView.addSubview(classNameLabel)
      
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16.0)
            ])


      classNameLabel.easy.layout([
        Top(.appSpace(1)).to(titleLabel, .bottom),
        Leading(16),
        Trailing(16),
        Bottom(.appSpace(2))
        ])
    }
    
    titleContainerView.easy.layout([
      Top(.appSpace(3)),
      Right(16),
      Left(16),
      ])
    
    contentView.easy.layout([
      Top().to(titleContainerView),
      Right(16),
      Left(16),
      Bottom(.appSpace(3)),
      ])
  }
  
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    
    do {
      contentViewShapeLayer.frame = self.layer.bounds
      
      let path = UIBezierPath(
        roundedRect: self.contentView.layer.frame,
        byRoundingCorners: [.bottomLeft, .bottomRight],
        cornerRadii: CGSize(width: 8, height: 8)
      )
      
      contentViewShapeLayer.path = path.cgPath
    }
    
    do {
      titleContainerViewViewShapeLayer.frame = self.layer.bounds
      
      let path = UIBezierPath(
        roundedRect: self.titleContainerView.layer.frame,
        byRoundingCorners: [.topLeft, .topRight],
        cornerRadii: CGSize(width: 8, height: 8)
      )
      
      titleContainerViewViewShapeLayer.path = path.cgPath
    }
    
  }
  
  func set(title: String) {
    titleLabel.text = title
  }
  
  func set(className: String) {
    classNameLabel.text = className
  }
}

extension ContainerStackCell {
  
  convenience init(bodyView: UIView, title: String, className: String) {
    self.init()
    
    set(title: title)
    set(className: className)
    
    contentView.addSubview(bodyView)

    NSLayoutConstraint.activate([
        bodyView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
        bodyView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8.0),
        bodyView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.0),
        bodyView.rightAnchor.constraint(equalTo: rightAnchor, constant: 8.0)
        ])
    }

}
