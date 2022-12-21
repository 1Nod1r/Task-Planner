//
//  LaunchViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseFirestore

class LaunchViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = LaunchView
    private let viewModel: LaunchViewModelProtocol
    private var isEnabled = false
    private var email = ""
    private var password = ""
    
    init(viewModel: LaunchViewModelProtocol = LaunchViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.loadingDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        super.loadView()
        view = LaunchView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = false
    }

    @objc func goNext(){
        if isEnabled {
            viewModel.createUser(email: email, password: password) {[weak self] in
                guard let self else { return }
                let vc = OnboardingViewController()
                let navVC = UINavigationController(rootViewController: vc)
                navVC.modalPresentationStyle = .overFullScreen
                self.navigationController?.present(navVC, animated: true)
            }
        } else {
            showError(error: "Textfields are empty!")
        }
    }
    
    private func setup(){
        bindingView().continueButton.addTapGesture(tapNumber: 1, target: self, action: #selector(goNext))
        bindingView().emailTextField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        bindingView().googleButton.addTapGesture(tapNumber: 1, target: self, action: #selector(googleSignIn))
        bindingView().appleButton.addTapGesture(tapNumber: 1, target: self, action: #selector(appleButton))
        bindingView().passwordTextField.textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        bindingView().emailTextField.delegate = self
        bindingView().passwordTextField.delegate = self
    }
    
    @objc func appleButton(){
        
    }
    
    @objc func editingChanged(_ textField: UITextField){
        if bindingView().emailTextField.textField.text != "", bindingView().passwordTextField.textField.text != "" {
            password = bindingView().passwordTextField.textField.text ?? ""
            email = bindingView().emailTextField.textField.text ?? ""
            isEnabled = true
        } else {
            isEnabled = false
        }
    }
    
    @objc func googleSignIn(){
    
    }
    
}


extension LaunchViewController: AppTextFieldDelegate {}

extension LaunchViewController: LoadingDelegate {
    
    func showError(error: String?) {
        showErrorTo(error: error)
    }

    func showLoading() {
        showProgress()
    }

    func hideLoading() {
        hideProgress()
    }
}

/*
 let model = Task(task: [TaskDetail(message: text, isProgress: false)])
 viewModel.addDocument(params: [
//                "task": FieldValue.arrayRemove([model.task?[0].taskData])
     "task":FieldValue.arrayUnion([model.task?[0].taskData])
 ])
 */
