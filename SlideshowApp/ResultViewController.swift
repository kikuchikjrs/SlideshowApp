//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Shigeo Kikuchi on 2016/12/11.
//  Copyright © 2016年 shigeo.kikuchi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let imageNameArray = [
        "1.JPG",
        "2.JPG",
        "3.JPG",
        "4.JPG",
        "5.JPG",
        ]
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var imageIndex:Int = 0

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
