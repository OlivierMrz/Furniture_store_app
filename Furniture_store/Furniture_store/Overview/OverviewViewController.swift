//
//  ViewController.swift
//  Furniture_store
//
//  Created by Olivier Miserez on 11/06/2021.
//

import UIKit

class OverviewViewController: UIViewController {
    private var viewModel: OverviewViewModel

    private var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    init() {
        viewModel = OverviewViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        view.backgroundColor = viewModel.viewBackgroundColor

        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithTransparentBackground()
        navigationItem.standardAppearance = navAppearance

        navigationItem
            .leftBarButtonItem =
            UIBarButtonItem(customView: BarButtonItem(frame: CGRect(x: 0, y: 0, width: 50, height: 50),
                                                      image: Icons.menu))
        navigationItem
            .rightBarButtonItem =
            UIBarButtonItem(customView: BarButtonItem(frame: CGRect(x: 0, y: 0, width: 50, height: 50),
                                                      image: Icons.checkout,
                                                      mulitplyer: 1.5))

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])

        tableView.separatorStyle = .none
        tableView.register(NewArrivalTableViewCell.self,
                           forCellReuseIdentifier: NewArrivalTableViewCell.reuseIdentifier)
        tableView.register(OverviewTableViewHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: OverviewTableViewHeaderView.reuseIdentifier)
    }
}

extension OverviewViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        2
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewArrivalTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! NewArrivalTableViewCell
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 400
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 60
    }

    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: OverviewTableViewHeaderView
                .reuseIdentifier) as? OverviewTableViewHeaderView else {
            return nil
        }

        let titels = ["New arrival", "Collections"]
        view.title.text = titels[section]
        view.imageView.image = Icons.arrow_right
        return view
    }
}
