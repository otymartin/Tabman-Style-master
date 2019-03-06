//
//  TabmanButton.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

//
//  TabButton.swift
//  TabButton
//
//  Created by Martin Otyeka on 2018-06-03.
//  Copyright © 2018 New Capsule Corp. All rights reserved.
//

import UIKit
import Pageboy
import Interpolate

public enum TabPage: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    
    public var title: String {
        switch self {
        case .one:
            return "One"
        case .two:
            return "Two"
        case .three:
            return "Three"
        case .four:
            return "Four"
        case .five:
            return "Five"
        }
    }
    
    public var color: UIColor {
        switch self {
        case .one:
            return .white
        case .two:
            return .yellow
        case .three:
            return .blue
        case .four:
            return .red
        case .five:
            return .green
        }
    }
    
    
    public var initialTextColor: UIColor {
        switch self {
        case .one, .five:
            return hidden
        case .two, .four:
            return faded
        case .three:
            return visible
        }
    }
    
    public var initialIconColor: UIColor {
        switch self {
        case .three, .four, .five:
            return self.faded
        default:
            return self.hidden
        }
    }
    
    public var hidden: UIColor {
        return .clear
    }
    
    public var faded: UIColor {
        return UIColor.black.withAlphaComponent(0.4)
    }
    
    public var visible: UIColor {
        return .black
    }
}

import UIKit
import Pageboy

protocol TabButtonDelegate: class {
    
    func didTapTabButton(for page: TabPage)
}

final class TabButton: UIButton {
    
    private var leftIconLabel: UILabel?
    
    private var rightIconLabel: UILabel?
    
    private var hopOneAlpha: Interpolate?
    
    private var hopTwoAlpha: Interpolate?
    
    public weak var delegate: TabButtonDelegate?
    
    public var buttonPage: TabPage = .one {
        didSet {
            configure(for: buttonPage)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func Tap() {
        delegate?.didTapTabButton(for: buttonPage)
    }

}

extension TabButton {
    
    private func configure() {
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        addTarget(self, action: #selector(Tap), for: .touchUpInside)
    }
    
    private func configure(for page: TabPage) {
        setTitle(buttonPage.title, for: .normal)
        setTitleColor(buttonPage.initialTextColor, for: .normal)
        switch buttonPage {
            case .four, .five:
                print("")
                //addIconLabels()
            default:
                break
         }
    }
    
   /*private func addIconLabels() {
        leftIconLabel = UILabel()
        leftIconLabel?.alpha = 0
        leftIconLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        leftIconLabel?.isUserInteractionEnabled = false
        leftIconLabel?.textColor = buttonPage.initialIconColor
        guard let leftIconLabel = leftIconLabel else { return }
        addSubview(leftIconLabel)
        leftIconLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.leading.equalTo(view.snp.leading)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        rightIconLabel = UILabel()
        rightIconLabel?.alpha = 0.4
        rightIconLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        rightIconLabel?.isUserInteractionEnabled = false
        rightIconLabel?.textColor = buttonPage.initialIconColor
        guard let rightIconLabel = rightIconLabel else { return }
        addSubview(rightIconLabel)
        rightIconLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.trailing.equalTo(view.snp.trailing)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        //self.configureInterpolations()
    }*/
    
    /*private func configureInterpolations() {
        
        hopOneAlpha = Interpolate(from: 0.4, to: 0 , apply: { [weak self] (alpha) in
            self?.rightIconLabel?.alpha = alpha
        })
        
        hopTwoAlpha = Interpolate(from: self.page == .three ? CGFloat(0) : 0.4, to: self.page == .three ? 0.4 : 0, apply: { [weak self] (alpha) in
            guard let page = self?.page else { return }
            switch page {
            case .three:
                self?.leftIconLabel?.alpha = alpha
            case .four:
                self?.rightIconLabel?.alpha = alpha
            default:
                break
            }
        })
        
        hopThreeAlpha = Interpolate(from: self.page == .four ? CGFloat(0) : 0.4, to: self.page == .four ? 0.4 : 0, apply: { [weak self] (alpha) in
            guard let page = self?.page else { return }
            switch page {
            case .four:
                self?.leftIconLabel?.alpha = alpha
            case .five:
                self?.rightIconLabel?.alpha = alpha
            default:
                break
            }
        })
    }*/
}

extension TabButton {
    
    /*public func set(_ title: String, with icon: Icon? = nil) {
        if let icon = icon {
            let leftTitle = title.attributed(with: icon, iconColor: .messageGray, font: UIFont.systemFont(ofSize: 17, weight: .heavy), position: .left)
            let rightTitle = title.attributed(with: icon, iconColor: .messageGray, font: UIFont.systemFont(ofSize: 17, weight: .heavy), position: .right)
            self.leftIconLabel?.attributedText = leftTitle
            self.rightIconLabel?.attributedText = rightTitle
        } else {
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.dark]
            self.leftIconLabel?.attributedText = NSAttributedString(string: String(title.reversed()), attributes: attributes)
            self.rightIconLabel?.attributedText = NSAttributedString(string: title, attributes: attributes)
        }
    }*/
}

extension TabButton {
    
    private var margin: CGFloat {
        return 16
    }
    
    private var tabViewHeight: CGFloat {
        return 44
    }
    
    public var width: CGFloat {
        return bounds.width
    }
    
    public var height: CGFloat {
        return bounds.height
    }
    
    public var halfOfWidth: CGFloat {
        return width.divided(by: 2)
    }
    
    public var halfOfHeight: CGFloat {
        return height.divided(by: 2)
    }
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var tabCenterY: CGFloat {
        return tabViewHeight.divided(by: 2)
    }
    
    public var tabCenterX: CGFloat {
        switch buttonPage {
        case .one:
            return offLeft
        case .two:
            return lhs
        case .three:
            return tabCenter
        case .four:
            return rhs
        case .five:
            return offRight
        }
    }
    
    public var farLeft: CGFloat {
        return -(screenWidth - (halfOfWidth + margin))
    }
    
    public var centerLeft: CGFloat {
        return -(screenWidth.divided(by: 2).subtracting(halfOfWidth))
    }
    
    public var offLeft: CGFloat {
        return -(margin.adding(halfOfWidth))
    }
    
    public var lhs: CGFloat {
        return margin.adding(halfOfWidth)
    }
    
    public var tabCenter: CGFloat {
        return screenWidth.divided(by: 2)
    }
    
    public var rhs: CGFloat {
        return screenWidth.subtracting(margin.adding(halfOfWidth))
    }
    
    public var offRight: CGFloat {
        return screenWidth.adding(margin.adding(halfOfWidth))
    }
    
    public var centerRight: CGFloat {
        return screenWidth.adding(screenWidth.divided(by: 2).subtracting(halfOfWidth))
    }
    
    public var farRight: CGFloat {
        return screenWidth.multiplied(by: 2).subtracting(margin.adding(halfOfWidth))
    }
    
    public var farOffRight: CGFloat {
        return screenWidth.multiplied(by: 2).adding(margin.adding(halfOfWidth))
    }
    
    public var farCenterRight: CGFloat {
        return screenWidth.multiplied(by: 2) + screenWidth.divided(by: 2) + halfOfWidth
    }
}


public extension CGFloat {
    
    public func subtracting(_ value: CGFloat) -> CGFloat {
        return self - value
    }
    
    public func multiplied(by: CGFloat) -> CGFloat {
        return self * by
    }
    
    public func divided(by: CGFloat) -> CGFloat {
        return self / by
    }
    
    public func adding(_ value: CGFloat) -> CGFloat {
        return self + value
    }
}




