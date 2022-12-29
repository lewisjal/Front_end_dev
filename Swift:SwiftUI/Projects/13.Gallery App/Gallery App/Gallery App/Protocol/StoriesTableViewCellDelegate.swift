//
//  StoriesTableViewCellDelegate.swift
//  Gallery App
//
//  Created by M_955328 on 3/15/22.
//

import Foundation
protocol StoriesTableViewCellDelegate: AnyObject {
    func didClick(cell: StoriesTableViewCell)
}
