//
//  HostingTableViewCell.swift
//  FitnessApp
//
//  Created by corey on 2/15/21.
//

import SwiftUI

protocol HostingCellProtocol {
    func startRest()
}

class HostingTableViewCell<Content: View>: UITableViewCell {

    private let hostingController = UIHostingController<ExerciseView?>(rootView: nil)
    
    var delegate: HostingCellProtocol?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        hostingController.view.backgroundColor = .clear
    }

    private func removeHostingControllerFromParent() {
        hostingController.willMove(toParent: nil)
        hostingController.view.removeFromSuperview()
        hostingController.removeFromParent()
    }

    deinit {
        // remove parent
        removeHostingControllerFromParent()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func host(_ rootView: ExerciseView,parent parentController: UIViewController) {
        hostingController.rootView = rootView
        
        hostingController.rootView?.delegate = self
        hostingController.view.invalidateIntrinsicContentSize()

        let requiresControllerMove = hostingController.parent != parentController
        if requiresControllerMove {
            // remove old parent if exists
            removeHostingControllerFromParent()
            parentController.addChild(hostingController)
        }

        if !contentView.subviews.contains(hostingController.view) {
            contentView.addSubview(hostingController.view)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }

        if requiresControllerMove {
            hostingController.didMove(toParent: parentController)
        }
    }
}

//MARK: - ExerciseViewHandlerProtocol
extension HostingTableViewCell: ExerciseViewHandlerProtocol {
    func passTheBuck() {
        print("starting REST")
        delegate?.startRest()
    }
}
