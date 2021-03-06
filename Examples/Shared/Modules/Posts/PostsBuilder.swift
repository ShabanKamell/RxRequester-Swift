//
// Created by mac on 11/18/19.
// Copyright (c) 2019 CocoaPods. All rights reserved.
//

import UIKit
import RxRequester

struct PostsBuilder {

    static func make(dataSource: PostsDataSource) -> PostsViewController {
        let storyboard = UIStoryboard(name: "Posts", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! PostsViewController
        let repo = PostsRepository(dataSource: dataSource)
        vc.vm = PostsViewModel(rxRequester: RxRequester(presentable: vc), postsRepository: repo)
        return vc
    }

}

