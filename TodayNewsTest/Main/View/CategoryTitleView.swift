//
//  CategoryTitleView.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/12.
//  Copyright © 2017年 Lyy. All rights reserved.
//


import UIKit
import ObjectMapper
import Kingfisher
import SnapKit

class CategoryTitleView: UIView {
    
    var titles = [CategoryTitle]()
    var labels = [CategoryTitleLabel]()
    var displayAddButton: Bool = false
    var labelTextColor: UIColor?
    var labelSelectedTextColor: UIColor?
    
    private var oldIndex = 0
    private var currentIndex = 0
    private var labelWidths = [CGFloat]()
    
    var addBtnClickClosure:(() -> ())?
    var titlesClosure: ((titleArray: [CategoryTitle])->())?
    var didSelectedTitleLabel: ((titleLable : CategoryTitleLabel)->())?
    
    // Swift中，有两种方式来惰性初始化。在变量第一次使用的时候才进行初始化 类似单例
    // 第一种，简单表达式 第二种，闭包
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var addButton : UIButton = {
        let addButton = UIButton()
        let addBtnImg = UIImage(named: "add_channel_titlbar_16x16_");
        addButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addButton.setImage(addBtnImg, forState: .Normal)
        return addButton
    }()
    
    func clickAddButton() {
        addBtnClickClosure?()
    }
    
    //这是个函数 外界调用这个函数的时候 需要填写参数 而这里的参数就是一个闭包
    //所以外界调用的时候需要填写参数 这里填写的就是闭包的主体
    //第一个括号里的内容是闭包的参数
    //闭包执行的时候这个参数要填写 然后用这个参数来执行闭包主体
    func addButtonClickClosure(closure : () -> ()) {
        addBtnClickClosure = closure
    }
    
    func didSelectedTitleLabelClosure(closure : (titleLabel : CategoryTitleLabel) -> ()) {
        didSelectedTitleLabel = closure
    }
    
    func titleArrayClosure(closure: (titleArray: [CategoryTitle]) -> ()) {
        titlesClosure = closure
    }
    
    //指定构造器方法名只能是“init” 参数可以随意
    //若参数名和父类相同 需要加上“override”
    //在本类的属性初始化完成后需要调用直接父类的指定构造器
    init(textColor: UIColor, selectedTextColor: UIColor, needAddButton: Bool) {
        labelTextColor = textColor
        displayAddButton = needAddButton
        labelSelectedTextColor = selectedTextColor
        // 在完成所在类和所有父类的属性初始化后，才能使用self，也就是初始化器调用super.init后才能使用self
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        //懒加载滚动视图
        addSubview(scrollView)
        
        if displayAddButton {
            //懒加载添加按钮
            addSubview(addButton)
            
            addButton.snp_makeConstraints { (make) in
                make.top.bottom.right.equalTo(self)
                make.width.equalTo(30)
            }
            scrollView.snp_makeConstraints { (make) in
                make.left.top.bottom.equalTo(self)
                make.right.equalTo(addButton.snp_left)
            }
            
        } else {
            scrollView.snp_makeConstraints { (make) in
                make.left.top.bottom.right.equalTo(self)
            }
        }
        
        setupTitlesLable()
        setupLabelsPosition()
        
        titlesClosure?(titleArray: titles)
    }
}

extension CategoryTitleView {
    private func setupTitlesLable() {
        for (index, title) in titles.enumerate() {
            print(index)
            print(title)
 
            let label = CategoryTitleLabel()
            label.text = title.name
            label.tag = index
            label.textColor = labelTextColor
            label.textAlignment = .Center
            label.userInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(titleLabelOnClick(_:))) //(_:)传递触摸对象
            label.addGestureRecognizer(tap)
            label.font = UIFont.systemFontOfSize(17)
            label.sizeToFit() //根据label里的文字来自动改变label尺寸
            label.width += 10
            labels.append(label)
            labelWidths.append(label.width)
            scrollView.addSubview(label)
        }
        
        let currentLabel = labels[currentIndex]
        
        currentLabel.textColor = labelSelectedTextColor
        currentLabel.currentScale = 1.1
    }
    
    private func setupLabelsPosition() {
        var titleX : CGFloat = 0.0
        let titleY : CGFloat = 0.0
        var titleW : CGFloat = 0.0
        let titleH  = self.height
        
        for (index, label) in labels.enumerate() {
            titleW = labelWidths[index]
            titleX = 10
            if index != 0{
                let lastLabel = labels[index - 1]
                titleX += CGRectGetMaxX(lastLabel.frame)
            }
            label.frame = CGRectMake(titleX, titleY, titleW, titleH)
        }
        
        if let lastLabel = labels.last {
            scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastLabel.frame), 0)
        }
    }
    
    func titleLabelOnClick(tap: UITapGestureRecognizer) {
        //if 里面的判断类型必须是Optional类型。所以必须用as?
        guard let currentLabel = tap.view as? CategoryTitleLabel else {return}
        oldIndex = currentIndex
        currentIndex = currentLabel.tag
        let oldLabel = labels[oldIndex]
        oldLabel.textColor = labelTextColor
        oldLabel.currentScale = 1.0
        currentLabel.textColor = labelSelectedTextColor
        currentLabel.currentScale = 1.1
        adjustTitleOffSetToCurrentIndex(currentIndex, oldIndex: oldIndex)
        didSelectedTitleLabel?(titleLable: currentLabel)
    }
    
    //计算偏移量 保证点击的label能尽力在屏幕中间显示
    func adjustTitleOffSetToCurrentIndex(currentIndex: Int, oldIndex: Int) {
        if oldIndex == currentIndex {return}
        let currentLabel = labels[currentIndex]
        //当前偏移
        var offsetX = currentLabel.centerX - SCREENW * 0.5
        if offsetX < 0 {
            offsetX = 0
        }
        
        //最大偏移量
        var maxOffsetX = scrollView.contentSize.width - (SCREENW - (displayAddButton ? addButton.width : 0))
        if maxOffsetX < 0 {
            maxOffsetX = 0
        }
        
        if offsetX > maxOffsetX {
            offsetX = maxOffsetX
        }
        
        scrollView.setContentOffset(CGPointMake(offsetX, 0), animated: true)
    }
    
    //必须通过get和set这种特性的方式来重写父类的属性
    override var frame : CGRect {
        didSet {
            let newFrame = CGRectMake(0, 0, SCREENW, 44)
            super.frame = newFrame
        }
    }
}

class CategoryTitleLabel:UILabel {
    var currentScale: CGFloat = 1.0 {
        didSet {
            transform = CGAffineTransformMakeScale(currentScale, currentScale)
        }
    }
}

