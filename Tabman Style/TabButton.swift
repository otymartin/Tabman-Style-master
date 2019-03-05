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
        case .one:
            return self.faded
        case .two:
            return self.visible
        case .three, .four, .five:
            return self.faded
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
    
    public enum Text {
        case hidden
        case faded
        case visible
        
        public var color: UIColor {
            switch self {
            case .hidden:
                return .clear
            case .faded:
               return UIColor.black.withAlphaComponent(0.4)
            case .visible:
                return .black
            }
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
    
    public weak var delegate: TabButtonDelegate?
    
    public var buttonPage: TabPage = .one {
        didSet {
            setTitle(buttonPage.title, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TabButton {
    
    private func configure() {
        setTitleColor(.black, for: .normal)
        setTitleColor(buttonPage.initialTextColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        addTarget(self, action: #selector(Tap), for: .touchUpInside)
    }
    
   
    
    @objc func Tap() {
        delegate?.didTapTabButton(for: buttonPage)
    }
}

extension TabButton {
    
    public func attributes(at tabPage: TabPage) -> (position: CGFloat, color: UIColor) {
        switch buttonPage {
        case .one:
            switch tabPage {
            case .one:
                return (position: tabCenter, color: buttonPage.visible)
            case .two:
                return (position: lhs, color: buttonPage.faded)
            case .three:
                return (position: offLeft, color: buttonPage.hidden)
            case .four:
                return (position: offLeft, color: buttonPage.hidden)
            case .five:
                return (position: offLeft, color: buttonPage.hidden)
            }
        case .two:
            switch tabPage {
            case .one:
                return (position: rhs, color: buttonPage.faded)
            case .two:
                return (position: tabCenter, color: buttonPage.visible)
            case .three:
                return (position: lhs, color: buttonPage.faded)
            case .four:
                return (position: offLeft, color: buttonPage.hidden)
            case .five:
                return (position: offLeft, color: buttonPage.hidden)
            }
        case .three:
            switch tabPage {
            case .one:
                return (position: offRight, color: buttonPage.hidden)
            case .two:
                return (position: rhs, color: buttonPage.faded)
            case .three:
                return (position: tabCenter, color: buttonPage.visible)
            case .four:
                return (position: lhs, color: buttonPage.faded)
            case .five:
                return (position: offLeft, color: buttonPage.hidden)
            }
        case .four:
            switch tabPage {
            case .one:
                return (position: offRight, color: buttonPage.hidden)
            case .two:
                return (position: offRight, color: buttonPage.hidden)
            case .three:
                return (position: rhs, color: buttonPage.faded)
            case .four:
                return (position: tabCenter, color: buttonPage.visible)
            case .five:
                return (position: lhs, color: buttonPage.faded)
            }
        case .five:
            switch tabPage {
            case .one:
                return (position: offRight, color: buttonPage.hidden)
            case .two:
                return (position: offRight, color: buttonPage.hidden)
            case .three:
                return (position: offRight, color: buttonPage.hidden)
            case .four:
                return (position: rhs, color: buttonPage.faded)
            case .five:
                return (position: tabCenter, color: buttonPage.visible)
            }
        }
    }
    
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




