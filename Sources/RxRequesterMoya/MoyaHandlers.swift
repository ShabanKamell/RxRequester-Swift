//
// Created by mac on 11/22/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public class MoyaHandlers {
    /// set handlers for status code errors
    public static var statusCodeHandlers: Array<MoyaStatusCodeHandler> = []

    /// set handlers for underlying errors
    public static var underlyingErrorHandlers: Array<MoyaUnderlyingErrorHandler> = []

    /// set handlers for errors
    public static var errorHandlers: Array<MoyaErrorHandler> = []
}