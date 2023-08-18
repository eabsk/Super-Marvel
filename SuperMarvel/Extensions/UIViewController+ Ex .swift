import UIKit

extension UIViewController {
   
    func getCharactersCellSize() -> CGSize {
        let insetsWidth: CGFloat = Configurations.insetsWidth
        let horizontalItemCount: CGFloat = 2
        let verticalItemCount: CGFloat = 3
        let insetsSpaces: CGFloat = insetsWidth * 3
        let width = (view.frame.size.width - insetsSpaces) / horizontalItemCount
        let height = view.frame.size.height / verticalItemCount
        return CGSize(width: width, height: height)
    }
}
