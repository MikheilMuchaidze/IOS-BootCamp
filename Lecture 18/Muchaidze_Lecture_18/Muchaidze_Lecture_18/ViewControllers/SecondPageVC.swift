
import UIKit

class SecondPageVC: UIViewController {
    
    @IBOutlet weak var imageTest: UIImageView!
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTest.isUserInteractionEnabled = true
        
        lessThenOneSec()
        moreThenOneSec()
        
        imageTest.isHidden = false
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
        
}
