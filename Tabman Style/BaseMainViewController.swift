//
//  ViewController.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-02.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SnapKit
import SwiftyTimer
import Interpolate

open class BaseMainViewController: TabmanViewController, TabViewDelegate {
    
    let tabView = TabView(frame: .zero)
    
    private var viewControllers: [UIViewController] = []
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        addTabView()
        loadViewControllers()
        dataSource = self
        tabView.delegate = self
    }
    
    
    private func addTabView() {
        tabView.delegate = self
        view.addSubview(self.tabView)
        tabView.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(view.snp.top).offset(20)
            }
        }
    }
    
    func didTapTab(for page: TabPage) {
        Log.info(page)
    }
    
    override open func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        tabView.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
    }
}

public func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}

extension BaseMainViewController: PageboyViewControllerDataSource {
    
    func loadViewControllers() {
        for page in iterateEnum(TabPage.self) {
            let pageViewController = PageViewController()
            pageViewController.page = page
            viewControllers.append(pageViewController)
        }
    }
    
    public func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    public func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    public func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return Page.at(index: 1)
    }
}

