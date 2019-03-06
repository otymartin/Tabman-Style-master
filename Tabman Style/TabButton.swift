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
            return PageTitle.account
        case .two:
            return PageTitle.profile
        case .three:
            return PageTitle.people
        case .four:
            return PageTitle.invitations
        case .five:
            return PageTitle.verification
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
        return UIColor.dark.withAlphaComponent(0.4)
    }
    
    public var visible: UIColor {
        return .dark
    }
    
    public var icon: Icon? {
        switch self {
        case .four:
            return IconImage.invitationCardSmall
        case .five:
            return IconImage.verificationIcon
        default:
            return nil
        }
    }
}

import UIKit
import Pageboy

protocol TabButtonDelegate: class {
    
    func didTapTabButton(for page: TabPage)
}

final class TabButton: UIButton {
    
    private var hopOneAlpha: Interpolate?
    
    private var hopTwoAlpha: Interpolate?
    
    private lazy var leftIconLabel = UILabel()
    
    private lazy var rightIconLabel = UILabel()
    
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
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        addTarget(self, action: #selector(Tap), for: .touchUpInside)
    }
    
    private func configure(for page: TabPage) {
        setTitle(buttonPage.title, for: .normal)
        setTitleColor(buttonPage.initialTextColor, for: .normal)
        switch buttonPage {
            case .four, .five:
                addIconLabels()
                set("0", with: buttonPage.icon)
            default:
                break
         }
    }
    
   private func addIconLabels() {
        leftIconLabel = UILabel()
        leftIconLabel.alpha = 0
        leftIconLabel.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        leftIconLabel.isUserInteractionEnabled = false
        leftIconLabel.textColor = buttonPage.initialIconColor
        addSubview(leftIconLabel)
        leftIconLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.leading.equalTo(view.snp.leading)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        rightIconLabel = UILabel()
        rightIconLabel.alpha = 0.4
        rightIconLabel.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        rightIconLabel.isUserInteractionEnabled = false
        rightIconLabel.textColor = buttonPage.initialIconColor
        addSubview(rightIconLabel)
        rightIconLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.trailing.equalTo(view.snp.trailing)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        self.configureInterpolations()
    }
    
    private func configureInterpolations() {
        
        hopOneAlpha = Interpolate(from: 0.4, to: 0 , apply: { [weak self] (alpha) in
            self?.rightIconLabel.alpha = alpha
        })
        
        hopTwoAlpha = Interpolate(from: buttonPage == .four ? CGFloat(0) : 0.4, to: buttonPage == .four ? 0.4 : 0, apply: { [weak self] (alpha) in
            guard let page = self?.buttonPage else { return }
            switch page {
            case .four:
                self?.leftIconLabel.alpha = alpha
            case .five:
                self?.rightIconLabel.alpha = alpha
            default:
                break
            }
        })
    }
}

extension TabButton {
    
    public func set(_ title: String, with icon: Icon? = nil) {
        if let icon = icon {
            let leftTitle = title.attributed(with: icon, iconColor: .messageGray, font: UIFont.systemFont(ofSize: 17, weight: .heavy), position: .left)
            let rightTitle = title.attributed(with: icon, iconColor: .messageGray, font: UIFont.systemFont(ofSize: 17, weight: .heavy), position: .right)
            self.leftIconLabel?.attributedText = leftTitle
            self.rightIconLabel?.attributedText = rightTitle
        } else {
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.dark]
            self.leftIconLabel.attributedText = NSAttributedString(string: String(title.reversed()), attributes: attributes)
            self.rightIconLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
        }
    }
}

extension TabButton: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
        let progressTo4 = position.x - 2
        let progressTo5 = position.x - 3
        
        if progressTo4 >= 0 && position.x >= 2 && position.x <= 3 {
            switch buttonPage {
            case .four, .five:
                hopOneAlpha?.progress = progressTo4
            default:
                break
            }
        }
        if progressTo5 >= 0 && position.x >= 3 && position.x <= 4 {
            switch buttonPage {
            case .four, .five:
                hopTwoAlpha?.progress = progressTo5
            default:
                break
            }
        }
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        switch index {
        case 1:
            switch buttonPage {
            case .three:
                self.leftIconLabel.alpha = 0
            default:
                break
            }
        case 2:
            switch buttonPage {
            case .three:
                self.leftIconLabel.alpha = 0
                self.rightIconLabel.alpha = 0
            case .four:
                self.leftIconLabel.alpha = 0
            default:
                break
            }
        case 3:
            switch buttonPage {
            case .three:
                self.rightIconLabel.alpha = 0
            case .four:
                self.leftIconLabel.alpha = 0
                self.rightIconLabel.alpha = 0
            case .five:
                self.leftIconLabel.alpha = 0
            default:
                break
            }
        case 4:
            switch buttonPage {
            case .four:
                self.rightIconLabel.alpha = 0
            case .five:
                self.leftIconLabel.alpha = 0
                self.rightIconLabel.alpha = 0
            default:
                break
            }
        default:
            break
        }
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {}
   
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didReloadWith currentViewController: UIViewController, currentPageIndex: PageboyViewController.PageIndex) {}
    
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




