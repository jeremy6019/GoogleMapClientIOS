//
//  ViewController.swift
//  GoogleMapApp
//
//  Created by 503 on 2020/03/11.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var t_lat: UITextField!
    @IBOutlet weak var t_lng: UITextField!
    @IBOutlet weak var t_content: UITextField!
    
    //HTTP POSt요청을 시도하자 !!
    @IBAction func btnClick(_ sender: Any) {
         //요청 객체 생성
        var url = URL(string: "http://localhost:9999/regist")
        var urlRequest = URLRequest(url: url!)
        
        //딕셔너리
        let params = [
            "lat":t_lat.text!,
            "lng":t_lng.text!,
            "content":t_content.text!
        ]
        
        //post한 요청의 바디에 실어서 보내야 하므로 요청형식을 구성해야한다
        //머리:header + 몸:body
        
        //Header 정보구성
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //body정보 구성
        urlRequest.httpMethod = "POST"
        
       
        //body에 json객체 대입 문자열화 시켜서 시리얼 화
        do{
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options:.prettyPrinted)
        }catch let error{
            print("문자열화 실패", error)
        }
        
        //구성된 내용을 서버로 전송하되, 동기방식으로 하면 앱이 멈춘다
        //비동기로 전송하자!! AsyncTask(android)
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest, completionHandler: {data,reesponse,error in
            //로직을 작성할 예정
            //서버로부터 가져올 데이터가 있을때 작성
            //즉 피드백을 받고 싶을때...
        })
        task.resume() //비동기 요청 수행
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

