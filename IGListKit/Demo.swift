//
//  DemoViewController.swift
//  IGListKitTest
//
//  Created by Thongpak on 3/19/2560 BE.
//  Copyright © 2560 Thongpak. All rights reserved.
//

import UIKit
import IGListKit

class DemoItem: NSObject {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
}

extension DemoItem: IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return name as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object { return true }
        guard (object as? DemoItem) != nil else { return false }
        return false
    }
    
}

final class DemoSectionController: IGListSectionController, IGListSectionType {
    
    var object: DemoItem?
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
//        let cell = collectionContext!.dequeueReusableCell(of: DemoCollectionViewCell.self, for: self, at: index) as! DemoCollectionViewCell
        let cell = collectionContext?.dequeueReusableCell(withNibName: "DemoCollectionViewCell", bundle: nil, for: self, at: index) as! DemoCollectionViewCell
        cell.label.text = object?.name
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = object as? DemoItem
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
}
