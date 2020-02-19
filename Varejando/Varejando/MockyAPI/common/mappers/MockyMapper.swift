//
//  MockyMapper.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

public class MockyMapper {
    static func parse(from products: ProductsAPIModel) -> ProductsEntity {
        var productsArr: [ProductEntity] = []
        if let mProducts = products.products {
            mProducts.forEach({item in
                productsArr.append(parse(from: item))
            })
        }
        return ProductsEntity(products: productsArr, count: products.count)
    }
    
    static func parse(from product: ProductAPIModel) -> ProductEntity {
        
        var price: PriceEntity?
        if let mPrice = product.price {
            price = parse(from: mPrice)
        }
        return ProductEntity(id: product.id, sku: product.sku,
                             name: product.name, available: product.available,
                             description: product.description, image: product.image,
                             rating: product.rating, price: price)
    }
    
    static func parse(from price: PriceAPIModel) -> PriceEntity {

        var discountPaymentMethod: PaymentMethodEntity?
        if let mDiscount = price.discountPaymentMethod {
            discountPaymentMethod = parse(from: mDiscount)
        }
        
        return PriceEntity(paymentPlan: price.paymentPlan, installmentsValue: price.installmentsValue,
                           maxInstallmentsCount: price.maxInstallmentsCount, currentPrice: price.currentPrice,
                           previousPrice: price.previousPrice, discountPercent: price.discountPercent,
                           discountPaymentMethod: discountPaymentMethod)
        
    }
    
    static func parse(from product: ProductDetailAPIModel) -> ProductDetailEntity {
        var categories: [CategoryEntity] = []
        if let mCategories = product.categories {
            mCategories.forEach({category in
                categories.append(parse(from: category))
            })
        }
        
        var moreInformations: [InformationEntity] = []
        if let mMoreInformation = product.moreInformations {
            mMoreInformation.forEach({moreInformation in
                moreInformations.append(parse(from: moreInformation))
            })
        }
        var brand: BrandEntity?
        if let mBrand = product.brand {
            brand = parse(from: mBrand)
        }
        
        var model: ModelEntity?
        if let mModel = product.model {
            model = parse(from: mModel)
        }
        
        return ProductDetailEntity(id: product.id, name: product.name,
                                   description: product.description,
                                   withdrawInStore: product.withdrawInStore,
                                   categories: categories, moreInformations: moreInformations,
                                   brand: brand, model: model, video: product.video)
        
    }
    
    static func parse(from model: ModelAPIModel) -> ModelEntity {
        var productModel: ProductModelEntity?
        if let mProd = model.productModel {
            productModel = parse(from: mProd)
        }
        return ModelEntity(skus: model.skus, productModel: productModel)
    }
    
    static func parse(from product: ProductModelAPIModel) -> ProductModelEntity {
        var images: [ImageEntity] = []
        if let mImages = product.images {
            mImages.forEach({image in
                images.append(parse(from: image))
            })
        }
        
        var services: [ServicesEntity] = []
        if let mServices = product.services {
            mServices.forEach({service in
                services.append(parse(from: service))
            })
        }
        var price: PriceEntity?
        if let mPrice = product.price {
            price = parse(from: mPrice)
        }
        var marketplace: MarketplaceEntity?
        if let mMarketplace = product.marketplace {
            marketplace = parse(from: mMarketplace)
        }
        return ProductModelEntity(sku: product.sku, name: product.name,
                                  available: product.available, marketplace: marketplace,
                                  price: price, images: images, services: services)
    }
    
    static func parse(from marketplace: MarketplaceAPIModel) -> MarketplaceEntity {
        var featuredShopkeepers: [ShopkeeperEntity] = []
        if let shopkeepers = marketplace.featuredShopkeepers {
            shopkeepers.forEach({shopkeeper in
                featuredShopkeepers.append(parse(from: shopkeeper))
            })
        }
        
        var shopkeeperefault: ShopkeeperEntity?
        if let mShopkeeper = marketplace.shopkeeperDefault {
            shopkeeperefault = parse(from: mShopkeeper)
        }
        return MarketplaceEntity(biggestPrice: marketplace.biggestPrice,
                                 lowestPrice: marketplace.lowestPrice,
                                 shopkeeperDefault: shopkeeperefault, featuredShopkeepers: featuredShopkeepers)
    }
    
