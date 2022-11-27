import SwiftUI

let newdishes = [
    Dish(name: "蒜香排骨", canteen: "学二", img: "paigu",info: "真是好吃极了啊，快来品尝！等你来打分！",score: 1,price: 5.00),
    Dish(name: "香辣牛肉面", canteen: "学二", img: "noodle",info: "非常好吃非常美味，快来品尝！等你来打分！",score: 1,price: 4.50),
    Dish(name: "牛肉汉堡", canteen: "新北", img: "hanbao",info: "小汉堡真是好，快来品尝！等你来打分！",score: 1,price: 6.8),
    Dish(name: "飘香焖锅", canteen: "合一", img: "menguo",info: "飘香焖锅就是好，快来品尝！等你来打分！",score: 1,price: 9),
    Dish(name: "麻辣香锅", canteen: "合一", img: "xiangguo",info: "香锅管你吃到饱，快来品尝！等你来打分！",score: 1,price: 13),
]
let unsortgooddishes = [
    Dish(name: "脆皮五花", canteen: "学一", img: "脆皮五花", info: "主料五花肉，肥而不腻，鲜香酥脆，欢迎品尝！",score: 4,price: 5.6),
    
    Dish(name: "黄金蛋松", canteen: "学一", img: "黄金蛋松", info: "主料五花肉，肥而不腻，鲜香酥脆，欢迎品尝！",score: 3,price: 5),
    
    Dish(name: "荠菜鸡茸卷", canteen: "学一", img: "荠菜鸡茸卷", info:
            "主料鸡胸肉，外皮酥脆，荠菜清香，欢迎品尝！",score: 5,price: 7.2),
    
    Dish(name: "无影冬瓜", canteen: "学一", img: "无影冬瓜", info: "主料冬瓜，鸡蛋，淀粉，色泽金黄，酸甜爽口，欢迎品尝！",score: 2,price: 4),
    
    Dish(name: "蚝汁茄排", canteen: "学二", img: "蚝汁茄排", info: "主料茄子，去皮后煎，松软鲜香，营养丰富，欢迎品尝！",score: 4,price: 12),
    
    Dish(name: "卤肉酸菜", canteen: "学二", img: "卤肉酸菜", info: "主料五花肉，酸白菜，色泽明亮，酸香味美，欢迎品尝！",score: 5,price: 14),
    
    Dish(name: "香酥麻辣鱼", canteen: "学二", img: "香酥麻辣鱼", info: "主料草鱼，青椒，红椒，外酥里嫩，唇齿留香，欢迎品尝！",score: 5,price: 10),
    
    Dish(name: "手撕鸡", canteen: "学二", img: "手撕鸡", info: "主料鸡腿，葱头，香菜，软烂入味，麻辣鲜香，欢迎品尝！",score: 1,price: 7.8),
    
    Dish(name: "风味肉片", canteen: "学三", img: "风味肉片", info: "主料鸭胸肉，洋葱，生菜，鸭肉鲜嫩，鲜香异常，欢迎品尝！",score: 5,price: 17),
    
    Dish(name: "蒜香丝瓜", canteen: "学三", img: "蒜香丝瓜", info: "主料丝瓜，粉丝，五花肉，翠绿滑爽，蒜香十足，欢迎品尝！",score: 5,price: 8.8),
    
    Dish(name: "秘制烤鸡", canteen: "学三", img: "秘制烤鸡", info: "主料三黄鸡，生菜，烤肉酱，肉质细嫩，酱香十足，欢迎品尝！",score: 3,price: 5.2),
    
    Dish(name: "咸蛋黄蒸肉饼", canteen: "学三", img: "咸蛋黄蒸肉饼", info: "主料前尖肉馅莲藕，蛋黄，口感滑嫩，滋味鲜美，欢迎品尝！",score: 5,price: 13),
    
    Dish(name: "酿冬瓜", canteen: "学四", img: "酿冬瓜", info: "主料冬瓜，肉馅，肉质滑嫩，鲜香味美，欢迎品尝！",score: 4,price: 14),
    
    Dish(name: "果味山药", canteen: "学四", img: "果味山药", info: "主料山药，火龙果，口感细腻，香甜软糯，欢迎品尝！",score: 2,price: 9.7),
    
    Dish(name: "脆皮里脊", canteen: "学四", img: "脆皮里脊", info: "主料里脊肉，肥而不腻，鲜香酥脆，欢迎品尝！",score: 3,price: 8.2),
    
    Dish(name: "酥脆肉卷", canteen: "学四", img: "酥脆肉卷", info: "主料肉馅莲藕，外酥里嫩，鲜香无比，欢迎品尝！",score: 5,price: 19),
    
    Dish(name: "樱桃肉", canteen: "学五", img: "樱桃肉", info:
            "主料里脊，酸甜可口，色泽红亮，欢迎品尝！",score: 4,price: 20),
    
    Dish(name: "照烧鸡排", canteen: "学五", img: "照烧鸡排", info:
            "主料鸡肉，肥而不腻，肉香四溢，欢迎品尝！",score: 1,price: 12),
    
    Dish(name: "金汤锤肉片", canteen: "学五", img: "金汤锤肉片", info:
            "主料鸡肉，黄豆芽，汤汁金黄，酸辣爽口，欢迎品尝！",score: 3,price: 15.5),
    
    Dish(name: "麻辣五花肉", canteen: "学五", img: "麻辣五花肉", info:
            "主料五花肉，麻辣酥脆，口感地道，欢迎品尝！",score: 4,price: 13.2),
    
    
    Dish(name: "肉酿苦瓜", canteen: "学六", img: "肉酿苦瓜", info:
            "主料鸡肉，瓜翠清香，咸鲜微苦，欢迎品尝！",score: 4,price: 12.5),
    
    
    Dish(name: "口袋豆腐", canteen: "学六", img: "口袋豆腐", info:
            "主料豆腐，口感软嫩，清爽鲜美，欢迎品尝！",score: 5,price: 5),
    
    Dish(name: "五花肉包秋葵", canteen: "学六", img: "五花肉包秋葵", info:
            "主料秋葵，酱香浓郁，酥嫩多汁，欢迎品尝！",score: 4,price: 6.8),
    
    Dish(name: "焦香羊肉", canteen: "清真", img: "焦香羊肉", info:
            "主料羊后腿肉，焦香浓郁，鲜嫩不柴，欢迎品尝！",score: 4,price: 7.8),
    
    Dish(name: "松仁翅根", canteen: "清真", img: "松仁翅根", info:
            "主料鸡翅根，口味甜香，松香入味，欢迎品尝！",score: 5,price: 6.8),
    
    Dish(name: "甜辣牛肉卷", canteen: "清真", img: "甜辣牛肉卷", info:
            "主料牛肉馅，口感软嫩，甜辣鲜香，欢迎品尝！",score: 4,price: 12),
    
    
    Dish(name: "鹰嘴豆炖番茄牛肉", canteen: "清真", img: "鹰嘴豆炖番茄牛肉", info:
            "主料牛腩，肉质松软，酸甜美味，欢迎品尝！",score: 4,price: 14),
    
    Dish(name: "吉鸡脆", canteen: "合一厅", img: "吉鸡脆", info:
            "主料鸡肉，香脆鲜嫩，口感咸鲜，欢迎品尝！",score: 5,price: 13),
    
    Dish(name: "香蕉球", canteen: "合一厅", img: "香蕉球", info:
            "主料香蕉，外酥里嫩，香甜软糯，欢迎品尝！",score: 4,price: 12),
    
    Dish(name: "蒜香鸡", canteen: "合一厅", img: "蒜香鸡", info:
            "主料鸡肉，鲜嫩入味，蒜香浓郁，欢迎品尝！",score: 2,price: 11.2),
    
    Dish(name: "妙炒豆腐", canteen: "合一厅", img: "妙炒豆腐", info:
            "主料豆腐，皮焦内嫩，香辣可口，欢迎品尝！",score: 4,price: 18.2),
    
]

