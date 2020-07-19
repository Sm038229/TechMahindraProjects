//
//  TechTableViewCell.swift
//  TechDemo
//
//  Created by SachchidaNand Mishra on 19/07/20.
//  Copyright © 2020 Sachchida Nand Mishra. All rights reserved.
//

import UIKit
import SDWebImage

class TechTableViewCell: UITableViewCell {

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        return stackView
    }()
    //
    let cellHeadingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        return label
    }()
    //
    let cellPhotoImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    //
    let cellDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        
        verticalStackView.addArrangedSubview(cellHeadingLabel)
        verticalStackView.addArrangedSubview(cellPhotoImageView)
        verticalStackView.addArrangedSubview(cellDescriptionLabel)
        self.addSubview(verticalStackView)
        setupStackviewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(from responseResult:ResponseDataResult) {
        cellHeadingLabel.text = responseResult.resultTitle
        let imageURL = responseResult.resultImageURL
        cellPhotoImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "blog"))
        cellDescriptionLabel.text = responseResult.resultDescription
    }
    
    
    private func setupStackviewLayout() {
        verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }

}
