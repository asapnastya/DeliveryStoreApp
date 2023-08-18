//
//  MainViewController.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import UIKit

// MARK: - MainViewController
protocol MainViewController: AnyObject {
    
}

// MARK: - MainViewControllerImpl
class MainViewControllerImpl: UIViewController {
    
    var presenter: MainPresenter?
    
    private lazy var layoutManager = MainLayoutManager()
        
// MARK: - UI
    private lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout.init()
        )
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        setupLayout()
        setupCollectionView()
    
    }
    
// MARK: - Register Cells
    private func registerCells() {
        collectionView.register(
            StoriesCell.self,
            forCellWithReuseIdentifier: StoriesCell.cellIdentifier
        )
        
        collectionView.register(
            BannerCell.self,
            forCellWithReuseIdentifier: BannerCell.cellIdentifier
        )
        
        collectionView.register(
            LoyaltyCell.self,
            forCellWithReuseIdentifier: LoyaltyCell.cellIdentifier
        )
        
        collectionView.register(
            SmallBannerCell.self,
            forCellWithReuseIdentifier: SmallBannerCell.cellIdentifier
        )
        
        collectionView.register(
            RecomendationCell.self,
            forCellWithReuseIdentifier: RecomendationCell.cellIdentifier
        )
        
        collectionView.register(
            RecomendationHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: RecomendationHeaderCell.cellIdentifier
        )
    }
    
// MARK: - setupCollectionView
    private func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            self.layoutManager.createLayout(forSection: sectionIndex, collectionView: self.collectionView)
            
        }
        
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
// MARK: - Setup Layout
    private func setupLayout(){
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
// MARK: - UICollectionViewDataSource && UICollectionViewDelegate
extension MainViewControllerImpl: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return storiesMockData.count
            
        case 1 :
            return horizontalBigBannersMockData.count
            
        case 2 :
            return loyaltyModelMockData.count
            
        case 3:
            return smallBannerMockData.count
            
        case 4:
            return recomendationsMockData.count
            
        case 5:
            return sweetOffersMockData.count
            
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoriesCell.cellIdentifier,
                for: indexPath) as? StoriesCell
            else { return UICollectionViewCell() }
            
            cell.model = storiesMockData[indexPath.row]
            return cell
            
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.cellIdentifier,
                for: indexPath) as? BannerCell
            else { return UICollectionViewCell() }
            
            cell.model = horizontalBigBannersMockData[indexPath.row]
            return cell
            
        case 2 :
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LoyaltyCell.cellIdentifier,
                for: indexPath) as? LoyaltyCell
            else { return UICollectionViewCell() }
            
            cell.model = loyaltyModelMockData[indexPath.row]
            return cell
            
        case 3 :
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SmallBannerCell.cellIdentifier,
                for: indexPath) as? SmallBannerCell
            else { return UICollectionViewCell() }
            
            cell.model = smallBannerMockData[indexPath.row]
            return cell
            
        case 4 :
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecomendationCell.cellIdentifier,
                for: indexPath) as? RecomendationCell
            else { return UICollectionViewCell() }
            
            cell.model = recomendationsMockData[indexPath.row]
            return cell
            
        case 5 :
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecomendationCell.cellIdentifier,
                for: indexPath) as? RecomendationCell
            else { return UICollectionViewCell() }
            
            cell.model = sweetOffersMockData[indexPath.row]
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: RecomendationHeaderCell.cellIdentifier,
                for: indexPath) as? RecomendationHeaderCell
            else { return UICollectionReusableView() }
            
            headerView.backgroundColor = UIColor.clear
            
            switch indexPath.section {
            case 4:
                headerView.setTitle(title: "Рекомендуем")
                
            case 5:
                headerView.setTitle(title: "Сладкое настроение")
                
            default: break
            }
            
            return headerView
            
        default:
           return UICollectionReusableView()
        }
    }
}
