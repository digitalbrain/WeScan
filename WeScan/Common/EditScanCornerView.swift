//
//  EditScanCornerView.swift
//  WeScan
//
//  Created by Boris Emorine on 3/5/18.
//  Copyright © 2018 WeTransfer. All rights reserved.
//

import UIKit

/// A UIView used by corners of a quadrilateral that is aware of its position.
open class EditScanCornerView: UIView {
    
    let position: CornerPosition
    
    /// The image to display when the corner view is highlighted.
    public var image: UIImage?
    public var isHighlighted = false
    
    lazy public var circleLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 1.0
        return layer
    }()
    
    init(frame: CGRect, position: CornerPosition) {
        self.position = position
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        clipsToBounds = true
        layer.addSublayer(circleLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2.0
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let bezierPath = UIBezierPath(ovalIn: rect.insetBy(dx: circleLayer.lineWidth, dy: circleLayer.lineWidth))
        circleLayer.frame = rect
        circleLayer.path = bezierPath.cgPath
        
        image?.draw(in: rect)
    }
    
    open func highlightWithImage(_ image: UIImage) {
        isHighlighted = true
        self.image = image
        self.setNeedsDisplay()
    }
    
    open func reset() {
        isHighlighted = false
        image = nil
        setNeedsDisplay()
    }
    
}
