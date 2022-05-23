//
//  PhotoViewController.swift
//  VK_app
//
//  Created by Alex x on 4/14/22.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    var photosArray: [PhotoModel]?
    var idPhoto: Int = 0
    var photosImageView: [UIImageView] = []
    
    var indexPhoto = 0
    
    var animationLeft: UIViewPropertyAnimator?
    var animationRight: UIViewPropertyAnimator?
    
    var shiftX: CGFloat = 450
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        navigationItem.title = "Все фотографии \(idPhoto)"
        tabBarController?.tabBar.isHidden = true
        
        
        
        addPhoto()
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
            edgePan.edges = .left

            view.addGestureRecognizer(edgePan)
        }

        @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
            if recognizer.state == .recognized {
                popViewController()
            }
        }

        @objc func back() {
            popViewController()
        }

        func popViewController() {
            let navigationControllerDelegate = NavigationControllerDelegate()
            navigationController?.delegate = navigationControllerDelegate
            
            navigationController?.popViewController(animated: true)
        }
    
    func addPhoto() {
        
        shiftX = view.frame.width
        
        guard let photosArray = photosArray
            else {
                return
            }
        

        for photo in photosArray {
            
            var viewImage = UIImageView()
            
            if let url = URL(string: photo.getUrlBigPhoto()) {
              
                if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
                    viewImage = UIImageView(image: UIImage(data: cachedResponse.data))
                    
                } else {
                    
                    NetworkService.shared.sendGetRequest(url: url) { data in
                                                
                        DispatchQueue.main.async {
                            viewImage = UIImageView(image: UIImage(data: data))
                           // print(self.photosImageView.count)
                        }
                    }
                }
            }
            
            photosImageView.append(viewImage)
            let index = photosImageView.endIndex - 1
            view.addSubview(photosImageView[index])
            photosImageView[index].translatesAutoresizingMaskIntoConstraints = false
            photosImageView[index].widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            photosImageView[index].heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        }
        
        for i in 0..<photosImageView.count {
            
            if i == idPhoto {
                photosImageView[i].centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            } else if i < idPhoto {
                
                photosImageView[i].centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -(shiftX + (shiftX * CGFloat(idPhoto - (i + 1))))).isActive = true
               photosImageView[i].alpha = 0
                
            } else if i > idPhoto {
                
                photosImageView[i].centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: shiftX + (shiftX * CGFloat(i - (idPhoto + 1)))).isActive = true
               photosImageView[i].alpha = 0
            }
            //photosImageView[i].alpha = 0
            photosImageView[i].centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(startTransition(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    // Да я знаю что это плохо =)
    @objc func startTransition(_ sender: UIPanGestureRecognizer) {
        
      
        
        guard let photosArray = photosArray
            else {
                return
            }
        
        switch sender.state {
        case .began:
            animationLeft?.stopAnimation(true)
            animationLeft?.finishAnimation(at: .current)
            animationRight?.stopAnimation(true)
            animationRight?.finishAnimation(at: .current)
            let translationX = sender.translation(in: view).x
            photosImageView[idPhoto].alpha = 1
            
                if translationX < 0 {
                    
                    
                    if idPhoto < photosArray.count - 1 {
                        photosImageView[idPhoto + 1].alpha = 0
                        photosImageView[idPhoto + 1].transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    
                    animationLeft = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
                    
                    self.photosImageView.forEach {
                        $0.center.x = $0.center.x - self.shiftX
                    }
                        self.photosImageView[self.idPhoto + 1].alpha = 1
                   
                })
                
                    animationLeft?.addCompletion({ _ in
                        self.idPhoto += 1
                        
                        
                        UIView.animate(withDuration: 0.3,
                                       delay: 0) {
                           
                            self.photosImageView[self.idPhoto].transform = CGAffineTransform.identity
                        }
                        
                       
                   })
                        
                    } else {
                        
                        let centerX = photosImageView[idPhoto].center.x
                        
                        animationLeft = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
                            self.photosImageView[self.idPhoto].center.x = centerX - 50
                       
                        })
                    
                        animationLeft?.addCompletion({ _ in
                            
                            UIView.animate(withDuration: 0.3,
                                           delay: 0) {
                                self.photosImageView[self.idPhoto].center.x = centerX
                            }
                            
                         
                       })
                        
                        
                    }
                } else if translationX > 0 {
                    
                    if idPhoto > 0 {
                        photosImageView[idPhoto - 1].alpha = 0
                        photosImageView[idPhoto - 1].transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        
                        animationRight = UIViewPropertyAnimator(duration: 1, curve: .easeInOut, animations: {

                            self.photosImageView.forEach {
                                $0.center.x = $0.center.x + self.shiftX
                            }
                           self.photosImageView[self.idPhoto - 1].alpha = 1
                        })
                            
                        animationRight?.addCompletion { _ in
                            self.idPhoto -= 1
                            UIView.animate(withDuration: 0.3,
                                           delay: 0) {
                               
                                self.photosImageView[self.idPhoto].transform = CGAffineTransform.identity
                            }
                        }
                    } else {
                        
                        let centerX = self.photosImageView[self.idPhoto].center.x
                        
                        animationRight = UIViewPropertyAnimator(duration: 1, curve: .easeInOut, animations: {

                            self.photosImageView[self.idPhoto].center.x = centerX + 50
                        })
                            
                        animationRight?.addCompletion { _ in
                            
                            UIView.animate(withDuration: 0.3,
                                           delay: 0) {
                               
                                self.photosImageView[self.idPhoto].center.x = centerX
                            }
                        }
                        
                        
                    }
                    
                    
                }
            animationLeft?.pauseAnimation()
            animationRight?.pauseAnimation()
            
        case .changed:
            let translationX = sender.translation(in: view).x
            if translationX < 0 {
                let updateFractionComplete = abs(translationX) / 100
                if updateFractionComplete <= 0.99 {
                    animationLeft?.fractionComplete = updateFractionComplete
                }
            } else if translationX > 0 {
                let updateFractionComplete = abs(translationX) / 100
                if updateFractionComplete <= 0.99 {
                    animationRight?.fractionComplete = updateFractionComplete
                }
            }
                        
        case .ended:
            let translationX = sender.translation(in: view).x
            if translationX < 0 {
                if animationLeft?.fractionComplete ?? 0 > 0.5 {
                    
                    animationLeft?.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
                } else {
                    if idPhoto < photosArray.count - 1 {
                        animationLeft?.addCompletion { _ in
                            self.idPhoto -= 1
                            
                        }
                    }
                    animationLeft?.isReversed = true
                    animationLeft?.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
                }
            } else if translationX > 0 {
                if animationRight?.fractionComplete ?? 0 > 0.5 {
                    animationRight?.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
                } else {
                    if idPhoto > 0 {
                    animationRight?.addCompletion { _ in
                        self.idPhoto += 1
                       
                    }
                    }
                    animationRight?.isReversed = true
                    animationRight?.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
                }
            }
        default:
            break
        }
        
    }

}
