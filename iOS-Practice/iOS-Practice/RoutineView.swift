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
    var shouldHideFirstView: Bool? { // 상단 세그먼트컨트롤 터치를 감지하는 프로퍼티
      didSet {
        guard let shouldHideFirstView = self.shouldHideFirstView else { return }
        self.collectionView.isHidden = shouldHideFirstView
        self.secondView.isHidden = !self.collectionView.isHidden
      }
    }
    
    // MARK: - UI Components
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["데일리 루틴", "행복 루틴"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .white
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        control.setTitleTextAttributes(titleTextAttributes, for: .normal)
        let titleTextAttributes2 = [NSAttributedString.Key.foregroundColor: UIColor.red]
        control.setTitleTextAttributes(titleTextAttributes2, for: .selected)
        return control
    }()
    
    let secondView: UIView = { // 행복 루틴 페이지
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
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
        self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentedControl)
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
        self.addSubviews(collectionView, segmentedControl, secondView)
    }
    
    func setLayout() {
        segmentedControl.snp.makeConstraints() {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(38)
        }
        collectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview() // 여기서 가리키는 superView는?
            $0.top.equalTo(segmentedControl.snp.bottom)
        }
        secondView.snp.makeConstraints() {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(segmentedControl.snp.bottom)
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
    
    @objc private func didChangeValue(segment: UISegmentedControl) {
      self.shouldHideFirstView = segment.selectedSegmentIndex != 0
    }
}
