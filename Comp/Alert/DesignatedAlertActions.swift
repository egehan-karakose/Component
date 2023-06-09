//
//  DesignatedAlertActions.swift
//  Vakifbank
//
//  Created by Yasin TURKOGLU on 29.07.2019.
//  Copyright © 2019 Vakifbank. All rights reserved.
//

import Foundation
import Common

public enum DesignatedAlertActions {
    case okAction
    case okActionWithHandler(_ handler: VoidHandler?)
    case doneAction
    case doneActionWithHandler(_ handler: VoidHandler?)
    case approveAction
    case approveActionWithHandler(_ handler: VoidHandler?)
    case shareAction
    case shareActionWithHandler(_ handler: VoidHandler?)
    case quitAction
    case quitActionWithHandler(_ handler: VoidHandler?)
    case cancelAction

    
    
    public var action: AlertAction {
        switch self {
        case .okAction:
            return AlertAction(title: "TAMAM".localized, style: .default)
        case .okActionWithHandler(let handler):
            return AlertAction(title: "TAMAM".localized, style: .default, handler: handler)
        case .doneAction:
            return AlertAction(title: "Anladım".localized, style: .default)
        case .doneActionWithHandler(let handler):
            return AlertAction(title: "Anladım".localized, style: .default, handler: handler)
        case .approveAction:
            return AlertAction(title: "Onay".localized, style: .default)
        case .approveActionWithHandler(let handler):
            return AlertAction(title: "Onay".localized, style: .default, handler: handler)
        case .shareAction:
            return AlertAction(title: "Paylaş".localized, style: .default)
        case .shareActionWithHandler(let handler):
            return AlertAction(title: "Paylaş".localized, style: .default, handler: handler)
        case .quitAction:
            return AlertAction(title: "Vazgeç".localized, style: .cancel)
        case .quitActionWithHandler(let handler):
            return AlertAction(title: "Vazgeç".localized, style: .cancel, handler: handler)
        case .cancelAction:
            return AlertAction(title: "İptal".localized, style: .cancel)
        }
    }
    
}
