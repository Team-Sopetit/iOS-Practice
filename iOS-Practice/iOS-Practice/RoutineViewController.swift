//
//  RoutineViewController.swift
//  iOS-Practice
//
//  Created by Woo Jye Lee on 1/2/24.
//

import UIKit
import SnapKit

final class RoutineViewController: UIViewController {
    
    // MARK: - Properties
    
    let dummy = RoutineEntity.routineDummy()
    
    // MARK: - UI Components
    private let routineView = RoutineView()
    private lazy var collectionview = routineView.collectionView
    
    
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = routineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions

extension RoutineViewController {

    func setUI() {
        view.backgroundColor = .white
    }
    
    func setHierarchy() {
    }
    
    func setLayout() {
    }
    
    func setDelegate() {
        collectionview.delegate = self
        collectionview.dataSource = self
    }
}

extension RoutineViewController: UICollectionViewDelegate {
    
}

extension RoutineViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RoutineCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setDatabind(model: dummy[indexPath.item])
        return cell
    }
}
