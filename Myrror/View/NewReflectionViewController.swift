//
//  NewReflectionViewController.swift
//  Myrror
//
//  Created by Lais Godinho on 08/09/22.
//

import UIKit
import Lottie

class NewReflectionViewController: UIViewController{
    var navigationTitle : String = ""
    var viewModel = ReflectionViewModel()
    var selectedEmoji = ""
    var reflectionIndex:Int? = nil
    
    lazy var pageTitle : UITextField = {
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = navigationTitle
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    let reflectionText : UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 10, y: 10, width: 30, height: 10)
        textView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.textAlignment = .justified
        textView.backgroundColor = .systemFill
        textView.layer.cornerRadius = 8
        textView.text = "Insira aqui uma descrição"
        textView.textColor = UIColor(named: "SecondaryText")
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let subTitle : UILabel = {
        let subTitle = UILabel()
        subTitle.text = "Como isso te faz se sentir?"
        subTitle.font = UIFont.boldSystemFont(ofSize: 20)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    

    lazy var emojiView : UIStackView = {
        let stackView = UIStackView()
        stackView.layer.cornerRadius = 8
        stackView.distribution = .equalCentering
        stackView.backgroundColor = .systemFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let emojisName : [String] = ["desesperado", "triste", "indiferente", "feliz", "confiante"]
        let tapRecognizer = UITapGestureRecognizer(target: NewReflectionViewController.self, action: #selector(handleEmojiTap(sender:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        stackView.addGestureRecognizer(tapRecognizer)
        stackView.isUserInteractionEnabled = true

       
        // MARK: Não esquecer de configurar!!!
        for i in 0...4 {
            let animationView = AnimationView()
           
            if (selectedEmoji == emojisName[i]){
                animationView.animation = Animation.named("\(emojisName[i])")
            } else {
                animationView.animation = Animation.named("\(emojisName[i])-cinza")
            }
           
            animationView.contentMode = .scaleAspectFit
            animationView.layer.cornerRadius = 8
            animationView.loopMode = .repeat(1)
            animationView.accessibilityLabel = emojisName[i]
            animationView.isAccessibilityElement = true
            stackView.addArrangedSubview(animationView)
            animationView.translatesAutoresizingMaskIntoConstraints = false
            animationView.widthAnchor.constraint(equalTo: animationView.heightAnchor).isActive = true
            stackView.isUserInteractionEnabled = true
        }
        return stackView
    }()
    
    lazy var saveReflectionButton : UIButton = {
        var configButton = UIButton.Configuration.filled()
        configButton.image = UIImage(systemName: "square.and.arrow.down")
        configButton.title = "Finalizar"
        configButton.imagePadding = 150
        
        let button = UIButton(type: .system)
        button.configuration = configButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(saveReflection), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Primary")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewReflectionViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(NewReflectionViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        configKeyBoardTapGesture()
        configEmojiTapGesture()
        
        view.addSubview(pageTitle)
        view.addSubview(saveReflectionButton)
        view.addSubview(reflectionText)
        view.addSubview(subTitle)
        view.addSubview(emojiView)
        
        setConstraints()
    }
    
    lazy var reflectionTextHeightConstraint: NSLayoutConstraint = {
        self.reflectionText.heightAnchor.constraint(equalToConstant:view.bounds.height/3)
    }()
    
    func setConstraints() {
        
        let pageTitleConstraints = [
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        
        let reflectionTextConstraints = [
            reflectionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reflectionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            reflectionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            reflectionText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            reflectionTextHeightConstraint
        ]
        
        let subTitleConstraints = [
            subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            subTitle.topAnchor.constraint(equalTo: reflectionText.bottomAnchor, constant: 40)
        ]
        
        let emojiViewConstraints = [
            emojiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            emojiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            emojiView.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20) ,
            emojiView.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let saveReflectionButtonConstraints = [
            saveReflectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveReflectionButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
            saveReflectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            saveReflectionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            saveReflectionButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(pageTitleConstraints)
        NSLayoutConstraint.activate(reflectionTextConstraints)
        NSLayoutConstraint.activate(subTitleConstraints)
        NSLayoutConstraint.activate(emojiViewConstraints)
        NSLayoutConstraint.activate(saveReflectionButtonConstraints)
    }
    
    @objc func keyboardWillShow (sender: NSNotification) {
        //view.keyboardLayoutGuide.layoutFrame.height
        if (self.reflectionTextHeightConstraint.constant == self.view.bounds.height/3 - 170) {
            UIView.animate(withDuration: 0.75) {
                self.reflectionTextHeightConstraint.constant = self.view.bounds.height/3 - 200 > 50 ? self.view.bounds.height/3 - 200 : 50
            }
        }
        else {
            UIView.animate(withDuration: 0.75) {
                self.reflectionTextHeightConstraint.constant = self.view.bounds.height/3 - 170 > 50 ? self.view.bounds.height/3 - 170 : 50
            }
        }
        
        
        if (reflectionText.textColor == UIColor(named: "SecondaryText")) {
            reflectionText.text = ""
            reflectionText.textColor = UIColor(named: "TextColor")
        }
    }
    
    @objc func keyboardWillHide (sender: NSNotification) {
        //view.keyboardLayoutGuide.layoutFrame.height
        UIView.animate(withDuration: 0.75) {
            self.reflectionTextHeightConstraint.constant = self.view.bounds.height/3
        }
        if (reflectionText.text == "") {
            reflectionText.textColor = UIColor(named: "SecondaryText")
            reflectionText.text = "Insira aqui uma descrição"
        }
    }
    
    func configKeyBoardTapGesture(){
        let gesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(gesture)
    }
    
    func configEmojiTapGesture(){
        for emoji in emojiView.arrangedSubviews {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleEmojiTap(sender: )))
            tapRecognizer.numberOfTapsRequired = 1
            tapRecognizer.numberOfTouchesRequired = 1
            emoji.addGestureRecognizer(tapRecognizer)
            emoji.isUserInteractionEnabled = true
        }
    }
    
    @objc func handleEmojiTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
        let haptics = UISelectionFeedbackGenerator()
        haptics.selectionChanged()
        guard let animationView = sender.view as? AnimationView else { return }
        if sender.state == .ended {
            
            for emoji in emojiView.subviews {
                if emoji.accessibilityLabel != animationView.accessibilityLabel {
                    let notSelectedAnimation = emoji as? AnimationView
                    notSelectedAnimation?.animation = Animation.named("\(emoji.accessibilityLabel!)-cinza")
                    notSelectedAnimation?.stop()
                } else {
                    animationView.animation = Animation.named(animationView.accessibilityLabel!)
                    selectedEmoji = animationView.accessibilityLabel!
                    animationView.play()
                }
                
            }
        }
    }
    
    @objc func saveReflection() {
        let haptics = UINotificationFeedbackGenerator()
        haptics.notificationOccurred(.success)
        
        guard let viewController = navigationController?.viewControllers[0] as? ViewController else {return}
        
        guard let title = pageTitle.text else {
            return
        }
        
        if title == "" {
            let alert = UIAlertController(title: "Título não informado", message: "Dê um título a sua reflection de tema livre", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if (selectedEmoji != ""  || reflectionText.text != "Insira aqui uma descrição") && title != ""  {
            if (reflectionText.text == "Insira aqui uma descrição"){
                reflectionText.text = ""
            }
            if reflectionIndex != nil {
                viewModel.updateReflection(index: reflectionIndex!, subject: navigationTitle, text: reflectionText.text, emoji: selectedEmoji)
            } else{
                viewModel.addReflection(date: viewController.selectedDate ,subject: navigationTitle, textoReflection: reflectionText.text, emoji: selectedEmoji)
            }
            navigationController?.popToRootViewController(animated: true)
        }else{
            let alert = UIAlertController(title: "Nenhuma informação!", message: "Adicione alguma informação para a sua reflection!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
