
import UIKit

class FirstPageVC: UIViewController {
    
    @IBOutlet weak var redCircle: UIImageView!
    @IBOutlet weak var blueCircle: UIImageView!
    
    @IBOutlet weak var purpleTriangle: UIImageView!
    @IBOutlet weak var blackTriangle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redCircle.isUserInteractionEnabled = true
        addTapRedCircle()

        blueCircle.isUserInteractionEnabled = true
        addSwipeBlueCircle()
        
        purpleTriangle.isUserInteractionEnabled = true
        addTapPurpleTriangle()
        
        blackTriangle.isUserInteractionEnabled = true
        addSwipeBlackTriangle()
    }
    
    
    // MARK: added gestures to circles

    //funciotn to go to second page
    func goToSecondPage() {
        let goToSecondPage = storyboard?.instantiateViewController(withIdentifier: "SecondPageVC") as? SecondPageVC
        self.navigationController?.pushViewController(goToSecondPage!, animated: true)
    }
    
    //adding tap action to red circle
    func addTapRedCircle() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RedCircleTapAction))
        redCircle.addGestureRecognizer(tapGesture)
    }
    @objc func RedCircleTapAction() {
        goToSecondPage()
    }
    
    //adding tap action to blue circle
    func addSwipeBlueCircle() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(BlueCircleSwipeAction(gesture:)))
        swipeRight.direction = .right
        blueCircle.addGestureRecognizer(swipeRight)
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(BlueCircleSwipeAction(gesture:)))
        swipeleft.direction = .left
        blueCircle.addGestureRecognizer(swipeleft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(BlueCircleSwipeAction(gesture:)))
        swipeUp.direction = .up
        blueCircle.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(BlueCircleSwipeAction(gesture:)))
        swipeDown.direction = .down
        blueCircle.addGestureRecognizer(swipeDown)
    }
    
    //ratomgac marto marjvniv gadadis da vso ???
    @objc func BlueCircleSwipeAction(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up :
            alertMassege()
        case .down :
            alertMassege()
        case .left :
            alertMassege()
        case .right :
            goToSecondPage()
        default:
            print("Unreconized patern of swipes I guess ?")
        }
    }
    
    //adding tap action to purple triangle
    func addTapPurpleTriangle() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PurpleTriangleTapAction))
        purpleTriangle.addGestureRecognizer(tapGesture)
    }
    
    @objc func PurpleTriangleTapAction() {
        goToSecondPage()
    }
    
    //adding tap action to black triangle
    func addSwipeBlackTriangle() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(blackTriangleSwipeAction(gesture:)))
        swipeRight.direction = .right
        blackTriangle.addGestureRecognizer(swipeRight)
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(blackTriangleSwipeAction(gesture:)))
        swipeleft.direction = .left
        blackTriangle.addGestureRecognizer(swipeleft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(blackTriangleSwipeAction(gesture:)))
        swipeUp.direction = .up
        blackTriangle.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(blackTriangleSwipeAction(gesture:)))
        swipeDown.direction = .down
        blackTriangle.addGestureRecognizer(swipeDown)
    }
    
    //ratomgac marto marjvniv gadadis da vso ???
    @objc func blackTriangleSwipeAction(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up :
            alertMassege()
        case .down :
            goToSecondPage()
        case .left :
            alertMassege()
        case .right :
            alertMassege()
        default:
            print("Unreconized patern of swipes I guess ?")
        }
    }


    
    // MARK: alert for wrong swipe location
    func alertMassege() {
        let alertMessage = UIAlertController(title: "Incorrect Direction", message: "Wrong swipe direction, please use correct one", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil)
        alertMessage.addAction(okAction)
        self.present(alertMessage, animated: true)
        return
    }
    
}

