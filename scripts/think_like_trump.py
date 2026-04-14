#!/usr/bin/env python3
"""
特朗普思维模型分析工具
用法: python3 think_like_trump.py "你的问题"
"""

import sys
import random

def think_like_trump(question):
    """
    用特朗普的思维方式分析问题
    """
    
    # 特朗普标志性开场
    openings = [
        "听我说，这个问题很简单。",
        "让我告诉你，没有人比我更懂这个。",
        "这个问题，很多人问我，非常多的人。",
        "相信我，我知道怎么处理。",
    ]
    
    # Think Big 建议
    think_big = [
        "首先，目标要够大。不要问「能不能做到」，要问「如果必须做到，我需要什么」。",
        "设定一个让所有人觉得「不可能」的目标，然后让所有人相信「可能」。",
        "既然要想，就别小打小闹。乘以10，再乘以10。",
    ]
    
    # 直觉决策建议
    intuition = [
        "不要相信所谓的专家。亲自去看，亲自去了解。",
        "你的直觉告诉你什么？相信它，即使所有人都反对。",
        "我从不看那些冗长的报告。到现场去，看真实情况。",
    ]
    
    # 谈判策略
    negotiation = [
        "制造不确定性。让他们猜不透你的底线。",
        "利用时间压力。给他们一个 deadline，让他们焦虑。",
        "强硬，非常强硬。但记住，承诺必须兑现。",
    ]
    
    # 反击策略
    fight_back = [
        "如果有人攻击你，狠狠回击。而且要快、要狠。",
        "不要解释，不要道歉。反击！",
        "定义叙事。让公众知道你是强者，他们是失败者。",
    ]
    
    # 情绪操控
    emotion = [
        "利用愤怒，但不要被愤怒控制。",
        "让对手感到压力，让支持者感到你和他们在一起。",
        "所有宣传都是好宣传。利用争议。",
    ]
    
    # 结尾
    closings = [
        "记住：要强硬，要狠，但要兑现承诺。",
        "这就是交易的本质。相信我。",
        "你会赢的，赢得很大。",
    ]
    
    print("=" * 60)
    print("🎯 特朗普思维模型分析")
    print("=" * 60)
    print(f"
问题: {question}")
    print("
" + "-" * 60)
    print("
💭 特朗普式思考:
")
    
    print(random.choice(openings))
    print()
    print(random.choice(think_big))
    print()
    print(random.choice(intuition))
    print()
    print(random.choice(negotiation))
    print()
    print(random.choice(fight_back))
    print()
    print(random.choice(emotion))
    print()
    print(random.choice(closings))
    
    print("
" + "=" * 60)
    print("⚠️  提醒: 这是模拟特朗普的思维方式，仅供参考")
    print("    实际应用请谨慎，注意副作用")
    print("=" * 60)

def main():
    if len(sys.argv) < 2:
        print("用法: python3 think_like_trump.py "你的问题"")
        print("
示例:")
        print('  python3 think_like_trump.py "如何与供应商谈判？"')
        print('  python3 think_like_trump.py "竞争对手攻击我怎么办？"')
        print('  python3 think_like_trump.py "出现负面新闻如何应对？"')
        sys.exit(1)
    
    question = sys.argv[1]
    think_like_trump(question)

if __name__ == "__main__":
    main()
