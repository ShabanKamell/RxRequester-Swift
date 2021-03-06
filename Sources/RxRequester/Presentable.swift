//
// Created by mac on 11/16/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

/// This protocol is responsible for presenting UI
public protocol Presentable {

    ///  show error string
    func showError(error: String)

    /// show loading indicator
    func showLoading()

    /// hide loading indicator
    func hideLoading()

    /// called when no error handler can handle the exception
    func onHandleErrorFailed(error: Error)
}