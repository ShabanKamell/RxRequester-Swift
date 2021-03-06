//
// Created by mac on 11/16/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import RxSwift

/// Provide schedulers to be used in each request
/// The schedulers provided by RequestOptions will override these schedulers
public protocol SchedulerProvider {
    var observeOn: ImmediateSchedulerType { get }
    var subscribeOn: ImmediateSchedulerType { get }
}

/// Default schedulers
public class DefSchedulerProvider: SchedulerProvider {
    static let shared = DefSchedulerProvider()

    public var observeOn: ImmediateSchedulerType = MainScheduler.instance
    public var subscribeOn: ImmediateSchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)
}