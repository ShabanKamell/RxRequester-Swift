//
// Created by mac on 11/20/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation
import RxRequester

extension ErrorProcessor: AlamofireErrorProcessor {
    public func handle(alamofireError: Error) -> Bool {
        false
    }
}
