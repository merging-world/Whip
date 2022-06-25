//
//  Tip.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/25.
//

struct Tip: Hashable {
    let title: String
}

struct TipContent: Hashable {
    var title: String
    var image: String?
    var desc: String?
}
