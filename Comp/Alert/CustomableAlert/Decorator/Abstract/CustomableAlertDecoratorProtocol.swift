//
//  CustomableAlertDecoratorProtocol.swift
//  UIComp
//
//  Created by Volkan SÖNMEZ on 12.05.2020.
//  Copyright © 2020 Vakifbank. All rights reserved.
//

import Foundation

public protocol CustomableAlertDecoratorProtocol: AnyObject {
    
    var mainView: UIView? { get set }
    
    var customView: UIView? { get set }
    
    var onClose: (() -> Void)? { get set }
    
    var canMove: Bool { get set }
    
    var closeTappedAround: Bool { get set }
    
    var animationTime: TimeInterval { get set }
    
    var closeableZoneRatio: CGFloat { get set }
    
    func setConstraints()
    
    func openingAnimate()
    
    func closingAnimate()
    
    func touchesBegan(touches: Set<UITouch>, event: UIEvent?)
    
    func touchesMoved(touches: Set<UITouch>, event: UIEvent?)
    
    func touchesEnd(touches: Set<UITouch>, event: UIEvent?)
    
}
