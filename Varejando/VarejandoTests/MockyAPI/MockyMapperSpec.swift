//
//  MockyMapperSpec.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

class MockyMapperSpec: QuickSpec {
    var products: ProductsAPIModel!
    var product: ProductAPIModel!
    var price: PriceAPIModel!
    var paymentMethod: PaymentMethodAPIModel!
    
    // Product Detail Mock
    var productDetail: ProductDetailAPIModel!
    var category: CategoryAPIModel!
    var information: InformationAPIModel!
    var brand: BrandAPIModel!
    var value: ValueAPIModel!
    var model: ModelAPIModel!
    var productModel: ProductModelAPIModel!
    var marketplace: MarketplaceAPIModel!
    var shopkeeperDefault: ShopkeeperAPIModel!
    var images: ProductImagesAPIModel!
    var service: ServicesAPIModel!
    
    // Product Rating Mock
    var media: MediaGaleryAPIModel!
    var option: OpinionAPIModel!
    var rating: RatingAPIModel!
    
    // Product Simple Mock
    var simpleProduct: ProductSimpleAPIModel!
    
    override func spec() {
        beforeEach {
            self.paymentMethod = PaymentMethodAPIModel()
            self.price = PriceAPIModel()
            self.price.discountPaymentMethod = self.paymentMethod
            self.product = ProductAPIModel()
            self.product.price = self.price
            self.products = ProductsAPIModel()
            self.products.products = [self.product, self.product]
            
            // Product Detail Mock
            self.category = CategoryAPIModel()
            self.brand = BrandAPIModel()
            self.value = ValueAPIModel()
            
            self.information = InformationAPIModel()
            self.information.values = [self.value, self.value]
            
            self.shopkeeperDefault = ShopkeeperAPIModel()
            
            self.marketplace = MarketplaceAPIModel()
            self.marketplace.shopkeeperDefault = self.shopkeeperDefault
            self.marketplace.featuredShopkeepers = [self.shopkeeperDefault, self.shopkeeperDefault]
            
            self.images = ProductImagesAPIModel()
            self.service = ServicesAPIModel()
            
            self.productModel = ProductModelAPIModel()
            self.productModel.images = [self.images, self.images]
            self.productModel.services = [self.service, self.service]
            self.productModel.price = self.price
            self.productModel.marketplace = self.marketplace
            
            self.model = ModelAPIModel()
            self.model.productModel = self.productModel
            
            self.productDetail = ProductDetailAPIModel()
            self.productDetail.brand = self.brand
            self.productDetail.categories = [self.category, self.category]
            self.productDetail.model = self.model
            self.productDetail.moreInformations = [self.information, self.information]
            
            // Product Rating Mock
            self.media = MediaGaleryAPIModel()
            self.option = OpinionAPIModel()
            self.option.mediaGalery = [self.media, self.media]
            self.rating = RatingAPIModel()
            self.rating.opinions = [self.option, self.option]
            
            // Product Simple Mock
            self.simpleProduct = ProductSimpleAPIModel()
        }
        describe("Test Parse From API Models to Application Entities") {
            context("Parse From API Models to App Entities") {
                it("Parsing PaymentMethodAPIModel to PaymentMethodEntity") {
                    let exResult = MockyMapper.parse(from: self.paymentMethod)
                    expect(exResult).to(beAKindOf(PaymentMethodEntity.self))
                }
                it("Parsing PriceAPIModel to PriceEntity") {
                    let exResult = MockyMapper.parse(from: self.price)
                    expect(exResult).to(beAKindOf(PriceEntity.self))
                }
                it("Parsing ProductAPIModel to ProductEntity") {
                    let exResult = MockyMapper.parse(from: self.product)
                    expect(exResult).to(beAKindOf(ProductEntity.self))
                }
                it("Parsing ProductsAPIModel to ProductsEntity") {
                    let exResult = MockyMapper.parse(from: self.products)
                    expect(exResult).to(beAKindOf(ProductsEntity.self))
                }
                it("Parsing ProductDetailAPIModel to ProductDetailEntity") {
                    let exResult = MockyMapper.parse(from: self.productDetail)
                    expect(exResult).to(beAKindOf(ProductDetailEntity.self))
                }
                it("Parsing CategoryAPIModel to CategoryEntity") {
                    let exResult = MockyMapper.parse(from: self.category)
                    expect(exResult).to(beAKindOf(CategoryEntity.self))
                }
                it("Parsing InformationAPIModel to InformationEntity") {
                    let exResult = MockyMapper.parse(from: self.information)
                    expect(exResult).to(beAKindOf(InformationEntity.self))
                }
                it("Parsing BrandAPIModel to BrandEntity") {
                    let exResult = MockyMapper.parse(from: self.brand)
                    expect(exResult).to(beAKindOf(BrandEntity.self))
                }
                it("Parsing ValueAPIModel to ValueEntity") {
                    let exResult = MockyMapper.parse(from: self.value)
                    expect(exResult).to(beAKindOf(ValueEntity.self))
                }
                it("Parsing ModelAPIModel to ModelEntity") {
                    let exResult = MockyMapper.parse(from: self.model)
                    expect(exResult).to(beAKindOf(ModelEntity.self))
                }
                it("Parsing ProductModelAPIModel to ProductModelEntity") {
                    let exResult = MockyMapper.parse(from: self.productModel)
                    expect(exResult).to(beAKindOf(ProductModelEntity.self))
                }
                it("Parsing MarketplaceAPIModel to MarketplaceEntity") {
                    let exResult = MockyMapper.parse(from: self.marketplace)
                    expect(exResult).to(beAKindOf(MarketplaceEntity.self))
                }
                it("Parsing MarketplaceAPIModel to MarketplaceEntity") {
                    let exResult = MockyMapper.parse(from: self.marketplace)
                    expect(exResult).to(beAKindOf(MarketplaceEntity.self))
                }
                it("Parsing ShopkeeperAPIModel to ShopkeeperEntity") {
                    let exResult = MockyMapper.parse(from: self.shopkeeperDefault)
                    expect(exResult).to(beAKindOf(ShopkeeperEntity.self))
                }
                it("Parsing ProductImagesAPIModel to ImageEntity") {
                    let exResult = MockyMapper.parse(from: self.images)
                    expect(exResult).to(beAKindOf(ImageEntity.self))
                }
                it("Parsing ServicesAPIModel to ServicesEntity") {
                    let exResult = MockyMapper.parse(from: self.service)
                    expect(exResult).to(beAKindOf(ServicesEntity.self))
                }
                it("Parsing MediaGaleryAPIModel to MediaGaleryEnity") {
                    let exResult = MockyMapper.parse(from: self.media)
                    expect(exResult).to(beAKindOf(MediaGaleryEnity.self))
                }
                it("Parsing OpinionAPIModel to OpinionEntity") {
                    let exResult = MockyMapper.parse(from: self.option)
                    expect(exResult).to(beAKindOf(OpinionEntity.self))
                }
                it("Parsing RatingAPIModel to RatingEntity") {
                    let exResult = MockyMapper.parse(from: self.rating)
                    expect(exResult).to(beAKindOf(RatingEntity.self))
                }
                it("Parsing ProductSimpleAPIModel to ProductSimpleEntity") {
                    let exResult = MockyMapper.parse(from: self.simpleProduct)
                    expect(exResult).to(beAKindOf(ProductSimpleEntity.self))
                }
            }
        }
    }
}
