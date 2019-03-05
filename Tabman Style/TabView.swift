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
        Log.verbose(position.x)
        let progressTo1 = 1 - position.x
        let progressTo2 = 2 - position.x
        let progressTo4 = position.x - 2
        let progressTo5 = position.x - 3
        Log.info(progressTo1)
        Log.debug(progressTo2)
        Log.warning(progressTo4)
        Log.error(progressTo5)

        if progressTo1 >= 0 && position.x <= 1 {
            pageTwoToOne?.fractionComplete = progressTo1
        }
        if progressTo2 >= 0 && position.x >= 1 && position.x <= 2 {
            pageThreeToTwo?.fractionComplete = progressTo2
        }
        if progressTo4 >= 0 && position.x >= 2 && position.x <= 3 {
           pageThreeToFour?.fractionComplete = progressTo4
        }
        if progressTo5 >= 0 && position.x >= 3 && position.x <= 4 {
            pageFourToFive?.fractionComplete = progressTo5
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
