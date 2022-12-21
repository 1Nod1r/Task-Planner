//
//  LaunchViewModel.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 22/11/22.
//

import UIKit
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth
import FirebaseFirestoreSwift
import ProgressHUD

protocol LaunchViewModelProtocol: BaseViewModelProtocol {
    func createUser(email: String, password: String, completion: @escaping (() -> ()))
    func getDocument()
    func addDocument(params: [String: Any])
}

class LaunchViewModel: LaunchViewModelProtocol {
    
//    private let config = GIDConfiguration(clientID: "759586729655-i34u2du1ssei0ieafrmrs157339fk5oq.apps.googleusercontent.com")
    weak var loadingDelegate: LoadingDelegate?

    func createUser(email: String, password: String, completion: @escaping (() -> ())) {
        loadingDelegate?.showLoading()
        Auth.auth().createUser(withEmail: email, password: password) {[weak self ] result, error in
            guard let self else { return }
            guard error == nil else {
                self.loadingDelegate?.showError(error: error?.localizedDescription)
                return
            }
            completion()
            self.loadingDelegate?.hideLoading()
            UserDefaults.saveUUID(id: result!.user.uid)
        }
    }
    
    let db = Firestore.firestore()
    
    func addDocument(params: [String: Any]){
        loadingDelegate?.showLoading()
        let docRef = db.collection("user").document(UserDefaults.getUIID())
        docRef.getDocument {[weak self] snapshot, error in
            guard let self else { return }
            guard let snapshot = snapshot else { return }
            self.loadingDelegate?.hideLoading()
            if snapshot.exists {
                docRef.updateData(params) { error in
                    if error == nil {
                        self.getDocument()
                    } else {
                        self.loadingDelegate?.showError(error: error?.localizedDescription)
                    }
                }
            } else {
                docRef.setData(params) { error in
                    if error == nil {
                        self.getDocument()
                    } else {
                        self.loadingDelegate?.showError(error: error?.localizedDescription)
                    }
                }
                
            }
        }
    }
    
    func getDocument(){
        db.collection("user").document(UserDefaults.getUIID()).getDocument {[weak self] snapshot, error in
            guard let self else { return }
            if let snapshot = snapshot {
                guard let data = snapshot.data() else {
                    self.loadingDelegate?.showError(error: error?.localizedDescription)
                    return
                }
                do {
                    let json = try JSONSerialization.data(withJSONObject: data)
                    if let model: Task = Uzum.toValue(json) {
                        print(model.task)
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
    
}
