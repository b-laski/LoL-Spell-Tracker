//
//  ViewController.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 10/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let summonerViewModel = SummonerViewModel()
    let spectatorViewModel = SpectatorViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchUI()
    }
    
    private func fetchUI() {
        let dispatchQueue = DispatchQueue.global(qos: .background)
        let dispatchSemapthore = DispatchSemaphore(value: 0)
        
        dispatchQueue.async { [weak self] in
            self?.summonerViewModel.getSummoner("Mrowa1020") { (error) in
                if let error = error {
                    print(error.response?.toErrorModel()?.message)
                    dispatchSemapthore.signal()
                    return
                }
                
                dispatchSemapthore.signal()
            }
            
            dispatchSemapthore.wait()
            
            guard let summonerId = self?.summonerViewModel.summoner?.id else { return }
            self?.spectatorViewModel.getSpectatorInfo(summonerId, complete: { (error) in
                if let error = error {
                    print(error.response?.toErrorModel()?.message)
                    dispatchSemapthore.signal()
                    return
                }
                
                dispatchSemapthore.signal()
            })
            
            dispatchSemapthore.wait()
        }
    }
}