    static func parse(from shopkeeper: ShopkeeperAPIModel) -> ShopkeeperEntity {
        return ShopkeeperEntity(id: shopkeeper.id, name: shopkeeper.name,
                                price: shopkeeper.price, quicklyWithdraw: shopkeeper.quicklyWithdraw,
                                buyOnline: shopkeeper.buyOnline, elected: shopkeeper.elected)
    }
    
    static func parse(from service: ServicesAPIModel) -> ServicesEntity {
        return ServicesEntity(name: service.name, sku: service.sku,
                              idShopkeeper: service.idShopkeeper, price: service.price,
                              installment: service.installment, type: service.type)
    }
    
    static func parse(from image: ProductImagesAPIModel) -> ImageEntity {
        return ImageEntity(id: image.id, name: image.name, height: image.height, width: image.width, url: image.url)
    }
    
    static func parse(from category: CategoryAPIModel) -> CategoryEntity {
        return CategoryEntity(id: category.id, description: category.description)
    }
    
    static func parse(from brand: BrandAPIModel) -> BrandEntity {
        return BrandEntity(id: brand.id, name: brand.name)
    }
    
    static func parse(from paymentMethod: PaymentMethodAPIModel) -> PaymentMethodEntity {
        return PaymentMethodEntity(price: paymentMethod.price, hasDiscount: paymentMethod.hasDiscount,
                                   description: paymentMethod.description,
                                   discountPercent: paymentMethod.discountPercent)
    }
    
    static func parse(from information: InformationAPIModel) -> InformationEntity {
        var values: [ValueEntity] = []
        if let mValues = information.values {
            mValues.forEach({value in
                values.append(parse(from: value))
            })
        }
        return InformationEntity(description: information.description, values: values)
    }
    
    static func parse(from value: ValueAPIModel) -> ValueEntity {
        return ValueEntity(name: value.name, value: value.value)
    }
    
    static func parse(from rating: RatingAPIModel) -> RatingEntity {
        var opinions: [OpinionEntity] = []
        if let mOpinions = rating.opinions {
            mOpinions.forEach({opinion in
                opinions.append(parse(from: opinion))
            })
        }
        return RatingEntity(rating: rating.rating, count: rating.count, opinions: opinions)
    }
    
    static func parse(from opinion: OpinionAPIModel) -> OpinionEntity {
        var mediaGalery: [MediaGaleryEnity] = []
        if let medias = opinion.mediaGalery {
            medias.forEach({media in
                mediaGalery.append(parse(from: media))
            })
        }
        
        return OpinionEntity(client: opinion.client, date: opinion.date,
                             comment: opinion.comment, note: opinion.note,
                             title: opinion.title, generalAvaliation: opinion.generalAvaliation,
                             stateAvaliation: opinion.stateAvaliation, like: opinion.like,
                             dislike: opinion.dislike, mediaGalery: mediaGalery,
                             idReview: opinion.idReview, descriptionNote: opinion.descriptionNote,
                             cityAvaliation: opinion.cityAvaliation)
    }
    
    static func parse(from media: MediaGaleryAPIModel) -> MediaGaleryEnity {
        return MediaGaleryEnity(type: media.type, link: media.link)
    }
    
    static func parse(from product: ProductSimpleAPIModel) -> ProductSimpleEntity {
        return ProductSimpleEntity(id: product.id,
                                   sku: product.sku,
                                   name: product.name,
                                   image: product.image,
                                   currentPrice: product.currentPrice,
                                   previousPrice: product.previousPrice,
                                   purchasePercent: product.purchasePercent,
                                   rating: product.rating,
                                   installment: product.installment)
    }
}
