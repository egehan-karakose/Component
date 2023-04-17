//
//  ShareQrView.swift
//  DareDiceFoundation
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 28.08.2022.
//

public class ShareQrView: ProgrammaticView {
    
    private let spacing = UIScreen.main.bounds.height * 0.02
    private let imageViewQr = UIImageView()
    
    public override func configuration() {
        clipsToBounds = true
        layer.cornerRadius = 30
        backgroundColor = .white
        
    }
    
    override func setupSubviews() {
        imageViewQr.translatesAutoresizingMaskIntoConstraints = false
        imageViewQr.contentMode = .scaleAspectFill
        
    }
    
    override func addSubviews() {
        addSubview(imageViewQr)
    }
    
    override func setConstraints() {
        NSLayoutConstraint.activate([
            imageViewQr.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewQr.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageViewQr.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageViewQr.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
    
    public func set(parent: UIView, image: UIImage) {
        
        self.openingAnimate()
        self.addOpaqueView(parent: parent)
        parent.addSubview(self)
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            centerYAnchor.constraint(equalTo: parent.centerYAnchor),
            widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.8),
            heightAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.8)
        ])
        
        imageViewQr.image = image
        
    }
    
}
