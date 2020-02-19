//
//  DetailViewController.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 16/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    var presenter: ProductDetailsPresenter?
    
    var scrollView: UIScrollView!
    
    var snackView: BuyButtonSnackBar!
    
    var productView: ProductView!
    var priceView: PriceView!
    var servicesView: [ServicesView]!
    var buyButton: BuyButtonView!
    var soldByView: SoldByView!
    var detailView: DetailView!
    var ratingView: RGRating!
    var whoSawAlsoSawView: ListProductView!
    var buyTogetherView: ListProductView!
    var whoSawBoughtView: ListProductView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.setup()
        self.setupScrollView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presenter?.viewDidAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
        
    }
}

extension DetailsViewController {
    private func setup() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func setupScrollView() {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        self.scrollView.delegate = self
        
        self.view.addSubview(self.scrollView)
    }
}

extension DetailsViewController: ProductDetailsPresenterOutput {
    
    func updateUI() {
        guard let display = presenter?.details else { return }
        
        DispatchQueue.main.async {
            self.view.stopActivity()
        }
        
        self.title = display.title
        
        self.productView = ProductView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 391))
        self.productView.backgroundColor = .red
        self.productView.display = display
        self.productView.setup()
        
        let price = RGMapper.parse(from: display)
        self.priceView = PriceView(frame: CGRect(x: 0,
                                                 y: (self.productView.frame.origin.y + self.productView.frame.height),
                                                 width: self.view.frame.width,
                                                 height: 86))
        self.priceView.display = price
        self.priceView.setup()
        
        var lastServiceView: ServicesView!
        if let services = display.services, !services.isEmpty {
            self.servicesView = []
            var y = self.priceView.frame.origin.y + self.priceView.frame.height + 5
            services.forEach({ service in
                let serviceView = ServicesView(frame:
                    CGRect(x: 16,
                           y: y,
                           width: self.view.frame.width - 32,
                           height: 100))
                serviceView.display = service
                serviceView.setup()
                self.servicesView.append(serviceView)
                y += serviceView.frame.origin.y + serviceView.frame.height + 5
            })
            
            if !self.servicesView.isEmpty {
                self.servicesView.forEach({serviceView in
                    self.scrollView.addSubview(serviceView)
                    
                    lastServiceView = serviceView
                })
            }
        }
        
        self.buyButton = BuyButtonView(frame:
            CGRect(x: 0,
                   y: (lastServiceView.frame.origin.y + lastServiceView.frame.height) + 16,
                   width: self.view.frame.width,
                   height: 100))
        self.buyButton.delegate = self
        
        self.snackView = BuyButtonSnackBar(frame:
        CGRect(x: 0,
               y: self.view.frame.height - 100,
               width: self.view.frame.width,
               height: 100))
        self.snackView.delegate = self
        self.snackView.display = price
        
        self.soldByView = SoldByView(frame:
            CGRect(x: 0,
                   y: (self.buyButton.frame.origin.y + self.buyButton.frame.height) + 16,
                   width: self.view.frame.width,
                   height: 190))
        self.soldByView.display = display.shopkeeper
        
        self.detailView = DetailView()
        self.detailView.frame.size.width = self.view.frame.width
        self.detailView.frame.size.height = 300
        self.detailView.frame.origin.x = 0
        self.detailView.frame.origin.y = (self.soldByView.frame.origin.y + self.soldByView.frame.height) + 16
        self.detailView.display = display.descrption
        
        self.ratingView = RGRating(frame:
            CGRect(x: 0,
                   y: (self.detailView.frame.origin.y + self.detailView.frame.height),
                   width: self.view.frame.width,
                   height: 300))
        self.ratingView.display = display.rating
        
        let productsHeight: CGFloat = 460
        self.whoSawAlsoSawView = ListProductView(frame:
            CGRect(x: 0,
                   y: (self.ratingView.frame.origin.y + self.ratingView.frame.height),
                   width: self.view.frame.width,
                   height: productsHeight))
        self.whoSawAlsoSawView.setTitle("Quem viu, viu também")
        self.whoSawAlsoSawView.display = display.whoSawAlsoSawModel
        
        self.whoSawBoughtView = ListProductView(frame:
            CGRect(x: 0,
                   y: (self.whoSawAlsoSawView.frame.origin.y + self.whoSawAlsoSawView.frame.height) + 30,
                   width: self.view.frame.width,
                   height: productsHeight))
        self.whoSawBoughtView.display = display.whoSawBoughtModel
        self.whoSawBoughtView.setTitle("Quem viu, comprou")
        
        self.buyTogetherView = ListProductView(frame:
            CGRect(x: 0,
                   y: (self.whoSawBoughtView.frame.origin.y + self.whoSawBoughtView.frame.height) + 30,
                   width: self.view.frame.width,
                   height: productsHeight))
        self.buyTogetherView.display = display.buyTogetherModel
        self.buyTogetherView.setTitle("Aproveite e compre junto")
        
        self.scrollView.addSubview(self.productView)
        self.scrollView.addSubview(self.priceView)
        self.scrollView.addSubview(self.buyButton)
        self.scrollView.addSubview(self.soldByView)
        self.scrollView.addSubview(self.detailView)
        self.scrollView.addSubview(self.ratingView)
        self.scrollView.addSubview(self.whoSawAlsoSawView)
        self.scrollView.addSubview(self.whoSawBoughtView)
        self.scrollView.addSubview(self.buyTogetherView)
        
        self.scrollView.updateContent()
    }
    
    func presentLoading() {
        DispatchQueue.main.async {
            self.view.presentActivity()
        }
    }
}

extension DetailsViewController: BuyButton {
    func touch() {
        print("Buying...")
    }
}

extension DetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let btn = self.buyButton, let snack = self.snackView else {return}
        if btn.isVisible(btn) {
            snack.removeFromSuperview()
            self.scrollView.frame.size.height = self.view.frame.height
        } else {
            self.view.addSubview(snack)
            self.scrollView.frame.size.height = self.view.frame.height - 100
        }
        self.scrollView.updateContent()
        self.view.layoutIfNeeded()
        self.view.setNeedsLayout()
    }
}