let gooddishes = unsortgooddishes.sorted { Dish1, Dish2 in
    return Dish1.score > Dish2.score ? true:false
}

let canteens = ["学一","学二","学三","学四","学五","学六","清真","合一"]

func solveMaxValue(maxPrice:Int)->[Dish] {
    let dishes = gooddishes
    
    let temp:[Int] = [Int].init(repeating: 0, count: maxPrice + 1)
    var V = [[Int]].init(repeating: temp, count:dishes.count+1)
    var Keep = [[Int]].init(repeating: temp, count:dishes.count+1)
    
    for _ in 0...maxPrice{
        V[0][maxPrice] = 0
    }
    
    for i in 1...dishes.count {
        for w in 0...maxPrice {
            let price = Int(dishes[i-1].price)
            let score = dishes[i-1].score
            if  (price <= w && score + V[i-1][w-price] > V[i-1][w]){
                V[i][w] = V[i-1][w-price]+score
                Keep[i][w] = 1
            }else{
                V[i][w] = V[i-1][w]
                Keep[i][w] = 0
            }
        }
    }
    var K = maxPrice
    var ans :[Dish] = []
    for i in (1...dishes.count).reversed(){
        if(Keep[i][K] == 1){
            //print(dishes[i-1].name)
            ans.append(dishes[i-1])
            K = K-Int(dishes[i-1].price)
        }
    }
    if(ans.isEmpty){
        ans.append(Dish(name: "没有满足要求的菜品清单", canteen: "请重新输入", img: "noodle",info: "请重新输入",score: 1,price: 1))
    }
    return ans
}
