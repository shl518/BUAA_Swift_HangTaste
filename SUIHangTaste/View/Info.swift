import SwiftUI

struct Info: View {
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("简介").bold()
            }
            Text("本次Swift课程大作业中，希望可以做一个“航味”app，帮助同学们能够在及时了解北航校内食堂的新菜品，菜品价格，口味排行等信息。有以下功能。\n 1.菜品点赞排行榜，一眼看到哪个菜品最受好评！\n 2.菜品上新消息，及时了解食堂最近上新了哪些菜品\n 3.北航每个食堂的菜品名称，评价，图片，价格，分数等功能\n 4.随机搭配，智能生成菜品搭配，通过输入预期价格参数，一键定制今日午餐（晚餐）搭配。\n 5.建议功能，用户可以给食堂的菜品提出改进建议。\n 让我们开始体验吧！🤩🤩🤩🤩🤩🤩🤩")
            Spacer()
        }.background(.white)
            
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info()
    }
}
