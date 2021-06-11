//
//  BarButtonItem.swift
//  Furniture_store
//
//  Created by Olivier Miserez on 11/06/2021.
//

import UIKit

class BarButtonItem: UIView {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = .black_primary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var multiplyer: CGFloat = 1

    init(frame: CGRect, image: UIImage, mulitplyer: CGFloat = 1) {
        super.init(frame: frame)
        addShadow(shadowColor: .black.withAlphaComponent(0.5),
                  offSet: CGSize(width: 0.5, height: 1.0),
                  opacity: 0.4,
                  shadowRadius: 8.0,
                  cornerRadius: 11.0,
                  corners: [.allCorners],
                  fillColor: .background_primary)

        addSubview(imageView)
        imageView.image = image
        multiplyer = mulitplyer
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let x = (frame.width - 20) / multiplyer

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: x),
            imageView.widthAnchor.constraint(equalToConstant: x),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 2),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])

        layer.cornerCurve = .continuous
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func addShadow(
        shadowColor: UIColor,
        offSet: CGSize,
        opacity: Float,
        shadowRadius: CGFloat,
        cornerRadius: CGFloat,
        corners: UIRectCorner,
        fillColor: UIColor = .white) {
        let shadowLayer = CAShapeLayer()
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let cgPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: size).cgPath // 1
        shadowLayer.path = cgPath // 2
        shadowLayer.fillColor = fillColor.cgColor // 3
        shadowLayer.shadowColor = shadowColor.cgColor // 4
        shadowLayer.shadowPath = cgPath
        shadowLayer.shadowOffset = offSet // 5
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        layer.addSublayer(shadowLayer)
    }
}

class SmoothedView: UIView {}
