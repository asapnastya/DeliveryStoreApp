//
//  MainLayoutManager.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/17/23.
//

import UIKit

final class MainLayoutManager {
    
// MARK: - CreateLayout
    func createLayout(forSection index: Int, collectionView: UICollectionView) -> NSCollectionLayoutSection {
        switch index {
            
        case 0 :
            return self.storiesLayoutSection()
            
        case 1 :
            return self.horizontalBigBannersLayoutSection(collectionView: collectionView)
            
        case 2 :
            return self.singleBannerLayoutSection()
            
        case 3 :
            return self.smallBannerLayoutSection()
            
        case 4,5 :
            return self.recomendationsLayoutSection()
            
        default:
            return self.defaultLayoutSection()
        }
    }
    
// MARK: - DefaultLayoutSection
    private func defaultLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(44),
            heightDimension: .estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(44),
            heightDimension: .estimated(44)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
// MARK: - StoriesSection
    private func storiesLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(105),
            heightDimension: .absolute(105)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(550),
            heightDimension: .absolute(105)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 7
        )
        
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 10,
            leading: 16,
            bottom: .zero,
            trailing: 16
        )
        section.orthogonalScrollingBehavior = .continuous

        return section
    }

    
// MARK: - horizontalBigBannersSection
    private func horizontalBigBannersLayoutSection(collectionView: UICollectionView) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: 8,
            bottom: .zero,
            trailing: 1
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(355),
            heightDimension: .absolute(180)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        group.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: .zero,
            bottom: .zero,
            trailing: 16
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 16,
            bottom: 10,
            trailing: .zero
        )
        
        section.orthogonalScrollingBehavior = .groupPaging
        
        var initialSection = true
        let itemCount = 6
        
        if #available(iOS 15, *) {
        section.visibleItemsInvalidationHandler = { cells, point, _ in
            guard let indexPath = cells.first?.indexPath
            else { return }
            
            if point.x <= .zero, initialSection {
                collectionView.scrollToItem(at: .init(row: 0, section: indexPath.section),
                                                  at: .centeredHorizontally,
                                                  animated: false
                )
                initialSection = false
                return
            }
            
            let tempOffsetY = collectionView.contentOffset.y
            if point.x <= .zero {
                collectionView.scrollToItem(
                    at: .init(row: itemCount - 2, section: indexPath.section),
                    at: .centeredHorizontally,
                    animated: false
                )
                collectionView.contentOffset.y = tempOffsetY
            }
            
            if point.x >= (UIScreen.main.bounds.width - section.interGroupSpacing) * CGFloat(itemCount - 1) - (CGFloat(itemCount) * CGFloat.bannerSpacing) {
                collectionView.scrollToItem(
                    at: .init(row: 1, section: indexPath.section),
                    at: .centeredHorizontally,
                    animated: false
                )
                collectionView.contentOffset.y = tempOffsetY
            }
        }
    }
        return section
    }
    
// MARK: - SingleBannerSection
    private func singleBannerLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: 25,
            bottom: .zero,
            trailing: 16
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(415),
            heightDimension: .absolute(130)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
// MARK: - SmallBannerSection
    private func smallBannerLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: 8,
            bottom: .zero,
            trailing: 8
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(110),
            heightDimension: .absolute(135)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: .zero,
            bottom: .zero,
            trailing: 16
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 16,
            bottom: 10,
            trailing: .zero
        )
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
// MARK: - RecomendationsBanners
    private func recomendationsLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(200)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 8,
            leading: .zero,
            bottom: .zero,
            trailing: .zero
        )
        
        
        let footerHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(55)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .absolute(200)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: .zero,
            bottom: .zero,
            trailing: 16
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 16,
            bottom: 10,
            trailing: .zero
        )
        
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
                                              
        return section
    }
    
}

extension CGFloat {
    
    static let bannerSpacing: CGFloat = 54.66
}
