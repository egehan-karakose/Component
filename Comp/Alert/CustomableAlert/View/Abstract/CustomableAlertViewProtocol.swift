//
//  CustomableAlertViewProtocol.swift
//  UIComp
//
//  Created by Volkan SÖNMEZ on 14.05.2020.
//  Copyright © 2020 Vakifbank. All rights reserved.
//

import Foundation

public protocol CustomableAlertViewProtocol where Self: UIView {
    
    var size: CGSize { get set }
    
    var onClose: (() -> Void)? { get set }
}
