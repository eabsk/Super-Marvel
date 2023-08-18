//  ToastView.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 18/08/2023.
//

import UIKit

class ToastView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: Properties
    var viewHeight: CGFloat {
        let textString = (errorLabel.text ?? "") as NSString
        let textAttributes: [NSAttributedString.Key: Any] = [.font: errorLabel.font ?? .boldSystemFont(ofSize: 17)]
        let estimatedTextHeight = textString.boundingRect(with: CGSize(width: 320, height: 2_000),
                                                          options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil).height
        let height = estimatedTextHeight + 16
        return height
        
    }
    
    // MARK: Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ToastView", owner: self, options: nil)
        addSubview(contentView)
        addBlurView()
        errorLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        contentView.frame = self.bounds
    }
    
    // MARK: - add blur effect to the background
    private func addBlurView() {
        if #available(iOS 13.0, *) {
            let blurEffect = UIBlurEffect(style: .systemMaterialDark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = contentView.bounds
            blurEffectView.alpha = 0.9
            contentView.addSubview(blurEffectView)
        } else {
            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = contentView.bounds
            blurEffectView.alpha = 1
            contentView.addSubview(blurEffectView)
        }
        
        contentView.addSubview(errorLabel)
    }
}
