//
//  BaseViewController.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<Coordinator: BaseCoordinator, ViewModel: BaseViewModel<Coordinator>>: UIViewController, BaseViewProtocol {
    
    var viewModel: ViewModel
    
    private var navbarLeftButton: UIBarButtonItem?
    private var navbarRightButton: UIBarButtonItem?
    private var coverView: UIView?
    
    init(withViewModel viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.frame = CGRect(x: 0, y: 0, width: 375, height: 600)
        self.viewModel.view = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Can't init from decoder")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar()
    }
    
    func willDismissPresentedViewController() {
    }
    
    var forceNoBackButton: Bool {
        return false
    }
    
    var forceBackButton: Bool {
        return false
    }
    
    var shouldBeDisplayedAsModal: Bool {
        return false
    }
    
    // MARK: BaseViewProtocol
    
    func dataLoaded() {
        
    }
    
    // MARK: Utils
    
    func setupNavigationBar() {
//        navigationItem.leftMargin = 0
//        navigationItem.rightMargin = 0

//        let navigationBarHeight = self.navigationController?.navigationBar.viewSize.height ?? 0
//        self.navigationController?.navigationBar.setBackgroundImage(R.image().navBar().resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: navigationBarHeight, right: 0), resizingMode: .stretch), for: .default)
// per rendere le navbar trasparente (gestire poi i top margin dei vari VC)
//        self.navigationController?.navigationBar.barStyle = .blackTranslucent
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // left button
        let count = self.navigationController?.viewControllers.count ?? 0
        if (count > 1 && !forceNoBackButton) || forceBackButton {
//            self.navbarLeftButton = UIBarButtonItem(image: R.image().icBack(), style: .plain, target: self, action: #selector(goBack))
        } else {
//            self.navbarLeftButton = UIBarButtonItem(image: R.image().icLogo(), style: .plain, target: self, action: #selector(goToHome))
        }
        self.navigationItem.leftBarButtonItem = self.navbarLeftButton
        
        // right button
        let button = UIButton(type: .custom)
//        button.setImage(R.image().icMenu(), for: .normal)
        button.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        badgeView.setup(customButton: button)
//        R.theme().styles().notificationsBadge().apply(to: badgeView)
//        badgeView.shouldAnimateBadge = false
//        badgeView.badgeValue = "\(ApplicationState.shared.loggedUser?.newNotificationsCount ?? 0)"
//        badgeView.shouldAnimateBadge = true
//        badgeView.badgeOriginX = 20
//        badgeView.badgeOriginY = 3

//        if let loggedUser = ApplicationState.shared.loggedUser {
//            SDEventBus.sharedInstance()?.addSubscriber(self, to: loggedUser, keyPath: "newNotificationsCount", withCompletion: { [weak self] (_, _) in
//                self?.badgeView.badgeValue = "\(ApplicationState.shared.loggedUser?.newNotificationsCount ?? 0)"
//            })
//        }
        
        self.navbarRightButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = self.navbarRightButton
        
        if #available(iOS 11.0, *) {
            
        } else {
            // per risolvere il problema di iOS 10
            self.edgesForExtendedLayout = []
            if coverView == nil {
                coverView = UIView(frame: self.view.bounds)
                if let coverView = coverView {
                    coverView.backgroundColor = self.view.backgroundColor
                    coverView.translatesAutoresizingMaskIntoConstraints = false
                    self.view.addSubview(coverView)
                    coverView.bottomAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
                    coverView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
                    coverView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
                    coverView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                }
            }
        }
        
    }
    
    @objc func goBack() {
        self.viewModel.goBack()
    }
    
    @objc func goToHome() {
        self.viewModel.backToHome()
    }
    
    @objc func rightButtonAction() {
        self.viewModel.openMenu()
    }
}
