## 航味IOS APP

### 1.1 设计想法与需求

饮食是北航学生生活之必不可少的部分，但是目前的北航校内食堂缺乏统一的信息交互、菜品展示、学生反馈app，借这次swift大作业，我希望能制作一个类似功能的iosapp。在学生端，在消息接受方面，同学们无法及时了解到食堂又上新了哪些菜品，哪些菜品又作出了改进；选购餐食方面，同学们没有办法看到每道菜品的评价与点赞，一旦“踩雷”，没吃饱饭的同时还会坏了一天的“好心情”。

在学校食堂管理端，目前食堂在推送上新消息时采用张贴海报的方式，信息传播效率低，效果不好，在收集学生建议方面，采用人工收集问卷的方式进行同学们的建议收集，低效的同时，问卷受众量太少，收集到的数据结果没有代表性。

基于以上种种问题，我们开发的“航味iosapp”，围绕北航校内的餐饮生活进行内容设计,打造了独属于北航的餐饮文化校内网站，同时解决同学、食堂双方痛点需求，帮助同学们获得更好的校内用餐体验，助力食堂餐品不断改善升级，更好吃，更“航味”！

设计了以下功能：

1.**菜品信息功能**，每道菜品有所属食堂，菜品名称，价格，点赞数，评价，star星数，图片等属性。所有菜品以卡片的形式展示在页面中，点击每张卡片，可以进入到菜品的具体信息页面，具体信息页面可以看到评论，图片等具体信息。

2.**菜品上新消息功能**，系统页面为同学们推送食堂上新菜品的消息。

3.**菜品排行榜功能**，所有菜品按照star星数排行。

3.**建议功能**，系统可以收集同学们对每道菜的评价、建议，食堂可以根据这些建议进行菜品改进与升级。

4.**智能搭配功能**，一键智能搭配今日午饭（晚饭），输入期望价格，一键智能生成今日“菜单”，可以从中挑选，再也不惧选择困难症。

5.**一些小动画**，更好的视觉体验与互动性

<div STYLE="page-break-after: always;"></div>

### 1.2 总体架构

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2023-03-25%2021.37.41.png" alt="截屏2023-03-25 21.37.41" style="zoom:50%;" />

总体采用了MVC模式，经典MVC模式中，M是指业务模型，V是指用户界面，C则是控制器，使用MVC的目的是将M和V的实现代码分离，从而使同一个程序可以使用不同的表现形式。其中，View的定义比较清晰，就是用户界面。相当于将视图层与业务逻辑层分离，耦合度低，易于重用，修改和维护。

### 功能实现

- 上新消息功能，在这里同学们可以看到对应食堂最近上新的菜品，主要展示形式是卡片列表的形式，卡片上有菜品名称，食堂，分数（上新菜品考虑到可能因为评论数量不够，所以分数采用“等你来打分”描述），价格等信息，点击卡片可以进入到具体的卡片信息页面，看到具体的菜品信息。

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2023-03-25%2021.38.08.png" alt="截屏2023-03-25 21.38.08" style="zoom:50%;" />

- 菜品展示及排行功能，这里是所有菜品的列表，选用了北航十二道航味菜品的真实数据，按照从上到下星级数排列，同样采用卡片列表的方式展示，点击卡片可以进入到菜品具体信息页面。

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2023-03-25%2021.38.24.png" alt="截屏2023-03-25 21.38.24" style="zoom:50%;" />

- 菜品单个卡片展示及动画，在这个页面展示菜品的具体描述信息，菜品描述均源于十二道航味中对菜品的描述，均经过整理。点击中央卡片可以有特殊的动画效果。在描述信息页面右下角可以点击查看评论。

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325213859913.png" alt="image-20230325213859913" style="zoom:30%;" />

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325213859913.png" style="zoom:25%;" />

- 评论功能，点击查看评论可以看到对应菜品的的评论。这里链接了CoreData数据库，将comment存储为了如下实体，具有评论日期，对应菜品名等等信息。同时在项目中用NSManagedObject做了映射。进入评论列表可以点击对应评论进入到评论具体信息页面。点击我要评论进入评论信息填写表单，在这里可以设置自己对这道菜品的评分，输入自己要写的评论。

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2022-11-19%2011.03.14.png" alt="截屏2022-11-19 11.03.14" style="zoom:50%;" />

![截屏2023-03-25 21.40.07](http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2023-03-25%2021.40.07.png)

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214026563.png" alt="image-20230325214026563" style="zoom:25%;" />

评论具体信息页面

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214115452.png" alt="image-20230325214115452" style="zoom:25%;" />

我要评论表单，在这里打分，输入菜品评价。

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214128800.png" alt="image-20230325214128800" style="zoom:25%;" />

- 建议功能，点击查看建议可以看到所有的建议。这里链接了CoreData数据库，将suggesr存储为了如下实体，具有建议日期，对应食堂名等等信息。同时在项目中用NSManagedObject做了映射。进入建议列表可以点击对应建议进入到建议具体信息页面。点击提出建议进入建议信息填写表单，在这里可以选取自己要提意见的食堂，输入自己要提出的建议。



<img src="http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2022-11-19%2011.03.34.png" alt="截屏2022-11-19 11.03.34" style="zoom:50%;" />

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214149727.png" alt="image-20230325214149727" style="zoom:50%;" />

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2023-03-25%2021.42.06.png" alt="截屏2023-03-25 21.42.06" style="zoom:50%;" />

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214256198.png" alt="image-20230325214256198" style="zoom:25%;" />

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214311289.png" alt="image-20230325214311289" style="zoom:25%;" />

- 生成菜品，这里用户可以输入自己预期的价位，app根据动态规划算法从数据库中选取一个总价位在预期价位附近，同时评分最高的菜品子集，并展示到结果列表中。点击每个生成的列表项同样可以跳转到菜品的具体信息页面。如果没有满足要求的菜品集，将会显示"没有满足要求的菜品清单"

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214356544.png" alt="image-20230325214356544" style="zoom:25%;" />

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/image-20230325214412974.png" alt="image-20230325214412974" style="zoom:25%;" />

Dynamic Programming算法

```swift
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

```

### 数据集来源

第13届航味参选菜品，总共60余道菜，因为整理菜品描述比较繁琐，暂选择了学院路赛区的35道菜。菜品的描述信息和菜品图片均经过整理。

<img src="http://rrwk2qstp.hb-bkt.clouddn.com/%E6%88%AA%E5%B1%8F2022-11-19%2011.15.56.png" alt="截屏2022-11-19 11.15.56" style="zoom: 33%;" />
