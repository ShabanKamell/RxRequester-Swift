//
// Created by mac on 11/20/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import RxRequester
import Moya

extension ErrorProcessor: MoyaErrorProcessor {

    public func handle(error: Error, presentable: Presentable?) -> Bool {
        guard let moyaError = error as? MoyaError else { return false }

        switch moyaError {

        case .statusCode:
            return handle(statusCode: moyaError, presentable: presentable)

        case .underlying(let error, let response):
            return handle(underlyingError: error, response: response, presentable: presentable)

        default:
            return handle(error: moyaError, presentable: presentable)
        }
    }

    private func handle(statusCode: MoyaError, presentable: Presentable?) -> Bool {
        let handler: MoyaStatusCodeHandler? = MoyaHandlers.statusCodeHandlers.first(where: {
            $0.canHandle(error: statusCode)
        })
        guard handler != nil else { return false }
        handler!.handle(error: statusCode, presentable: presentable)
        return true
    }

    private func handle(underlyingError: Swift.Error, response: Response?, presentable: Presentable?) -> Bool {
        let handler: MoyaUnderlyingErrorHandler? = MoyaHandlers.underlyingErrorHandlers.first(where: {
            $0.canHandle(error: underlyingError, response: response)
        })
        guard handler != nil else { return false }
        handler!.handle(error: underlyingError, response: response, presentable: presentable)
        return true
    }

    private func handle(error: MoyaError, presentable: Presentable?) -> Bool {
        let handler: MoyaErrorHandler? = MoyaHandlers.errorHandlers.first(where: {
            $0.canHandle(error: error)
        })
        guard handler != nil else { return false }
        handler!.handle(error: error, presentable: presentable)
        return true
    }
}

