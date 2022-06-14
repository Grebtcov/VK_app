//
//  LoginWebViewController.swift
//  VK_app
//
//  Created by Alex x on 5/4/22.
//

import UIKit
import WebKit

class LoginWebViewController: UIViewController {
    
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "LoginWebViewController"

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        webView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        
        webView.navigationDelegate = self
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8157592"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value:
            "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,photos,groups,wall"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: urlComponents.url!)
        webView.load(request)
        
    }
}

//MARK: WKNavigationDelegate
extension LoginWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        guard let url = navigationResponse.response.url,
                url.path == "/blank.html",
                let fragment = url.fragment
            else {
                    decisionHandler(.allow)
                    return
                 }
        
        print(fragment)
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userId = Int(params["user_id"] ?? "") else { return }
        Session.shared.token = token
        Session.shared.userId = userId
        
        decisionHandler(.cancel)
        
        let loadViewController = LoadViewController()
        loadViewController.modalPresentationStyle = .fullScreen
        loadViewController.transitioningDelegate = self
        
        FirebaseService.shared.saveUserLogin(userId: userId)
        present(loadViewController, animated: true, completion: nil)
        
    }
}

// MARK: TransitioningDelegate
extension LoginWebViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionAnimator(isPresent: true, present: .modal)
    }
    
}
