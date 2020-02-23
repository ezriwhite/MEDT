//
//  ViewController.swift
//  MEDT
//
//  Created by Ezri Laura Oppenheim White on 2/22/20.
//  Copyright © 2020 MECT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundGradientView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a gradient layer.
            let gradientLayer = CAGradientLayer()
            // Set the size of the layer to be equal to size of the display.
            gradientLayer.frame = view.bounds
            // Set an array of Core Graphics colors (.cgColor) to create the gradient.
            // This example uses a Color Literal and a UIColor from RGB values.
            gradientLayer.colors = [#colorLiteral(red: 0.873736918, green: 0.131398946, blue: 0.2227166295, alpha: 1).cgColor, #colorLiteral(red: 0.4694778323, green: 0, blue: 0, alpha: 1).cgColor]
            // Rasterize this static layer to improve app performance.
            gradientLayer.shouldRasterize = true
            // Apply the gradient to the backgroundGradientView.
            backgroundGradientView.layer.addSublayer(gradientLayer)
        
        // Diagonal: top left to bottom corner.
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom right corner.
        
        var shouldAutorotate: Bool {
            return false
        }
        // Do any additional setup after loading the view.
        self.navigationController?.modalPresentationStyle = .overFullScreen
        self.modalPresentationStyle = .fullScreen
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.navigationController?.setViewControllers([LanguageSelectorViewController.viewController()], animated: true)
        }
    }
}

class LanguageSelectorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagePickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagePickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
    
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    @IBOutlet weak var backgroundGradientView: UIView!
    
    var languagePickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a gradient layer.
            let gradientLayer = CAGradientLayer()
            // Set the size of the layer to be equal to size of the display.
            gradientLayer.frame = view.bounds
            // Set an array of Core Graphics colors (.cgColor) to create the gradient.
            // This example uses a Color Literal and a UIColor from RGB values.
            gradientLayer.colors = [#colorLiteral(red: 0.873736918, green: 0.131398946, blue: 0.2227166295, alpha: 1).cgColor, #colorLiteral(red: 0.4694778323, green: 0, blue: 0, alpha: 1).cgColor]
            // Rasterize this static layer to improve app performance.
            gradientLayer.shouldRasterize = true
            // Apply the gradient to the backgroundGradientView.
            backgroundGradientView.layer.addSublayer(gradientLayer)
        
        // Diagonal: top left to bottom corner.
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom right corner.
        
        var shouldAutorotate: Bool {
            return false
        }
        
        // Connect data:
        self.languagePicker.delegate = self
        self.languagePicker.dataSource = self
        // language picker
        languagePickerData = ["English", "Español"]
        
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> LanguageSelectorViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "LanguageSelectorViewController") as! LanguageSelectorViewController
    }
    @IBAction func didPressSelect(_ sender: Any) {
        self.navigationController?.pushViewController(SexSelectorViewController.viewController(), animated: true)
    }
}
    
class SexSelectorViewController: UIViewController {
    
    @IBOutlet weak var backgroundGradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a gradient layer.
            let gradientLayer = CAGradientLayer()
            // Set the size of the layer to be equal to size of the display.
            gradientLayer.frame = view.bounds
            // Set an array of Core Graphics colors (.cgColor) to create the gradient.
            // This example uses a Color Literal and a UIColor from RGB values.
            gradientLayer.colors = [#colorLiteral(red: 0.873736918, green: 0.131398946, blue: 0.2227166295, alpha: 1).cgColor, #colorLiteral(red: 0.4694778323, green: 0, blue: 0, alpha: 1).cgColor]
            // Rasterize this static layer to improve app performance.
            gradientLayer.shouldRasterize = true
            // Apply the gradient to the backgroundGradientView.
            backgroundGradientView.layer.addSublayer(gradientLayer)
        
        // Diagonal: top left to bottom corner.
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom right corner.
        
        var shouldAutorotate: Bool {
            return false
        }
        
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> SexSelectorViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "SexSelectorViewController") as! SexSelectorViewController
    }
    
    @IBAction func didSelectFemale(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleViewController.viewController(), animated: true)
    }
}

class MaleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

class FemaleViewController: UIViewController {
    
    
    static func viewController() -> FemaleViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleViewController") as! FemaleViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func didSelectFront(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleFrontViewController.viewController(), animated: true)
    }

    @IBAction func didSelectBack(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleBackViewController.viewController(), animated: true)
    }
}

class NeutralViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
}

class FemaleFrontViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleFrontViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleFrontViewController") as! FemaleFrontViewController
    }
    @IBAction func didSelectHead(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleHeadViewController.viewController(), animated: true)
    }
    @IBAction func didSelectChest(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleChestViewController.viewController(), animated: true)
    }
    @IBAction func didSelectUpperLeg(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleUpperLegViewController.viewController(), animated: true)
    }
    @IBAction func didSelectLowerLeg(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleLowerLegViewController.viewController(), animated: true)
    }
    @IBAction func didSelectRArm(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleRArmViewController.viewController(), animated: true)
    }
    @IBAction func didSelectLArm(_ sender: Any) {
        self.navigationController?.pushViewController(FemaleLArmViewController.viewController(), animated: true)
    }
}

class FemaleBackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleBackViewController {
           // Create a reference to the the appropriate storyboard
           let storyboard = UIStoryboard(name: "Main", bundle: nil)

           // Instantiate the desired view controller from the storyboard using the view controllers identifier
           // Cast is as the custom view controller type you created in order to access it's properties and methods
           return storyboard.instantiateViewController(withIdentifier: "FemaleBackViewController") as! FemaleBackViewController
       }
}

class FemaleHeadViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleHeadViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleHeadViewController") as! FemaleHeadViewController
    }
    
}

class FemaleRArmViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleRArmViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleRArmViewController") as! FemaleRArmViewController
    }
}

class FemaleChestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleChestViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleChestViewController") as! FemaleChestViewController
    }
}

class FemaleUpperLegViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .overFullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleUpperLegViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleUpperLegViewController") as! FemaleUpperLegViewController
    }
}

class FemaleLowerLegViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .fullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleLowerLegViewController {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleLowerLegViewController") as! FemaleLowerLegViewController
    }
}

class FemaleLArmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .fullScreen
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    static func viewController() -> FemaleLArmViewController{
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        return storyboard.instantiateViewController(withIdentifier: "FemaleLArmViewController") as! FemaleLArmViewController
    }
}
