//
//  CustomizedTabBar.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import UIKit

@IBDesignable
class CustomizedTabBar: UITabBar, UITabBarDelegate {
    @IBInspectable var fontSize: CGFloat = 11
    @IBInspectable var fontName: String = "Arial"
    @IBInspectable var minTabbarHeight = CGFloat(59)
    @IBInspectable var defaultItemTintColor: UIColor = .black {
        didSet { self.unselectedItemTintColor = defaultItemTintColor }
    }

    private var tabbarItemWidth: CGFloat = 0
    private var tabbarActionButtonWidth: CGFloat = 0
    private var tabbarActionSubButtonWidth: CGFloat = 0
    private var shapeLayer: CALayer?
    private var didDraw = false

    override func layerWillDraw(_ layer: CALayer) {
        super.layerWillDraw(layer)
        guard !didDraw else { return }
        didDraw = true
        self.tabbarItemWidth = self.frame.width / 4
        self.tabbarActionButtonWidth = tabbarItemWidth * 0.43
        self.tabbarActionSubButtonWidth = tabbarActionButtonWidth * 1.23
        self.updateFont()
        self.setTabBarShadow()
        self.setTabBarImageInsets()
        self.tintColor = .gray
        self.selectionIndicatorImage = self.createSelectionIndicator(
            color: self.tintColor,
            size: CGSize(
                width: self.frame.width / CGFloat(self.items!.count),
                height: self.frame.height),
            lineWidth: 3.0)
    }

    private func updateFont() {
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [
                    NSAttributedString.Key.font: UIFont(
                        name: fontName,
                        size: fontSize)!
                ],
                for: .normal)
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [
                    NSAttributedString.Key.font: UIFont(
                        name: fontName,
                        size: fontSize)!
                ],
                for: .selected)
    }

    private func setTabBarShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 8.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.6
        self.clipsToBounds = false
    }

    private func setTabBarImageInsets() {
        for item in self.items ?? [] {
            if self.bounds.height == 59 {
                let offset: CGFloat = 2
                item.imageInsets = UIEdgeInsets(top: -offset, left: 0, bottom: offset, right: 0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
            } else {
                let offset: CGFloat = 8
                item.imageInsets = UIEdgeInsets(top: offset, left: 0, bottom: -offset, right: 0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)
            }
        }
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = createCurvePath()
        shapeLayer.fillColor = UIColor.white.cgColor

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    override func draw(_ rect: CGRect) {
        self.addShape()
    }

    private func createCurvePath() -> CGPath {
        let radius: CGFloat = tabbarItemWidth / 2
        let height: CGFloat = radius * 0.76
        let path = UIBezierPath()
        let centerWidth = self.frame.width - radius

        //Down Curve Points
        let startFirstDownPoint = CGPoint(x: (centerWidth - radius), y: 0)
        let endFirstDownPoint = CGPoint(x: startFirstDownPoint.x + (radius * 0.3257), y: height * 0.2142)
        let startSecondDownPoint = CGPoint(x: startFirstDownPoint.x + (radius * 0.6166), y: height * 0.7283)
        let endSecondDownPoint = CGPoint(x: startFirstDownPoint.x + (radius), y: height)

        //Up Curve Points
        let endSecondUpPoint = CGPoint(x: (centerWidth + radius), y: 0)
        let endFirstUpPoint = CGPoint(x: endSecondUpPoint.x - (radius * 0.6166), y: height * 0.7283)
        let startSecondUpPoint = CGPoint(x: endSecondUpPoint.x - (radius * 0.3257), y: height * 0.2142)

        //Down Curve Control Points
        let downFirstCurveControlPoint1 = CGPoint(x: startFirstDownPoint.x + (radius * 0.1295), y: height * 0.0035)
        let downFirstCurveControlPoint2 = CGPoint(x: startFirstDownPoint.x + (radius * 0.2477), y: height * 0.0824)
        let downSecondCurveControlPoint1 = CGPoint(x: startFirstDownPoint.x + (radius * 0.7133), y: height * 0.8938)
        let downSecondCurveControlPoint2 = CGPoint(x: startFirstDownPoint.x + (radius * 0.8077), y: height * 0.9975)

        //Up Curve Control Points
        let upFirstCurveControlPoint1 = CGPoint(x: endSecondUpPoint.x - (radius * 0.8077), y: height * 0.9975)
        let upFirstCurveControlPoint2 = CGPoint(x: endSecondUpPoint.x - (radius * 0.7133), y: height * 0.8938)
        let upSecondCurveControlPoint1 = CGPoint(x: endSecondUpPoint.x - (radius * 0.2477), y: height * 0.0824)
        let upSecondCurveControlPoint2 = CGPoint(x: endSecondUpPoint.x - (radius * 0.1295), y: height * 0.0035)

        path.move(to: CGPoint(x: 0, y: 0))  // start top left
        path.addLine(to: startFirstDownPoint)  // the beginning of the trough

        // first curve down
        path.addCurve(
            to: endFirstDownPoint,
            controlPoint1: downFirstCurveControlPoint1,
            controlPoint2: downFirstCurveControlPoint2)

        // line between first curve and second curve
        path.addLine(to: startSecondDownPoint)

        // second curve down
        path.addCurve(
            to: endSecondDownPoint,
            controlPoint1: downSecondCurveControlPoint1,
            controlPoint2: downSecondCurveControlPoint2)

        // first curve up
        path.addCurve(
            to: endFirstUpPoint,
            controlPoint1: upFirstCurveControlPoint1,
            controlPoint2: upFirstCurveControlPoint2)

        // line between first curve and second curve
        path.addLine(to: startSecondUpPoint)

        // second curve up
        path.addCurve(
            to: endSecondUpPoint,
            controlPoint1: upSecondCurveControlPoint1,
            controlPoint2: upSecondCurveControlPoint2)

        // complete the rect
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)

        if sizeThatFits.height < minTabbarHeight {
            sizeThatFits.height = minTabbarHeight
        }
        return sizeThatFits
    }

    private func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: lineWidth))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
