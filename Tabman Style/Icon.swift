//
//  Icon.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2019-03-05.
//  Copyright © 2019 Dopeness Academy. All rights reserved.
//

import UIKit

public typealias Icon = UIImage

public class UIIcon {
    
    class func drawInvitationCardSmall(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 19, height: 14), resizing: ResizingBehavior = .aspectFit) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize to Target Frame
        context.saveGState()
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 19, height: 14), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 19, y: resizedFrame.height / 14)
        
        /// envelope
        do {
            context.saveGState()
            
            /// Shape
            let shape = UIBezierPath()
            shape.move(to: CGPoint(x: 18.64, y: 4.62))
            shape.addCurve(to: CGPoint(x: 19, y: 4.79), controlPoint1: CGPoint(x: 18.78, y: 4.51), controlPoint2: CGPoint(x: 19, y: 4.62))
            shape.addLine(to: CGPoint(x: 19, y: 12.25))
            shape.addCurve(to: CGPoint(x: 17.22, y: 14), controlPoint1: CGPoint(x: 19, y: 13.22), controlPoint2: CGPoint(x: 18.2, y: 14))
            shape.addLine(to: CGPoint(x: 1.78, y: 14))
            shape.addCurve(to: CGPoint(x: 0, y: 12.25), controlPoint1: CGPoint(x: 0.8, y: 14), controlPoint2: CGPoint(x: 0, y: 13.22))
            shape.addLine(to: CGPoint(x: 0, y: 4.8))
            shape.addCurve(to: CGPoint(x: 0.36, y: 4.63), controlPoint1: CGPoint(x: 0, y: 4.62), controlPoint2: CGPoint(x: 0.21, y: 4.51))
            shape.addCurve(to: CGPoint(x: 6.08, y: 8.77), controlPoint1: CGPoint(x: 1.19, y: 5.26), controlPoint2: CGPoint(x: 2.29, y: 6.07))
            shape.addCurve(to: CGPoint(x: 9.5, y: 10.5), controlPoint1: CGPoint(x: 6.86, y: 9.33), controlPoint2: CGPoint(x: 8.18, y: 10.51))
            shape.addCurve(to: CGPoint(x: 12.93, y: 8.77), controlPoint1: CGPoint(x: 10.82, y: 10.51), controlPoint2: CGPoint(x: 12.17, y: 9.31))
            shape.addCurve(to: CGPoint(x: 18.64, y: 4.62), controlPoint1: CGPoint(x: 16.71, y: 6.07), controlPoint2: CGPoint(x: 17.81, y: 5.26))
            shape.close()
            shape.move(to: CGPoint(x: 9.5, y: 9.33))
            shape.addCurve(to: CGPoint(x: 12.22, y: 7.82), controlPoint1: CGPoint(x: 10.36, y: 9.35), controlPoint2: CGPoint(x: 11.6, y: 8.27))
            shape.addCurve(to: CGPoint(x: 18.66, y: 3.13), controlPoint1: CGPoint(x: 17.15, y: 4.31), controlPoint2: CGPoint(x: 17.52, y: 4.01))
            shape.addCurve(to: CGPoint(x: 19, y: 2.44), controlPoint1: CGPoint(x: 18.87, y: 2.97), controlPoint2: CGPoint(x: 19, y: 2.71))
            shape.addLine(to: CGPoint(x: 19, y: 1.75))
            shape.addCurve(to: CGPoint(x: 17.22, y: 0), controlPoint1: CGPoint(x: 19, y: 0.78), controlPoint2: CGPoint(x: 18.2, y: 0))
            shape.addLine(to: CGPoint(x: 1.78, y: 0))
            shape.addCurve(to: CGPoint(x: 0, y: 1.75), controlPoint1: CGPoint(x: 0.8, y: 0), controlPoint2: CGPoint(x: 0, y: 0.78))
            shape.addLine(to: CGPoint(x: 0, y: 2.44))
            shape.addCurve(to: CGPoint(x: 0.34, y: 3.13), controlPoint1: CGPoint(x: 0, y: 2.71), controlPoint2: CGPoint(x: 0.13, y: 2.96))
            shape.addCurve(to: CGPoint(x: 6.78, y: 7.82), controlPoint1: CGPoint(x: 1.48, y: 4), controlPoint2: CGPoint(x: 1.85, y: 4.31))
            shape.addCurve(to: CGPoint(x: 9.5, y: 9.33), controlPoint1: CGPoint(x: 7.4, y: 8.27), controlPoint2: CGPoint(x: 8.64, y: 9.35))
            shape.close()
            context.saveGState()
            UIColor(hue: 0.588, saturation: 0.125, brightness: 0.596, alpha: 1).setFill()
            shape.fill()
            context.restoreGState()
            
            context.restoreGState()
        }
        
        context.restoreGState()
    }
    
    
    class func drawVerificationIcon(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 20, height: 20), resizing: ResizingBehavior = .aspectFit) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize to Target Frame
        context.saveGState()
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 20, height: 20), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 20, y: resizedFrame.height / 20)
        
        /// Group
        do {
            context.saveGState()
            context.translateBy(x: 1, y: 1)
            
            /// Shape
            let shape = UIBezierPath()
            shape.move(to: CGPoint(x: 17.52, y: 8.15))
            shape.addLine(to: CGPoint(x: 16.89, y: 7.77))
            shape.addCurve(to: CGPoint(x: 16.36, y: 7.04), controlPoint1: CGPoint(x: 16.62, y: 7.61), controlPoint2: CGPoint(x: 16.44, y: 7.35))
            shape.addCurve(to: CGPoint(x: 16.36, y: 7.03), controlPoint1: CGPoint(x: 16.36, y: 7.04), controlPoint2: CGPoint(x: 16.36, y: 7.03))
            shape.addCurve(to: CGPoint(x: 16.45, y: 6.12), controlPoint1: CGPoint(x: 16.27, y: 6.72), controlPoint2: CGPoint(x: 16.3, y: 6.4))
            shape.addLine(to: CGPoint(x: 16.81, y: 5.48))
            shape.addCurve(to: CGPoint(x: 15.95, y: 4), controlPoint1: CGPoint(x: 17.17, y: 4.82), controlPoint2: CGPoint(x: 16.7, y: 4.02))
            shape.addLine(to: CGPoint(x: 15.21, y: 3.99))
            shape.addCurve(to: CGPoint(x: 14.39, y: 3.63), controlPoint1: CGPoint(x: 14.9, y: 3.99), controlPoint2: CGPoint(x: 14.61, y: 3.85))
            shape.addCurve(to: CGPoint(x: 14.38, y: 3.62), controlPoint1: CGPoint(x: 14.38, y: 3.62), controlPoint2: CGPoint(x: 14.38, y: 3.62))
            shape.addCurve(to: CGPoint(x: 14.01, y: 2.79), controlPoint1: CGPoint(x: 14.16, y: 3.4), controlPoint2: CGPoint(x: 14.02, y: 3.11))
            shape.addLine(to: CGPoint(x: 14, y: 2.05))
            shape.addCurve(to: CGPoint(x: 12.52, y: 1.2), controlPoint1: CGPoint(x: 13.99, y: 1.3), controlPoint2: CGPoint(x: 13.18, y: 0.83))
            shape.addLine(to: CGPoint(x: 11.88, y: 1.55))
            shape.addCurve(to: CGPoint(x: 10.98, y: 1.65), controlPoint1: CGPoint(x: 11.61, y: 1.71), controlPoint2: CGPoint(x: 11.28, y: 1.73))
            shape.addCurve(to: CGPoint(x: 10.96, y: 1.64), controlPoint1: CGPoint(x: 10.97, y: 1.65), controlPoint2: CGPoint(x: 10.97, y: 1.65))
            shape.addCurve(to: CGPoint(x: 10.23, y: 1.11), controlPoint1: CGPoint(x: 10.66, y: 1.56), controlPoint2: CGPoint(x: 10.39, y: 1.38))
            shape.addLine(to: CGPoint(x: 9.86, y: 0.48))
            shape.addCurve(to: CGPoint(x: 8.15, y: 0.48), controlPoint1: CGPoint(x: 9.47, y: -0.16), controlPoint2: CGPoint(x: 8.54, y: -0.16))
            shape.addLine(to: CGPoint(x: 7.77, y: 1.11))
            shape.addCurve(to: CGPoint(x: 7.04, y: 1.64), controlPoint1: CGPoint(x: 7.61, y: 1.38), controlPoint2: CGPoint(x: 7.34, y: 1.56))
            shape.addCurve(to: CGPoint(x: 7.03, y: 1.65), controlPoint1: CGPoint(x: 7.04, y: 1.65), controlPoint2: CGPoint(x: 7.04, y: 1.65))
            shape.addCurve(to: CGPoint(x: 6.12, y: 1.55), controlPoint1: CGPoint(x: 6.72, y: 1.73), controlPoint2: CGPoint(x: 6.4, y: 1.71))
            shape.addLine(to: CGPoint(x: 5.48, y: 1.2))
            shape.addCurve(to: CGPoint(x: 4, y: 2.05), controlPoint1: CGPoint(x: 4.82, y: 0.83), controlPoint2: CGPoint(x: 4.02, y: 1.3))
            shape.addLine(to: CGPoint(x: 3.99, y: 2.79))
            shape.addCurve(to: CGPoint(x: 3.62, y: 3.62), controlPoint1: CGPoint(x: 3.99, y: 3.1), controlPoint2: CGPoint(x: 3.85, y: 3.4))
            shape.addCurve(to: CGPoint(x: 3.62, y: 3.62), controlPoint1: CGPoint(x: 3.62, y: 3.62), controlPoint2: CGPoint(x: 3.62, y: 3.62))
            shape.addCurve(to: CGPoint(x: 2.79, y: 3.99), controlPoint1: CGPoint(x: 3.4, y: 3.85), controlPoint2: CGPoint(x: 3.11, y: 3.99))
            shape.addLine(to: CGPoint(x: 2.05, y: 4))
            shape.addCurve(to: CGPoint(x: 1.2, y: 5.48), controlPoint1: CGPoint(x: 1.3, y: 4.02), controlPoint2: CGPoint(x: 0.83, y: 4.82))
            shape.addLine(to: CGPoint(x: 1.55, y: 6.12))
            shape.addCurve(to: CGPoint(x: 1.65, y: 7.03), controlPoint1: CGPoint(x: 1.71, y: 6.4), controlPoint2: CGPoint(x: 1.73, y: 6.72))
            shape.addCurve(to: CGPoint(x: 1.64, y: 7.04), controlPoint1: CGPoint(x: 1.65, y: 7.03), controlPoint2: CGPoint(x: 1.65, y: 7.04))
            shape.addCurve(to: CGPoint(x: 1.11, y: 7.77), controlPoint1: CGPoint(x: 1.56, y: 7.34), controlPoint2: CGPoint(x: 1.38, y: 7.61))
            shape.addLine(to: CGPoint(x: 0.48, y: 8.15))
            shape.addCurve(to: CGPoint(x: 0.48, y: 9.85), controlPoint1: CGPoint(x: -0.16, y: 8.53), controlPoint2: CGPoint(x: -0.16, y: 9.47))
            shape.addLine(to: CGPoint(x: 1.11, y: 10.23))
            shape.addCurve(to: CGPoint(x: 1.64, y: 10.96), controlPoint1: CGPoint(x: 1.38, y: 10.39), controlPoint2: CGPoint(x: 1.56, y: 10.66))
            shape.addCurve(to: CGPoint(x: 1.65, y: 10.98), controlPoint1: CGPoint(x: 1.64, y: 10.96), controlPoint2: CGPoint(x: 1.65, y: 10.97))
            shape.addCurve(to: CGPoint(x: 1.55, y: 11.88), controlPoint1: CGPoint(x: 1.73, y: 11.28), controlPoint2: CGPoint(x: 1.71, y: 11.6))
            shape.addLine(to: CGPoint(x: 1.2, y: 12.52))
            shape.addCurve(to: CGPoint(x: 2.05, y: 14), controlPoint1: CGPoint(x: 0.83, y: 13.18), controlPoint2: CGPoint(x: 1.3, y: 13.99))
            shape.addLine(to: CGPoint(x: 2.79, y: 14.01))
            shape.addCurve(to: CGPoint(x: 3.62, y: 14.38), controlPoint1: CGPoint(x: 3.11, y: 14.02), controlPoint2: CGPoint(x: 3.4, y: 14.16))
            shape.addCurve(to: CGPoint(x: 3.62, y: 14.39), controlPoint1: CGPoint(x: 3.62, y: 14.38), controlPoint2: CGPoint(x: 3.62, y: 14.38))
            shape.addCurve(to: CGPoint(x: 3.99, y: 15.21), controlPoint1: CGPoint(x: 3.85, y: 14.61), controlPoint2: CGPoint(x: 3.99, y: 14.9))
            shape.addLine(to: CGPoint(x: 4, y: 15.95))
            shape.addCurve(to: CGPoint(x: 5.48, y: 16.8), controlPoint1: CGPoint(x: 4.02, y: 16.7), controlPoint2: CGPoint(x: 4.82, y: 17.17))
            shape.addLine(to: CGPoint(x: 6.12, y: 16.45))
            shape.addCurve(to: CGPoint(x: 7.03, y: 16.35), controlPoint1: CGPoint(x: 6.4, y: 16.3), controlPoint2: CGPoint(x: 6.72, y: 16.27))
            shape.addCurve(to: CGPoint(x: 7.04, y: 16.36), controlPoint1: CGPoint(x: 7.03, y: 16.36), controlPoint2: CGPoint(x: 7.04, y: 16.36))
            shape.addCurve(to: CGPoint(x: 7.77, y: 16.89), controlPoint1: CGPoint(x: 7.34, y: 16.44), controlPoint2: CGPoint(x: 7.61, y: 16.62))
            shape.addLine(to: CGPoint(x: 8.15, y: 17.52))
            shape.addCurve(to: CGPoint(x: 9.85, y: 17.52), controlPoint1: CGPoint(x: 8.53, y: 18.16), controlPoint2: CGPoint(x: 9.47, y: 18.16))
            shape.addLine(to: CGPoint(x: 10.23, y: 16.89))
            shape.addCurve(to: CGPoint(x: 10.96, y: 16.36), controlPoint1: CGPoint(x: 10.39, y: 16.62), controlPoint2: CGPoint(x: 10.66, y: 16.44))
            shape.addCurve(to: CGPoint(x: 10.97, y: 16.35), controlPoint1: CGPoint(x: 10.96, y: 16.36), controlPoint2: CGPoint(x: 10.97, y: 16.36))
            shape.addCurve(to: CGPoint(x: 11.88, y: 16.45), controlPoint1: CGPoint(x: 11.28, y: 16.27), controlPoint2: CGPoint(x: 11.6, y: 16.3))
            shape.addLine(to: CGPoint(x: 12.52, y: 16.8))
            shape.addCurve(to: CGPoint(x: 14, y: 15.95), controlPoint1: CGPoint(x: 13.18, y: 17.17), controlPoint2: CGPoint(x: 13.99, y: 16.7))
            shape.addLine(to: CGPoint(x: 14.01, y: 15.21))
            shape.addCurve(to: CGPoint(x: 14.38, y: 14.39), controlPoint1: CGPoint(x: 14.02, y: 14.9), controlPoint2: CGPoint(x: 14.15, y: 14.61))
            shape.addCurve(to: CGPoint(x: 14.38, y: 14.38), controlPoint1: CGPoint(x: 14.38, y: 14.38), controlPoint2: CGPoint(x: 14.38, y: 14.38))
            shape.addCurve(to: CGPoint(x: 15.21, y: 14.01), controlPoint1: CGPoint(x: 14.61, y: 14.16), controlPoint2: CGPoint(x: 14.9, y: 14.02))
            shape.addLine(to: CGPoint(x: 15.95, y: 14))
            shape.addCurve(to: CGPoint(x: 16.8, y: 12.52), controlPoint1: CGPoint(x: 16.7, y: 13.99), controlPoint2: CGPoint(x: 17.17, y: 13.18))
            shape.addLine(to: CGPoint(x: 16.45, y: 11.88))
            shape.addCurve(to: CGPoint(x: 16.35, y: 10.98), controlPoint1: CGPoint(x: 16.29, y: 11.6), controlPoint2: CGPoint(x: 16.27, y: 11.28))
            shape.addCurve(to: CGPoint(x: 16.36, y: 10.96), controlPoint1: CGPoint(x: 16.35, y: 10.97), controlPoint2: CGPoint(x: 16.36, y: 10.97))
            shape.addCurve(to: CGPoint(x: 16.89, y: 10.23), controlPoint1: CGPoint(x: 16.44, y: 10.66), controlPoint2: CGPoint(x: 16.62, y: 10.39))
            shape.addLine(to: CGPoint(x: 17.52, y: 9.85))
            shape.addCurve(to: CGPoint(x: 17.52, y: 8.15), controlPoint1: CGPoint(x: 18.16, y: 9.47), controlPoint2: CGPoint(x: 18.16, y: 8.53))
            shape.close()
            context.saveGState()
            context.translateBy(x: 0, y: 0)
            UIColor(hue: 0.588, saturation: 0.125, brightness: 0.596, alpha: 1).setFill()
            shape.fill()
            context.restoreGState()
            
            /// Path
            let path2 = UIBezierPath()
            path2.move(to: CGPoint(x: 8.12, y: 1.18))
            path2.addLine(to: CGPoint(x: 3.57, y: 5.72))
            path2.addCurve(to: CGPoint(x: 3.08, y: 5.93), controlPoint1: CGPoint(x: 3.44, y: 5.85), controlPoint2: CGPoint(x: 3.27, y: 5.93))
            path2.addCurve(to: CGPoint(x: 2.59, y: 5.72), controlPoint1: CGPoint(x: 2.9, y: 5.93), controlPoint2: CGPoint(x: 2.72, y: 5.85))
            path2.addLine(to: CGPoint(x: 0.2, y: 3.33))
            path2.addCurve(to: CGPoint(x: 0.2, y: 2.35), controlPoint1: CGPoint(x: -0.07, y: 3.06), controlPoint2: CGPoint(x: -0.07, y: 2.63))
            path2.addCurve(to: CGPoint(x: 1.18, y: 2.35), controlPoint1: CGPoint(x: 0.47, y: 2.08), controlPoint2: CGPoint(x: 0.91, y: 2.08))
            path2.addLine(to: CGPoint(x: 3.08, y: 4.26))
            path2.addLine(to: CGPoint(x: 7.14, y: 0.2))
            path2.addCurve(to: CGPoint(x: 8.12, y: 0.2), controlPoint1: CGPoint(x: 7.41, y: -0.07), controlPoint2: CGPoint(x: 7.85, y: -0.07))
            path2.addCurve(to: CGPoint(x: 8.12, y: 1.18), controlPoint1: CGPoint(x: 8.39, y: 0.47), controlPoint2: CGPoint(x: 8.39, y: 0.91))
            path2.close()
            context.saveGState()
            context.translateBy(x: 4.84, y: 6.23)
            path2.usesEvenOddFillRule = true
            UIColor.white.setFill()
            path2.fill()
            context.restoreGState()
            
            context.restoreGState()
        }
        
        context.restoreGState()
    }
    
    
    class func imageOfVerificationIcon() -> UIImage {
        struct LocalCache {
            static var image: UIImage!
        }
        if LocalCache.image != nil {
            return LocalCache.image
        }
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 20, height: 20), false, 0)
        UIIcon.drawVerificationIcon()
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        LocalCache.image = image
        return image
    }
    
    class func imageOfInvitationCardSmall() -> UIImage {
        struct LocalCache {
            static var image: UIImage!
        }
        if LocalCache.image != nil {
            return LocalCache.image
        }
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 19, height: 14), false, 0)
        UIIcon.drawInvitationCardSmall()
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        LocalCache.image = image
        return image
    }
}

