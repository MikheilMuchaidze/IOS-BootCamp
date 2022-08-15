import Foundation
import UIKit

//alert popup function for all UIViewControllers presented and created
extension UIViewController {
    func alertPopUp(title: String, message: String, okTitle: String) {
        let alertmassege = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: okTitle, style: UIAlertAction.Style.default, handler: nil)
        alertmassege.addAction(okAction)
        self.present(alertmassege, animated: true)
    }
    
}


//animations
extension UIViewController {
    //animation to make appearing of backgound circles after view is loaded
    func animateBackgroundCircles(image: UIImageView, time: Double) {
        image.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + time ) {
            
            //sets the view's scaling to be 120%
            image.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            
            //animate the affect
            UIView.animate(withDuration: 0.3, animations: {
                image.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                image.isHidden = false
            })
        }
    }
    
    //animate in a specific view
    func animateIn(desiredView: UIView) {
        let backgroundView = self.view!
        
        //attach our desired view to the screen (self.view/backgroundView)
        backgroundView.addSubview(desiredView)
        
        //sets the view's scaling to be 120%
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        //animate the affect
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    //animate out a specified view
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
}

//rounding and getting border details for txt fields
extension UIView {
    //adding corner radius for textfields
    func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    //adding border width and color for textfields
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
