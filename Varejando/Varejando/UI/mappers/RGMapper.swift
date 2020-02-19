//
//  UIMapper.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class RGMapper {
    class func parse(from products: ProductsEntity) -> [ProductsListItemViewModel] {
        var prods: [ProductsListItemViewModel] = []
        products.products?.forEach({ product in
            prods.append(parse(from: product))
        })
        return prods
    }
    
    class func parse(from product: ProductEntity) -> ProductsListItemViewModel {
        return ProductsListItemViewModel(title: product.name,
                                         image: product.image, previousPrice: product.price?.previousPrice,
                                         currentPrice: product.price?.currentPrice,
                                         installment: product.price?.paymentPlan,
                                         rating: product.rating)
    }
    
    class func parse(from product: ProductSimpleEntity) -> ProductsListItemViewModel {
        return ProductsListItemViewModel(title: product.name,
                                         image: product.image,
                                         previousPrice: product.previousPrice,
                                         currentPrice: product.currentPrice,
                                         installment: product.installment,
                                         rating: product.rating)
    }
    
    class func parse(from product: ProductDetailEntity) -> ProductDetailsViewModel {
        var images: [String] = []
        product.model?.productModel?.images?.forEach({ image in
            if let url = image.url {
                images.append(url)
            }
        })
        
        var services: [ServiceViewModel] = []
        product.model?.productModel?.services?.forEach({ service in
            services.append(parse(from: service))
        })
        
        var shopkeepers: [ShopkeeperViewModel] = []
        
        if let shops = product.model?.productModel?.marketplace?.featuredShopkeepers {
            shops.forEach({ shop in
                shopkeepers.append(ShopkeeperViewModel(id: shop.id,
                                                       name: shop.name,
                                                       price: shop.price,
                                                       quicklyWithdraw: shop.quicklyWithdraw,
                                                       onlineShop: shop.buyOnline,
                                                       elected: shop.quicklyWithdraw,
                                                       featuredShopkeepers: nil))
            })
        }
        let marketplace = product.model?.productModel?.marketplace
        let shopkeeper = ShopkeeperViewModel(id:
            marketplace?.shopkeeperDefault?.id,
                                             name: marketplace?.shopkeeperDefault?.name,
                                             price: marketplace?.shopkeeperDefault?.price,
                                             quicklyWithdraw: marketplace?.shopkeeperDefault?.quicklyWithdraw,
                                             onlineShop: marketplace?.shopkeeperDefault?.buyOnline,
                                             elected: marketplace?.shopkeeperDefault?.elected,
                                             featuredShopkeepers: shopkeepers)
        
        return ProductDetailsViewModel(title: product.model?.productModel?.name,
                                       descrption: product.description,
                                       images: images,
                                       sku: product.model?.productModel?.sku,
                                       previousPrice: product.model?.productModel?.price?.previousPrice,
                                       currentPrice: product.model?.productModel?.price?.currentPrice,
                                       installment: product.model?.productModel?.price?.paymentPlan,
                                       percentDiscount: product.model?.productModel?.price?.discountPercent,
                                       services: services, shopkeeper: shopkeeper)
    }
    
    class func parse(from service: ServicesEntity) -> ServiceViewModel {
        
        return ServiceViewModel(name: service.name,
                                sku: service.sku,
                                idShopkeeper: service.idShopkeeper,
                                price: service.price,
                                installment: service.installment,
                                type: service.type)
    }
    
    class func parse(from product: ProductDetailsViewModel) -> PriceViewModel {
        return PriceViewModel(previousPrice: product.previousPrice,
                              currentPrice: product.currentPrice,
                              percentDiscount: product.percentDiscount,
                              installment: product.installment)
    }
    
    class func parse(from rating: RatingEntity) -> RatingViewModel {
        
        var opinions: [OpinionViewModel] = []
        rating.opinions?.forEach { opinion in
            opinions.append(parse(from: opinion))
        }
        
        return RatingViewModel(rating: rating.rating, count: rating.count, opinions: opinions)
    }
    
    class func parse(from opinion: OpinionEntity) -> OpinionViewModel {
        
        var mediaGalery: [MediaGaleryViewModel] = []
        opinion.mediaGalery?.forEach({ media in
            mediaGalery.append(RGMapper.parse(from: media))
        })
        
        return OpinionViewModel(client: opinion.client,
                                date: opinion.date,
                                comment: opinion.comment,
                                note: opinion.note,
                                title: opinion.title,
                                generalAvaliation: opinion.generalAvaliation,
                                stateAvaliation: opinion.stateAvaliation,
                                like: opinion.like,
                                dislike: opinion.dislike,
                                mediaGalery: mediaGalery,
                                idReview: opinion.idReview,
                                descriptionNote: opinion.descriptionNote,
                                cityAvaliation: opinion.cityAvaliation)
    }
    
    class func parse(from media: MediaGaleryEnity) -> MediaGaleryViewModel {
        return MediaGaleryViewModel(type: media.type, link: media.link)
    }
}
