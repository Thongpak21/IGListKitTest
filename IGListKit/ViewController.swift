//
//  ViewController.swift
//  IGListKit
//
//  Created by Thongpak on 3/19/2560 BE.
//  Copyright © 2560 Thongpak. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController, IGListAdapterDataSource {
//    @IBOutlet weak var collectionView: IGListCollectionView!
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
//        UINib(nibName: "", bundle: "")
        collectionView.register(UINib(nibName:"DemoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DemoCollectionViewCell")
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    let demos: [DemoItem] = [
        DemoItem(name: "Tail Loading"),
        DemoItem(name: "Search Autocomplete")
    ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return demos
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return DemoSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }

}

