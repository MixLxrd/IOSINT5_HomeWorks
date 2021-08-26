//
//  Post.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//



import Foundation

struct Post {
    
    let title: String
    
    static let userPosts = [
        UserPost(author: "4PDAnews1", description: "Ровно через неделю на AliExpress стартует главная распродажа года со скидками до 70%. Подбирать себе подарки можно уже сейчас, ведь магазины заранее объявили цены со скидками. Например, сверхмощная игровая консоль нового поколения Microsoft Xbox Series X будет доступна дешевле, чем в официальной рознице. При этом ждать доставку долго не придётся. ", image: #imageLiteral(resourceName: "news1"), likes: 1025, views: 12312),
        UserPost(author: "4PDAnews2", description: "Китайская компания Infinix Mobile представила смартфон среднего класса под названием Infinix Zero 8. Помимо производительного железа, новинка интересна и другими характеристиками. Аппарат с 8 ГБ оперативной памяти способен записывать видео в разрешении 4K, оснащён экраном с повышенной частотой обновления и внушительным набором камер для съёмки в самых разных условиях. Сейчас приобрести новинку на AliExpress можно по специальной цене.", image: #imageLiteral(resourceName: "news2"), likes: 99, views: 15993),
        UserPost(author: "4PDAnews3", description: "Редакция 4PDA совместно с читателями выяснила, что играм все возрасты покорны. Но это касается не только самих цифровых развлечений, но и сопроводительной атрибутики. Терран Грегори, один из разработчиков World of Warcraft, рассказал удивительную историю о своей матери.", image: #imageLiteral(resourceName: "news3"), likes: 543, views: 99999),
        UserPost(author: "4PDAnews4", description: "Согласно отчёту южнокорейских СМИ, подразделение Samsung, специализирующееся на производстве полупроводниковой продукции, уже в следующем году планирует расширить список своих клиентов. Так, сообщается, что процессоры Exynos появятся в устройствах OPPO, vivo и Xiaomi.", image: #imageLiteral(resourceName: "news4"), likes: 2443, views: 52233)
    ]
}
 
