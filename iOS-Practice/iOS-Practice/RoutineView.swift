//
//  RoutineView.swift
//  iOS-Practice
//
//  Created by Woo Jye Lee on 1/2/24.
//

import UIKit

import SnapKit

final class RoutineView: UIView {

    // MARK: - Properties
    
    
    // MARK: - UI Components
    let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 315, height: 94)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RoutineView {

    func setUI() {
        self.backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(collectionView)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setAddTarget() {

    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        RoutineCollectionViewCell.register(target: collectionView)
    }
    
    func setDataBind() {
        
    }
}
