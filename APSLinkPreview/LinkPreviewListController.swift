//
//  LinkPreviewListController.swift
//  APSLinkPreview
//
//  Created by Zoheb Ahmed on 14/05/20.
//  Copyright © 2020 Amrendra. All rights reserved.
//

import UIKit

public class LinkPreviewListController: UIViewController {
    
    
    let links = ["https://www.apple.com/in/", "https://www.youtube.com/watch?v=M3BM9TB-8yA", "https://www.nytimes.com/2020/05/14/us/politics/pennsylvania-tom-wolf-coronavirus.html", "https://www.youtube.com/watch?v=M4n7u0txGDM"]
    
    @IBOutlet weak var tableView: UITableView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "LinkPresentation"
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LinkPreviewCell.self, forCellReuseIdentifier: LinkPreviewCell.reuseIdentifier)
        tableView.separatorStyle = .none
    }
}


extension LinkPreviewListController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return LinkPreviewCell(reuseIdentifier: LinkPreviewCell.reuseIdentifier, url: links[indexPath.item])
    }
}


extension LinkPreviewListController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
