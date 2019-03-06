//
//  TabView.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-06-13.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Pageboy
import SnapKit
import Interpolate

protocol TabViewDelegate: class {
    
    func didTapTab(for page: TabPage)
}

final class TabView: UIView {
    
    private lazy var one = TabButton()
    
    private lazy var two = TabButton()
    
    private lazy var three = TabButton()
    
    private lazy var four = TabButton()
    
    private lazy var five = TabButton()
    
    /// PAGE 3 TO 2
    
    private var oneOffLeftToLhs: Interpolate?
    
    private var oneOffLeftToLhsColor: Interpolate?
    
    private var twoLhsToCenter: Interpolate?
    
    private var twoLhsToCenterColor: Interpolate?
    
    private var threeCenterToRhs: Interpolate?
    
    private var threeCenterToRhsColor: Interpolate?
    
    private var fourRhsToOffRight: Interpolate?
    
    private var fourRhsToOffRightColor: Interpolate?
    
    private var fiveOffRightToCenterRight: Interpolate?
    
    /// PAGE 2 to 1
    
    private var oneLhsToCenter: Interpolate?
    
    private var oneLhsToCenterColor: Interpolate?
    
    private var twoCenterToRhs: Interpolate?
    
    private var twoCenterToRhsColor: Interpolate?
    
    private var threeRhsToOffRight: Interpolate?
    
    private var threeRhsToOffRightColor: Interpolate?
    
    private var fourOffRightToCenterRight: Interpolate?
    
    private var fiveCenterRightToFarRight: Interpolate?
    
    /// PAGE 3 to 4
    
    private var oneOffLhsToCenterLeft: Interpolate?
    
    private var twoLhsToOffLeft: Interpolate?
    
    private var twoLhsToOffLeftColor: Interpolate?
    
    private var threeCenterToLhs: Interpolate?
    
    private var threeCenterToLhsColor: Interpolate?
    
    private var fourRhsToCenter: Interpolate?
    
    private var fourRhsToCenterColor: Interpolate?
    
    private var fiveOffRightToRhs: Interpolate?
    
    private var fiveOffRightToRhsColor: Interpolate?
    
    /// PAGE 4 to 5
    
    private var oneCenterLeftToFarLeft: Interpolate?
    
    private var twoOffLeftToCenterLeft: Interpolate?
    
    private var threeLhsToOffLeft: Interpolate?
    
    private var threeLhsToOffLeftColor: Interpolate?
    
    private var fourCenterToLhs: Interpolate?
    
    private var fourCenterToLhsColor: Interpolate?
    
    private var fiveRhsToCenter: Interpolate?
    
    private var fiveRhsToCenterColor: Interpolate?
    
    public weak var delegate: TabViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TabView: TabButtonDelegate {

    final func didTapTabButton(for page: TabPage) {
        self.delegate?.didTapTab(for: page)
    }
}

extension TabView {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 44)
    }
    
    private func configure() {
        configureButtons()
        backgroundColor = .white
    }
    
    private func configureButtons() {
        let buttons = [one, two, three, four, five]
        let pages: [TabPage] = [.one, .two, .three, .four, .five]
        for (index, button) in buttons.enumerated() {
            button.buttonPage = pages[index]
        }
        add(buttons)
    }
    
    private func add(_ buttons: [TabButton]) {
        for button in buttons {
            button.delegate = self
            addSubview(button)
            button.sizeToFit()
            button.center.x = button.tabCenterX
            button.center.y = button.tabCenterY
        }
        configureInterpolations()
    }
}

extension TabView {
    
    private func configureInterpolations() {
        configurePage2to1()
        configurePage3to2()
        configurePage3to4()
        configurePage4to5()
    }

