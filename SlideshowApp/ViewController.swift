//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Shigeo Kikuchi on 2016/12/05.
//  Copyright © 2016年 shigeo.kikuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageNameArray = [
        "1.JPG",
        "2.JPG",
        "3.JPG",
        "4.JPG",
        "5.JPG",
        ]
    
    // 何番目を表示しているかを保持
    var imageIndex = 0
    
    // タイマー
    var timer:Timer! = nil

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var stop: UIBarButtonItem!
    
    // 再生ボタン
    @IBAction func revivalView(_ sender: UIBarButtonItem) {
        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(self.advance(_:)),
                userInfo: nil,
                repeats: true)
            timer.fire()
            stop.title="停止"
        } else {
            timer.invalidate()
            timer = nil
            stop.title="再生"
        }
    }
    
    // 進むボタン
    @IBAction func advance(_ sender: UIBarButtonItem) {
        if imageIndex == imageNameArray.count - 1 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        
        let image:UIImage = UIImage(named: imageNameArray[imageIndex] )!
        imageView.image = image
    }
    
    // 戻るボタン
    @IBAction func returnView(_ sender: UIBarButtonItem) {
        if imageIndex == 0 {
            imageIndex = imageNameArray.count - 1
        } else {
            imageIndex -= 1
        }
        
        let image:UIImage = UIImage(named: imageNameArray[imageIndex] )!
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initImageView()
    }
    
    

    private func initImageView(){
        // UIImage インスタンスの生成
        let image1:UIImage = UIImage(named: imageNameArray[imageIndex] )!
        
        // 画面の横幅を取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        imageView.image = image1

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているimageIndexに値を代入して渡す
        resultViewController.imageIndex = imageIndex
    }
    

    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
}

