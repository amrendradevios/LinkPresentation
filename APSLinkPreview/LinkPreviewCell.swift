//
//  LinkPreviewCell.swift
//  APSLinkPreview
//
//  Created by Zoheb Ahmed on 14/05/20.
//  Copyright © 2020 Amrendra. All rights reserved.
//

import UIKit
import LinkPresentation

public class LinkPreviewCell: UITableViewCell {


    static var reuseIdentifier: String {
        return String(describing: self)
    }

   var linkPreview: LPLinkView?

    let dataProvider = LPMetadataProvider()

    fileprivate var url: String!

    public init(reuseIdentifier: String?, url: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        self.url = url
        fetchMetaData()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    fileprivate func fetchMetaData() {
        guard let URL = URL(string: url) else {
            return
        }
        dataProvider.startFetchingMetadata(for: URL) { [weak self] (metaData, error) in
            self?.setMetaData(data: metaData)
        }
    }

    fileprivate func setMetaData(data: LPLinkMetadata?) {

        guard let metaData = data else {
            return
        }
        DispatchQueue.main.async {
            self.linkPreview = LPLinkView(metadata: metaData)
            self.linkPreview!.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(self.linkPreview!)

            self.linkPreview!.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
            self.linkPreview!.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 0).isActive = true
            self.linkPreview!.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor , constant: 0).isActive = true
            self.linkPreview!.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
            self.contentView.layoutIfNeeded()
        }
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        linkPreview = nil
    }
}
