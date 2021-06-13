//
//  OverviewTableViewHeaderView.swift
//  Furniture_store
//
//  Created by Olivier Miserez on 13/06/2021.
//

import UIKit

class OverviewTableViewHeaderView: UITableViewHeaderFooterView, ReuseIdentifying {
    lazy var title: UILabel = {
        let view = UILabel()
        view.text = "*** not implemented ***"
        view.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage()
        view.contentMode = .scaleAspectFit
        view.tintColor = .black_primary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        addSubview(title)
        addSubview(imageView)

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),

            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
