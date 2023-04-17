//
//  ProgramaticView.swift
//  DareDiceFoundation
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 28.08.2022.
//

open class ProgrammaticView: UIView {
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration()
        setupSubviews()
        addSubviews()
        setConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configuration() {}
    
    func setupSubviews() {}
    
    func addSubviews() {}
    
    func setConstraints() {}
    
    public func openingAnimate() {
        let customView = self
        customView.alpha = 0.0
        let currentPosition = customView.frame.origin.y
        customView.frame.origin.y += customView.frame.height
        
        UIView.animate(withDuration: 0.5) {
            customView.alpha = 1.0
            customView.frame.origin.y = currentPosition
        }
    }
    
    public func closingAnimate() {
        let customView = self
        UIView.animate(withDuration: 0.5, animations: {
            customView.frame.origin.y += customView.frame.height
            customView.alpha = 0.0
        }) { isCompleted in
            if isCompleted {
                self.blurEffectView.removeFromSuperview()
                self.removeFromSuperview()
            }
        }
    }
    
    func addOpaqueView(parent: UIView) {
        
        blurEffectView.frame = parent.frame
        parent.addSubview(blurEffectView)
        
        let path = UIBezierPath(
                roundedRect: blurEffectView.frame,
                cornerRadius: 0)
        
        let casing = UIBezierPath(rect: self.frame)
        
        path.append(casing)
        path.usesEvenOddFillRule = true
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd

        let borderLayer = CAShapeLayer()
        borderLayer.path = casing.cgPath
        borderLayer.strokeColor = UIColor.clear.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = 1

        blurEffectView.layer.addSublayer(borderLayer)
        blurEffectView.layer.mask = maskLayer
    }

}
