//
//  AlertViewModels.swift
//  Vakifbank
//
//  Created by Kaan Biryol on 16.10.2019.
//  Copyright © 2019 Vakifbank. All rights reserved.
//

import Foundation

//FIXME: AlertManager içindeki style'ları protocol üzerinden model ile yürütebiliriz?
public protocol BaseAlertViewModelProtocol {
    var title: String? { get }
    var message: String? { get }
    var topIcon: AlertIcon? { get }
    var shouldDismissWhenTappedAround: Bool { get }
    var actions: [AlertAction]? { get }
}

public protocol CustomAlertViewModelProtocol: BaseAlertViewModelProtocol {
    var customView: UIView? { get }
    var align: NSTextAlignment? { get }
    var attributedMessage: NSAttributedString? { get }
}

public struct CustomAlertViewModel: CustomAlertViewModelProtocol {
    public var align: NSTextAlignment?
    public var title: String?
    public var message: String?
    public var attributedMessage: NSAttributedString?
    public var topIcon: AlertIcon?
    public var shouldDismissWhenTappedAround: Bool = false
    public var actions: [AlertAction]?
    public var customView: UIView?
    
    public init() {}
    
}
