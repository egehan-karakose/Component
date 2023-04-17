//
//  PopMessageView.swift
//  UIComp
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 30.03.2022.
//  Copyright © 2022 Vakifbank. All rights reserved.
//

import Foundation

public class PopMessageViewModel {
    public var timerLimit = 4
    public var cornerRadius: CGFloat = 30
    public var maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    public let message: String?
    public let image: UIImage?
    public var disableAutoClosing: Bool = false
    
    public init(message: String, image: UIImage){
        self.message = message
        self.image = image
    }
}

@IBDesignable
public class PopMessageView: UIView {
    
    @IBOutlet private weak var rootView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    private var timer: Timer?
    private lazy var timerLimit = 4
    private lazy var timerClickIndex: Int = 0
    private var cornerRadius: CGFloat = 30
    private var maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    
    var viewModel: PopMessageViewModel?
    
    public init(with viewModel: PopMessageViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setUp()
    }
    
    public init(frame: CGRect, with viewModel: PopMessageViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder)  {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        guard let view = self.loadViewFromNib(nibName: "PopMessageView") else { return }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        timerLimit = viewModel?.timerLimit ?? timerLimit
        rootView.clipsToBounds = false
        rootView.layer.cornerRadius = viewModel?.cornerRadius ?? cornerRadius
        rootView.layer.maskedCorners = viewModel?.maskedCorners ?? maskedCorners
        rootView.layer.applySketchShadow(color: .black, alpha: 0.16, xVal: 2, yVal: 2, blur: 3, spread: 0)
        setMessageLabel()
    }
    
    private func setMessageLabel() {
        
        messageLabel.text = viewModel?.message
        messageLabel.font = .bold(of: 24)
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        self.image.image = viewModel?.image
        openingAnimate()
    }
    
}

// MARK: - NibLoadable
extension PopMessageView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let nib = UINib(nibName: nibName, bundle: Bundle.foundation)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @objc private func timerClick() {
        if timerLimit == timerClickIndex {
            timer?.invalidate()
            timerClickIndex = 0
            if !(viewModel?.disableAutoClosing)~ {
                closingAnimate()
            }
            
        }
        timerClickIndex += 1
    }
    
    public func openingAnimate() {
        let customView = self
        customView.alpha = 0.0
        let currentPosition = customView.frame.origin.y
        customView.frame.origin.y += customView.frame.height
        
        UIView.animate(withDuration: 0.5) {
            customView.alpha = 1.0
            customView.frame.origin.y = currentPosition
        } completion: { _ in
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerClick),
                                 userInfo: nil, repeats: true)
        }
    }
    
    public func closingAnimate() {
        let customView = self
        UIView.animate(withDuration: 0.5, animations: {
            customView.frame.origin.y += customView.frame.height
            customView.alpha = 0.0
        }) { isCompleted in
            if isCompleted {
                self.removeFromSuperview()
            }
        }
    }
}