    private func configurePage3to2() {
        oneOffLeftToLhs = Interpolate(from: one.offLeft, to: one.lhs, apply: { [weak self] (newPosition) in
            self?.one.center.x = newPosition
        })
        twoLhsToCenter = Interpolate(from: two.lhs, to: two.tabCenter, apply: { [weak self] (newPosition) in
            self?.two.center.x = newPosition
        })
        threeCenterToRhs = Interpolate(from: three.tabCenter, to: three.rhs, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        fourRhsToOffRight = Interpolate(from: four.rhs, to: four.offRight, apply: { [weak self] (newPosition) in
            self?.four.center.x = newPosition
        })
        fiveOffRightToCenterRight = Interpolate(from: five.offRight, to: five.centerRight, apply: { [weak self] (newPosition) in
            self?.five.center.x = newPosition
        })
        
        oneOffLeftToLhsColor = Interpolate(from: one.buttonPage.hidden, to: one.buttonPage.faded, apply: { [weak self] (newColor) in
            self?.one.setTitleColor(newColor, for: .normal)
        })
        twoLhsToCenterColor = Interpolate(from: two.buttonPage.faded, to: two.buttonPage.visible, apply: { [weak self] (newColor) in
            self?.two.setTitleColor(newColor, for: .normal)
        })
        threeCenterToRhsColor = Interpolate(from: three.buttonPage.visible, to: three.buttonPage.faded, apply: { [weak self] (newColor) in
            self?.three.setTitleColor(newColor, for: .normal)
        })
        fourRhsToOffRightColor = Interpolate(from: four.buttonPage.faded, to: four.buttonPage.hidden, apply: { [weak self] (newColor) in
            self?.four.setTitleColor(newColor, for: .normal)
        })
    }
    
    private func configurePage2to1() {
        oneLhsToCenter = Interpolate(from: one.lhs, to: one.tabCenter, apply: { [weak self] (newPosition) in
            self?.one.center.x = newPosition
        })
        twoCenterToRhs = Interpolate(from: two.tabCenter, to: two.rhs, apply: { [weak self] (newPosition) in
            self?.two.center.x = newPosition
        })
        threeRhsToOffRight = Interpolate(from: three.rhs, to: three.offRight, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        fourOffRightToCenterRight = Interpolate(from: four.offRight, to: four.centerRight, apply: { [weak self] (newPosition) in
            self?.four.center.x = newPosition
        })
        fiveCenterRightToFarRight = Interpolate(from: five.centerRight, to: five.farRight, apply: { [weak self] (newPosition) in
            self?.five.center.x = newPosition
        })
        oneLhsToCenterColor = Interpolate(from: one.buttonPage.faded, to: one.buttonPage.visible, apply: { [weak self] (newColor) in
            self?.one.setTitleColor(newColor, for: .normal)
        })
        twoCenterToRhsColor = Interpolate(from: two.buttonPage.visible, to: two.buttonPage.faded, apply: { [weak self] (newColor) in
            self?.two.setTitleColor(newColor, for: .normal)
        })
        threeRhsToOffRightColor = Interpolate(from: three.buttonPage.faded, to: three.buttonPage.hidden, apply: { [weak self] (newColor) in
            self?.three.setTitleColor(newColor, for: .normal)
        })
    }
    
    private func configurePage3to4() {
        oneOffLhsToCenterLeft = Interpolate(from: one.offLeft, to: one.centerLeft, apply: { [weak self] (newPosition) in
            self?.one.center.x = newPosition
        })
        twoLhsToOffLeft = Interpolate(from: two.lhs, to: two.offLeft, apply: { [weak self] (newPosition) in
            self?.two.center.x = newPosition
        })
        threeCenterToLhs = Interpolate(from: three.tabCenter, to: three.lhs, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        fourRhsToCenter = Interpolate(from: four.rhs, to: four.tabCenter, apply: { [weak self] (newPosition) in
            self?.four.center.x = newPosition
        })
        fiveOffRightToRhs = Interpolate(from: five.offRight, to: five.rhs, apply: { [weak self] (newPosition) in
            self?.five.center.x = newPosition
        })
        twoLhsToOffLeftColor = Interpolate(from: two.buttonPage.faded, to: two.buttonPage.hidden, apply: { [weak self] (newColor) in
            self?.two.setTitleColor(newColor, for: .normal)
        })
        threeCenterToLhsColor = Interpolate(from: three.buttonPage.visible, to: three.buttonPage.faded, apply: { [weak self] (newColor) in
            self?.three.setTitleColor(newColor, for: .normal)
        })
        fourRhsToCenterColor = Interpolate(from: four.buttonPage.faded, to: four.buttonPage.visible, apply: { [weak self] (newColor) in
            self?.four.setTitleColor(newColor, for: .normal)
        })
        fiveOffRightToRhsColor = Interpolate(from: five.buttonPage.hidden, to: four.buttonPage.faded, apply: { [weak self] (newColor) in
            self?.five.setTitleColor(newColor, for: .normal)
        })
    }
    
    private func configurePage4to5() {
        oneCenterLeftToFarLeft = Interpolate(from: one.centerLeft, to: one.farLeft, apply: { [weak self] (newPosition) in
            self?.one.center.x = newPosition
        })
        twoOffLeftToCenterLeft = Interpolate(from: two.offLeft, to: two.centerLeft, apply: { [weak self] (newPosition) in
            self?.two.center.x = newPosition
        })
        threeLhsToOffLeft = Interpolate(from: three.lhs, to: three.offLeft, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        fourCenterToLhs = Interpolate(from: four.tabCenter, to: four.lhs, apply: { [weak self] (newPosition) in
            self?.four.center.x = newPosition
        })
        fiveRhsToCenter = Interpolate(from: five.rhs, to: five.tabCenter, apply: { [weak self] (newPosition) in
            self?.five.center.x = newPosition
        })
        threeLhsToOffLeftColor = Interpolate(from: three.buttonPage.faded, to: three.buttonPage.hidden, apply: { [weak self] (newColor) in
            self?.three.setTitleColor(newColor, for: .normal)
        })
        fourCenterToLhsColor = Interpolate(from: four.buttonPage.visible, to: four.buttonPage.faded, apply: { [weak self] (newColor) in
            self?.four.setTitleColor(newColor, for: .normal)
        })
        fiveRhsToCenterColor = Interpolate(from: five.buttonPage.faded, to: five.buttonPage.visible, apply: { [weak self] (newColor) in
            self?.five.setTitleColor(newColor, for: .normal)
        })
    }
}

extension TabView: PageboyViewControllerDelegate {
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, didReloadWith currentViewController: UIViewController, currentPageIndex: PageboyViewController.PageIndex) {
        
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        //self.isUserInteractionEnabled = position.x < 1 ? false : true
        let progressTo1 = 1 - position.x
        let progressTo2 = 2 - position.x
        let progressTo4 = position.x - 2
        let progressTo5 = position.x - 3

        if progressTo1 >= 0 && position.x <= 1 {
            Log.info(progressTo1)
            oneLhsToCenter?.progress = progressTo1
            twoCenterToRhs?.progress = progressTo1
            threeRhsToOffRight?.progress = progressTo1
            fourOffRightToCenterRight?.progress = progressTo1
            fiveCenterRightToFarRight?.progress = progressTo1
            oneLhsToCenterColor?.progress = progressTo1
            twoCenterToRhsColor?.progress = progressTo1
            threeRhsToOffRightColor?.progress = progressTo1
        }
        if progressTo2 >= 0 && position.x >= 1 && position.x <= 2 {
            Log.debug(progressTo2)
            oneOffLeftToLhs?.progress = progressTo2
            twoLhsToCenter?.progress = progressTo2
            threeCenterToRhs?.progress = progressTo2
            fourRhsToOffRight?.progress = progressTo2
            fiveOffRightToCenterRight?.progress = progressTo2
            oneOffLeftToLhsColor?.progress = progressTo2
            twoLhsToCenterColor?.progress = progressTo2
            threeCenterToRhsColor?.progress = progressTo2
            fourRhsToOffRightColor?.progress = progressTo2
        }
        if progressTo4 >= 0 && position.x >= 2 && position.x <= 3 {
            Log.warning(progressTo4)
            oneOffLhsToCenterLeft?.progress = progressTo4
            twoLhsToOffLeft?.progress = progressTo4
            threeCenterToLhs?.progress = progressTo4
            fourRhsToCenter?.progress = progressTo4
            fiveOffRightToRhs?.progress = progressTo4
            twoLhsToOffLeftColor?.progress = progressTo4
            threeCenterToLhsColor?.progress = progressTo4
            fourRhsToCenterColor?.progress = progressTo4
            fiveOffRightToRhsColor?.progress = progressTo4
        }
        if progressTo5 >= 0 && position.x >= 3 && position.x <= 4 {
            Log.error(progressTo5)
            oneCenterLeftToFarLeft?.progress = progressTo5
            twoOffLeftToCenterLeft?.progress = progressTo5
            threeLhsToOffLeft?.progress = progressTo5
            fourCenterToLhs?.progress = progressTo5
            fiveRhsToCenter?.progress = progressTo5
            threeLhsToOffLeftColor?.progress = progressTo5
            fourCenterToLhsColor?.progress = progressTo5
            fiveRhsToCenterColor?.progress = progressTo5
        }
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
        isUserInteractionEnabled = index == 0 ? false : true
        /*
        switch index {
        case 1:
            one.titleLabel?.textColor = self.one.page.
            two.titleLabel?.textColor = self.two.page.visible
            three.titleLabel?.textColor = self.three.page.hidden
        case 2:
            two.titleLabel?.textColor = self.two.page.faded
            three.titleLabel?.textColor = self.three.page.visible
            four.titleLabel?.textColor = self.four.page.hidden
        case 3:
            three.titleLabel?.textColor = self.three.page.hidden
            four.titleLabel?.textColor = self.four.page.visible
            five.titleLabel?.textColor = self.five.page.hidden
        case 4:
            four.titleLabel?.textColor = self.four.page.hidden
            five.titleLabel?.textColor = self.five.page.visible
        default:
            break
        }*/
    }
    
}

extension UIColor {
    
    class var dark: UIColor {
        return UIColor(red:0.24, green:0.23, blue:0.24, alpha:1.0)
    }
}
