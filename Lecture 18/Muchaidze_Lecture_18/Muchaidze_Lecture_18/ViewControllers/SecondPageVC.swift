
import UIKit

class SecondPageVC: UIViewController {
    
    @IBOutlet weak var imageTest: UIImageView!
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTest.isUserInteractionEnabled = true
        imageTest.isHidden = false

        //ratomgac yvela ertad ver mushaobs kargad ?????
//        lessThenOneSec()
//        moreThenOneSec()
        
        addPinch()

        imageTest.addGestureRecognizer(addSwipe(direction: .up))
        imageTest.addGestureRecognizer(addSwipe(direction: .down))
        imageTest.addGestureRecognizer(addSwipe(direction: .left))
        imageTest.addGestureRecognizer(addSwipe(direction: .right))
        
    }


    // MARK: added gestures to image

    //funciotn to go to first page
    func goToStartingPage() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    
    //add long hold function when hold less then 1 sec it goes to starting page
    func lessThenOneSec() {
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(hanglingShortPress))
//        tapGesture.minimumPressDuration = 0.5
        tapGesture.delaysTouchesBegan = true
        imageTest.addGestureRecognizer(tapGesture)
    }
    
    @objc func hanglingShortPress() {
        goToStartingPage()
    }
    
    //add long hold function when hold more then 1 sec it goes to starting page
    func moreThenOneSec() {
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(hanglingLongPress))
//        tapGesture.minimumPressDuration = 3
        tapGesture.delaysTouchesBegan = true
        imageTest.addGestureRecognizer(tapGesture)
    }
    
    @objc func hanglingLongPress() {
        UIImageView.animate(withDuration: 1, delay: 0.5, options: UIImageView.AnimationOptions.transitionCurlUp) {
            self.imageTest.alpha = 0
        } completion: { finished in
            self.imageTest.isHidden = true
        }
    }
    
    //add swipe funcionality to image
    func addPinch() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched(gesture:)))
        imageTest.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinched(gesture: UIPinchGestureRecognizer) {
        gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
        gesture.scale = 1

        if gesture.state == .began || gesture.state == .changed {
            print(gesture.scale)
        } else if gesture.state == .ended {
            self.imageTest.transform = CGAffineTransform.identity
            
            let information = ["color": UIColor.gray]
            NotificationCenter.default.post(name: Notification.Name("ge.Muchaidze-Lecture-18.colorChange"), object: 5, userInfo: information)
        }
    }
    
    
    //add swipe gesture to image
    func addSwipe(direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe(gesture:)))
        swipeGesture.direction = direction
        return swipeGesture
    }
    
    @objc func swipe(gesture: UISwipeGestureRecognizer) {
        var imgFrame = imageTest.frame
        
        switch gesture.direction {
        case .up :
            imgFrame.origin.y -= 50
        case .down :
            imgFrame.origin.y += 50
        case .left :
            imgFrame.origin.x -= 50
        case .right :
            imgFrame.origin.x += 50
        default:
            break
        }
        UIView.animate(withDuration: 0.5) {
            self.imageTest.frame = imgFrame
        }
        
    }
    
    
        
}
