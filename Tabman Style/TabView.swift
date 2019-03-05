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
    
    /// PAGE 2 TO 1
    
    private var oneToCenter: Interpolate?
    
    private var twoToRhs: Interpolate?
    
    private var threeToOffRight: Interpolate?
    
    /// PAGE 3 to 2
    
    private var oneToLhs: Interpolate?
    
    private var twoToCenter: Interpolate?
    
    private var threeToRhs: Interpolate?
    
    private var fourToOffRight: Interpolate?
    
    /// PAGE 3 to 4
    
    private var twoToOffLeft: Interpolate?
    
    private var threeToLhs: Interpolate?
    
    private var fourToCenter: Interpolate?
    
    private var fiveToRhs: Interpolate?
    
    /// PAGE 4 to 5
    
    private var threeToOffLeft: Interpolate?
    
    private var fourToLhs: Interpolate?
    
    private var fiveToCenter: Interpolate?
    
    
    private var pageTwoToOne: UIViewPropertyAnimator?
    
    private var pageThreeToTwo: UIViewPropertyAnimator?
    
    private var pageThreeToFour: UIViewPropertyAnimator?
    
    private var pageFourToFive: UIViewPropertyAnimator?
    
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

    private func configurePage2to1() {
        oneToCenter = Interpolate(from: one.center.x, to: one.attributes(at: .one).position, apply: { [weak self] (newPosition) in
            self?.one.center.x = newPosition
        })
        
        twoToRhs = Interpolate(from: two.center.x, to: two.attributes(at: .one).position, apply: { [weak self] (newPosition) in
            self?.two.center.x = newPosition
        })
        

        threeToOffRight = Interpolate(from: three.center.x, to: three.attributes(at: .one).position, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        
        pageTwoToOne = UIViewPropertyAnimator()
        if #available(iOS 11.0, *) {
            pageTwoToOne?.pausesOnCompletion = true
        }
        pageTwoToOne?.addAnimations {
            self.one.center.x = self.one.attributes(at: .one).position
            self.two.center.x = self.two.attributes(at: .one).position
            self.three.center.x = self.three.attributes(at: .one).position
            self.four.center.x = self.four.attributes(at: .one).position
            self.five.center.x = self.five.attributes(at: .one).position
        }
    }
    
    private func configurePage3to2() {
        oneToLhs = Interpolate(from: one.center.x, to: one.attributes(at: .two).position, apply: { [weak self] (newPosition) in
            self?.one.center.x = newPosition
        })
        
        twoToCenter = Interpolate(from: two.center.x, to: two.attributes(at: .two).position, apply: { [weak self] (newPosition) in
            self?.two.center.x = newPosition
        })
        
        threeToRhs = Interpolate(from: three.center.x, to: three.attributes(at: .two).position, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        
        fourToOffRight = Interpolate(from: four.center.x, to: four.attributes(at: .two).position, apply: { [weak self] (newPosition) in
            self?.four.center.x = newPosition
        })
        
        pageThreeToTwo = UIViewPropertyAnimator()
        if #available(iOS 11.0, *) {
            pageThreeToTwo?.pausesOnCompletion = true
        }
        pageThreeToTwo?.addAnimations {
            self.one.center.x = self.one.attributes(at: .two).position
            self.two.center.x = self.two.attributes(at: .two).position
            self.three.center.x = self.three.attributes(at: .two).position
            self.four.center.x = self.four.attributes(at: .two).position
            self.five.center.x = self.five.attributes(at: .two).position
        }
    }
    
    private func configurePage3to4() {
        twoToOffLeft = Interpolate(from: two.center.x, to: two.attributes(at: .four).position, apply: { [weak self] (newPosition) in
            self?.two.center.x = newPosition
        })
        
        threeToLhs = Interpolate(from: three.center.x, to: three.attributes(at: .four).position, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        
        fourToCenter = Interpolate(from: four.center.x, to: four.attributes(at: .four).position, apply: { [weak self] (newPosition) in
            self?.four.center.x = newPosition
        })
        
        fiveToRhs = Interpolate(from: five.center.x, to: five.attributes(at: .four).position, apply: { [weak self] (newPosition) in
            self?.five.center.x = newPosition
        })
        pageThreeToFour = UIViewPropertyAnimator()
        if #available(iOS 11.0, *) {
            pageThreeToFour?.pausesOnCompletion = true
        }
        pageThreeToFour?.addAnimations {
            self.one.center.x = self.one.attributes(at: .four).position
            self.two.center.x = self.two.attributes(at: .four).position
            self.three.center.x = self.three.attributes(at: .four).position
            self.four.center.x = self.four.attributes(at: .four).position
            self.five.center.x = self.five.attributes(at: .four).position
        }
    }
    
    private func configurePage4to5() {
        threeToOffLeft = Interpolate(from: three.center.x, to: three.attributes(at: .five).position, apply: { [weak self] (newPosition) in
            self?.three.center.x = newPosition
        })
        
        fourToLhs = Interpolate(from: four.center.x, to: four.attributes(at: .five).position, apply: { [weak self] (newPosition) in
            self?.four.center.x = newPosition
        })
        
        fiveToCenter = Interpolate(from: five.center.x, to: five.attributes(at: .five).position, apply: { [weak self] (newPosition) in
            self?.five.center.x = newPosition
        })
        pageFourToFive = UIViewPropertyAnimator()
        if #available(iOS 11.0, *) {
            pageFourToFive?.pausesOnCompletion = true
        }
        pageFourToFive?.addAnimations {
            self.one.center.x = self.one.attributes(at: .five).position
            self.two.center.x = self.two.attributes(at: .five).position
            self.three.center.x = self.three.attributes(at: .five).position
            self.four.center.x = self.four.attributes(at: .five).position
            self.five.center.x = self.five.attributes(at: .five).position
        }
    }
}

extension TabView: PageboyViewControllerDelegate {
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, didReloadWith currentViewController: UIViewController, currentPageIndex: PageboyViewController.PageIndex) {
        
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: PageboyViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
        self.isUserInteractionEnabled = position.x < 1 ? false : true
        //Log.verbose(position.x)
        let progressTo1 = 1 - position.x
        let progressTo2 = 2 - position.x
        let progressTo4 = position.x - 2
        let progressTo5 = position.x - 3

        if progressTo1 >= 0 && position.x <= 1 {
            Log.info(progressTo1)
            //pageTwoToOne?.fractionComplete = progressTo1
            oneToCenter?.progress = progressTo1
            twoToRhs?.progress = progressTo1
            threeToOffRight?.progress = progressTo1
        }
        if progressTo2 >= 0 && position.x >= 1 && position.x <= 2 {
            Log.debug(progressTo2)
            //pageThreeToTwo?.fractionComplete = progressTo2
            oneToLhs?.progress = progressTo2
            twoToCenter?.progress = progressTo2
            threeToRhs?.progress = progressTo2
            fourToOffRight?.progress = progressTo2
        }
        if progressTo4 >= 0 && position.x >= 2 && position.x <= 3 {
            Log.warning(progressTo4)
           //pageThreeToFour?.fractionComplete = progressTo4
            /*twoToOffLeft?.progress = progressTo4
            threeToLhs?.progress = progressTo4
            fourToCenter?.progress = progressTo4
            fiveToRhs?.progress = progressTo4*/
            
        }
        if progressTo5 >= 0 && position.x >= 3 && position.x <= 4 {
            Log.error(progressTo5)
           // pageFourToFive?.fractionComplete = progressTo5
            /*threeToOffLeft?.progress = progressTo5
            fourToLhs?.progress = progressTo5
            fiveToCenter?.progress = progressTo5*/
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
