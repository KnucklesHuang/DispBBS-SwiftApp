//
//  MainViewController.swift
//  DispBBS
//
//  Created by knuckles on 2017/4/10.
//  Copyright © 2017年 Disp. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var hotTextButton: UIButton!
    @IBOutlet weak var boardListButton: UIButton!
    lazy var orderedTabButtons: [UIButton] = {
        [self.hotTextButton, self.boardListButton]
    }()
    var selectedTabIndex: Int! = 0
    
    var mainPageViewController: MainPageViewController!
    
    func changeTab(byIndex index: Int) {
        guard index >= 0 && index < orderedTabButtons.count else { return }
        let selectedButton = orderedTabButtons[self.selectedTabIndex]
        let newButton = orderedTabButtons[index]
        let linkColor = newButton.currentTitleColor
        selectedButton.backgroundColor = UIColor.black
        selectedButton.setTitleColor(linkColor, for: .normal)
        
        newButton.backgroundColor = UIColor.lightGray
        newButton.setTitleColor(UIColor.black, for: .normal)

        self.selectedTabIndex = index
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerViewSegue" {
            mainPageViewController = segue.destination as! MainPageViewController
            mainPageViewController.mainViewController = self
        }
    }

    @IBAction func showHotText(_ sender: Any) {
        changeTab(byIndex: 0)
        mainPageViewController.showPage(byIndex: 0)
    }
    @IBAction func showBoardList(_ sender: Any) {
        changeTab(byIndex: 1)
        mainPageViewController.showPage(byIndex: 1)
    }
    
    @IBAction func refresh(_ sender: Any) {
        switch(self.selectedTabIndex){
        case 0: mainPageViewController.hotTextViewController.loadData()
        case 1: mainPageViewController.boardListViewController.loadData()
        default: return
        }
    }
    

}