extension UIIcon {
    
    public enum ResizingBehavior {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.
        
        func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}

public enum IconPosition {
    case left
    case right
    case leftAndRight
    case rightAndLeft
}

public extension String {

    
    public func attributed(with icon: UIImage? = nil, iconColor: UIColor = .dark, font: UIFont = UIFont.systemFont(ofSize: 20, weight: .heavy), color: UIColor = UIColor.dark, position: IconPosition = .leftAndRight, centered: Bool = false, lineBreakMode: NSLineBreakMode = .byClipping) -> NSAttributedString {
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = lineBreakMode
        if centered {
            paragraph.alignment = .center
        }
        let attributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.paragraphStyle: paragraph]
        
        if icon == nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = !centered ? .left : .center
            paragraph.lineBreakMode = .byTruncatingTail
            return NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.paragraphStyle : paragraphStyle])
        }
        
        guard let icon = icon else {
            return NSAttributedString(string: self, attributes: attributes)
        }
        
        let imageAttachment = NSTextAttachment.centered(with: iconColor == .white ? icon.withColor(.white) : icon , and: font)
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        let leadingString = NSMutableAttributedString(string:"")
        
        switch position {
        case .left:
            leadingString.append(imageString)
            let attributed = NSAttributedString(string: " \(self)", attributes: attributes)
            leadingString.append(attributed)
            return leadingString
        case .right:
            let attributedString = NSMutableAttributedString(string: "\(self) ", attributes: attributes)
            attributedString.append(imageString)
            return attributedString
        case .leftAndRight:
            let imageAttachment2 = NSTextAttachment.centered(with: icon.withColor(.clear), and: font)
            let imageString2 = NSAttributedString(attachment: imageAttachment2)
            leadingString.append(imageString)
            let attributed = NSAttributedString(string: " \(self) ", attributes: attributes)
            leadingString.append(attributed)
            leadingString.append(imageString2)
            return leadingString
        case .rightAndLeft:
            let imageAttachment2 = NSTextAttachment.centered(with: icon.withColor(.clear), and: font)
            let imageString2 = NSAttributedString(attachment: imageAttachment2)
            leadingString.append(imageString2)
            let attributed = NSAttributedString(string: "\(self) ", attributes: attributes)
            leadingString.append(attributed)
            leadingString.append(imageString)
            return leadingString
        }
    }
}

public extension NSTextAttachment {
    
    public static func centered(with image: UIImage, and font: UIFont) -> NSTextAttachment {
        let imageAttachment = NSTextAttachment()
        imageAttachment.bounds = CGRect(x: 0, y: (font.capHeight - image.size.height).rounded() / 2, width: image.size.width, height: image.size.height)
        imageAttachment.image = image
        return imageAttachment
    }
}
