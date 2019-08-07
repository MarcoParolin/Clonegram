//
//  BaseComponent.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol BaseComponentDelegate: class {
    func didChange()
}

class BaseComponent: UIView, BaseComponentProtocol {
    
    var baseViewModel: BaseComponentViewModel?
    weak var uiDelegate: BaseComponentDelegate?
    
    @objc var nibView = UIView()
    var nibConstraintToBottom: NSLayoutConstraint?
    private var nibConstraintToTop: NSLayoutConstraint?
    private var nibConstraintToLeft: NSLayoutConstraint?
    private var nibConstraintToRight: NSLayoutConstraint?
    var nibViewClearColor = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setup()
    }

    func classNameForNib() -> String {
        return String(describing: self.classForCoder)
    }
    
    private func loadNib() {
        let className = classNameForNib()
        
        if Bundle.main.path(forResource: className, ofType: "nib") != nil, let views = Bundle.main.loadNibNamed(className, owner: self, options: nil), let nibView = views.first as? UIView {
            self.nibView = nibView
//            nibView.frame = self.bounds
            nibView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(nibView)
            
            self.backgroundColor = UIColor.clear
            
            nibView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
        
        setup()
    }
    
    func setup(with baseViewModel: BaseComponentViewModel? = nil, uiDelegate: BaseComponentDelegate? = nil) {
        self.baseViewModel = baseViewModel
        self.baseViewModel?.view = self
        self.uiDelegate = uiDelegate
    }
    
    func updateUI() {
        
    }
    
    func dataLoaded() {
        updateUI()
    }
}
