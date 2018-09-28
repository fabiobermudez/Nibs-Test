//
//  UIIMageView+URL.swift
//  Nibs-Example
//
//  Created by Fabio Bermudez on 9/28/18.
//  Copyright © 2018 Fabio Bermudez. All rights reserved.
//

import UIKit

private var AssociatedObjectHandle: UInt8 = 0


extension UIImageView {



    func fetchImage(with url: URL?) {
        guard let url = url else { return }
        if associatedKey != url.absoluteString {
            associatedKey = url.absoluteString
            tryToGetImage(from: url, key: url.absoluteString)
        }
    }

    private func tryToGetImage(from url: URL, key: String) {
        DispatchQueue.init(label: "downloading.images").async {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    if self.associatedKey == key {
                        UIView.transition(with: self,
                                          duration: 0.2,
                                          options: .transitionCrossDissolve,
                                          animations: { self.image = image },
                                          completion: nil)
                    }
                }
            }
        }
    }

    /// Additional stuff to keep track of current URL
    var associatedKey: String {
        get {
            return (objc_getAssociatedObject(self, &AssociatedObjectHandle) as? String) ?? ""
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }



}
