//
//  PostModel.swift
//  Navigation
//
//  Created by Иван Захаров on 18.05.2023.
//

import UIKit

final class Post {
    
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
    
    
    init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}

final class PostStorage {
    
    static func makeMockModel() -> [Post] {
        var model = [Post]()
        
        model.append(Post(author: "Music.world", description: "Это замечательный инструмент, обойтись без которого сложно в любом музыкальном направлении. Бас-гитара — это одновременно и ритм, и мелодия, составляющие основу композиции. Бас достаточно прост в освоении, и обучение игры на нем приятно и несложно.", image: "bass.png", likes: Int.random(in: 10...1000), views: Int.random(in: 100...10000)))
        
        model.append(Post(author: "Катастрофические цветовые решения из мира фотографий", description: "Гармония от греческого harmonia, что означает созвучие, согласие, противоположность хаосу. В цветной композиции тоже можно применять способы гармонизации, есть множество теорий с помощью которых пытались добиваться гармоничных сочетаний цветов, многие ученые работали над данной проблемой причем работали не только и не столько ученые изучающие физику цвета и света, а как правило те умы, которые пробовали осмыслить как цвет воздействует на психику человека, пытаясь добиться по средствам сочетания цветов определенного восприятия.", image: "color harmony.jpg", likes: Int.random(in: 10...1000), views: Int.random(in: 100...10000)))
        
        model.append(Post(author: "Music.world", description: "Читая музыкальную прессу, мне периодически попадаются новости о выпуске новых альбомах на виниле. Удивительно, что в наш цифровой век винил остается актуальным. Я задался вопросом, отличаются ли выпускаемые сегодня пластинки от того, что было на прилавках магазинов тридцать лет назад.", image: "vinil.jpg", likes: Int.random(in: 10...1000), views: Int.random(in: 100...10000)))
        
        model.append(Post(author: "Music.world", description: "Жизнь большинства людей очень скучна и однообразна: каждый новый день похож на предыдущий. С утра мы просыпаемся, завтракаем и идем на работу, а после окончания трудового дня возвращаемся домой, принимаем душ, ужинаем, проводим несколько часов перед телевизором и отправляемся спать. И так каждый день.", image: "gitara.jpg", likes: Int.random(in: 10...1000), views: Int.random(in: 100...10000)))
        
        return model
    }
}
