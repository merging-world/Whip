//
//  Tip.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/25.
//

struct Tip: Hashable {
    let title: String
    let detailTitle: String
    let desc: String
    let type: Int // 0 - 당근, 1 - 채찍
    var content: [TipContent]?
    var link: String?
    var linkTitle: String?
}

struct TipContent: Hashable {
    var title: String
    var image: String?
    var desc: String?
    var type: Int // 0 - 바로가기, 1 - 당근 금액, 2 - 채찍 금액
    var link: String?
}
