//
//  RoutineCollectionViewCell.swift
//  iOS-Practice
//
//  Created by Woo Jye Lee on 1/2/24.
//

import UIKit

import SnapKit

final class RoutineCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties

    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "apple.logo")
        return image
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var routineLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var achieveLabel: UILabel = {
        let label = UILabel()
        label.text = "달성완료"
        label.textAlignment = .center
        label.backgroundColor = UIColor.green // 배경색 설정
        label.layer.cornerRadius = 10 // 테두리를 둥글게 만들기 위한 코너 반지름 설정
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RoutineCollectionViewCell {

    func setUI() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.backgroundColor = .white
    }
    
    func setHierarchy() {
        self.addSubviews(imageView, dateLabel, routineLabel, achieveLabel)
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
            $0.size.equalTo(80)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.leading.equalTo(imageView.snp.trailing).offset(21)
        }
        routineLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).inset(4)
            $0.leading.equalTo(dateLabel)
        }
        achieveLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.trailing.equalToSuperview().inset(70)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setDatabind(model: RoutineEntity) {
        self.dateLabel.text = "\(model.dateLabel)일 달성중"
        self.routineLabel.text = model.routineLabel
    }
}
