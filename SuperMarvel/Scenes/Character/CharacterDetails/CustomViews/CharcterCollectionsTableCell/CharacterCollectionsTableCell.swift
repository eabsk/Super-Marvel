import UIKit

protocol CharacterCollectionsTableCellProtocol: AnyObject {
    var comics: [ComicsItem] { get set }
    var series: [ComicsItem] { get set }
    var stories: [StoriesItem] { get set }
}

class CharacterCollectionsTableCell: UITableViewCell, CharacterCollectionsTableCellProtocol {
    
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var collectionViews: [UICollectionView]!
    @IBOutlet var stackViews: [UIStackView]!
    @IBOutlet var stackViewsHeight: [NSLayoutConstraint]!
    
    var comics: [ComicsItem] = [] {
        didSet {
            let isComicEmpty = comics.isEmpty
            titleLabels[0].text = L10n.CharacterStr.comics() + "(\(comics.count))"
            stackViewsHeight[0].constant = isComicEmpty ? 0 : 80
            collectionViews[0].reloadData()
        }
    }
    
    var series: [ComicsItem] = [] {
        didSet {
            let isSeriesEmpty = series.isEmpty
            titleLabels[1].text = L10n.CharacterStr.series() + "(\(series.count))"
            stackViewsHeight[1].constant = isSeriesEmpty ? 0 : 80
            collectionViews[1].reloadData()
        }
    }
    
    var stories: [StoriesItem] = [] {
        didSet {
            let isStoriesEmpty = stories.isEmpty
            titleLabels[2].text = L10n.CharacterStr.stories() + "(\(stories.count))"
            stackViewsHeight[2].constant = isStoriesEmpty ? 0 : 80
            collectionViews[2].reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionViews.lazy.forEach { collectionView in
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.registerNib(cellClass: TagCollectionViewCell.self)
        }
    }
}

extension CharacterCollectionsTableCell: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViews[0]: return comics.count
        case collectionViews[1]: return stories.count
        case collectionViews[2]: return series.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case collectionViews[0]:
            let cell = collectionView.dequeue(indexPath: indexPath) as TagCollectionViewCell
            cell.tileLabel.text = comics[indexPath.row].title
            return cell
        case collectionViews[1]:
            let cell = collectionView.dequeue(indexPath: indexPath) as TagCollectionViewCell
            cell.tileLabel.text = stories[indexPath.row].title
            return cell
        case collectionViews[2]:
            let cell = collectionView.dequeue(indexPath: indexPath) as TagCollectionViewCell
            cell.tileLabel.text = series[indexPath.row].title
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch collectionView {
        case collectionViews[0]:
            return getTagWidth(title: comics[indexPath.row].title)
        case collectionViews[1]:
            return getTagWidth(title: stories[indexPath.row].title)
        case collectionViews[2]:
            return getTagWidth(title: series[indexPath.row].title)
        default: return .init()
        }
    }
    
    private func getTagWidth(title: String) -> CGSize {
        let textString = title as NSString
        let textAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14)]
        let estimatedTextWidth = textString.boundingRect(with: CGSize(width: 2_000, height: 2_000),
                                                         options: .usesLineFragmentOrigin,
                                                         attributes: textAttributes, context: nil).width
        let width = estimatedTextWidth + 36

        return .init(width: width, height: 40)
    }
}
