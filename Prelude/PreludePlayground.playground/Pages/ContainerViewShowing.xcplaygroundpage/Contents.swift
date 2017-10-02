//: [Previous](@previous)
/*:
 # ContainerViewShowing
 */
import UIKit
import XCPlayground
import PlaygroundSupport
import Prelude

class ParentViewController: UIViewController, ContainerViewShowing {
    
    var containerView: UIView!
    private var childViewController = ChildViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        containerView = UIView(frame: CGRect(x: 50, y: 50, width: 275, height: 567))
        self.view.addSubview(containerView)
    }
    
    func addSampleChildViewController() {
        addChildViewController(childViewController, to: containerView)
    }
    
    func removeSampleChildViewController() {
        removeChildViewController(childViewController)
    }
}

class ChildViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 275, height: 567))
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Child View Controller"
        self.view.addSubview(label)
    }
}

let parentViewController = ParentViewController()
PlaygroundPage.current.liveView = parentViewController

parentViewController.addSampleChildViewController()
//parentViewController.removeSampleChildViewController()

//: [Next](@next)
