//
//  NSLayoutConstraintExtensions.swift
//  SimpleGraphView
//
//  Created by aryzae on 2018/07/27.
//  Copyright © 2018 aryzae. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    func changeMultiplier(to newValue: CGFloat) -> NSLayoutConstraint {
        let multiplier = (newValue > 1.0) ? 1.0 : newValue
        // multiplierのみ変更
        let newContstraint = NSLayoutConstraint(item: firstItem!,
                                                attribute: firstAttribute,
                                                relatedBy: relation,
                                                toItem: secondItem,
                                                attribute: secondAttribute,
                                                multiplier: multiplier,
                                                constant: constant)
        newContstraint.priority = self.priority
        // 適用
        NSLayoutConstraint.deactivate([self])
        NSLayoutConstraint.activate([newContstraint])
        return newContstraint
    }
    
    func changeMultiplier(to newValue: Float) -> NSLayoutConstraint {
        return changeMultiplier(to: CGFloat(newValue))
    }
}
