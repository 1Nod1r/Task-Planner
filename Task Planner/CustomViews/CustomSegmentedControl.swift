//
//  CustomSegmentedControl.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 13/11/22.
//

import UIKit

class CustomSegmentedControl: UISegmentedControl{
    private let segmentInset: CGFloat = 5
    private let segmentImage: UIImage? = UIImage(color: .AppColors.x2FD1C5)

    override func layoutSubviews(){
        super.layoutSubviews()
        layer.cornerRadius = bounds.height/2
//        let foregroundIndex = numberOfSegments
//        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView
//        {
//            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
//            foregroundImageView.image = segmentImage    //substitute with our own colored image
//            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")    //this removes the weird scaling animation!
//            foregroundImageView.layer.masksToBounds = true
//            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height/2
//        }
    }
}
