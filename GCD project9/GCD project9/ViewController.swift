//
//  ViewController.swift
//  GCD project9
//
//  Created by Артем Чжен on 14/04/23.
//

import UIKit

//class ViewController: UITableViewController {
//    var pictures = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Storm Viewer"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        //      Challenge #1
//        //      Modify project 1 so that loading the list of NSSL images from our bundle happens in the background. Make sure you call reloadData() on the table view once loading has finished!
//        performSelector(inBackground: #selector(loadPictures), with: nil)
//    }
//
//    @objc func loadPictures() {
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
////        print(items)
//
//        for item in items {
//            if item.hasPrefix("nssl") {
//                pictures.append(item)
//            }
//        }
////        print(pictures)
//        pictures.sort()
//    }
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pictures.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
//        cell.textLabel?.text = pictures[indexPath.row]
//        return cell
//    }
////
////    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        if let dc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
////            dc.selectedImage = pictures[indexPath.row]
////            dc.selectedPictureNumber = indexPath.row + 1
////            dc.totalPictures = pictures.count
////            navigationController?.pushViewController(dc, animated: true)
////
////
////        }
////
////    }
//}


//class ViewController: UIViewController {
//
//    var cluesLabel: UILabel!
//    var answersLabel: UILabel!
//    var currentAnswer: UITextField!
//    var scoreLabel: UILabel!
//    var letterButtons = [UIButton]()
//
//    var activatedButtons = [UIButton]()
//    var solutions = [String]()
//
//
//    var score = 0 {
//        didSet {
//            scoreLabel.text = "Score: \(score)"
//        }
//    }
//
//    var level = 1
//
//
//    override func loadView() {
//        view = UIView()
//        view.backgroundColor = .white
//
//
//        scoreLabel = UILabel()
//        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
//        scoreLabel.textAlignment = .right
//        scoreLabel.text = "Score: 0"
//        view.addSubview(scoreLabel)
//
//
//        cluesLabel = UILabel()
//        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
//        cluesLabel.font = UIFont.systemFont(ofSize: 24)
//        cluesLabel.text = "CLUES"
//        cluesLabel.numberOfLines = 0
//        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
//        view.addSubview(cluesLabel)
//
//        answersLabel = UILabel()
//        answersLabel.translatesAutoresizingMaskIntoConstraints = false
//        answersLabel.font = UIFont.systemFont(ofSize: 24)
//        answersLabel.text = "ANWERS"
//        answersLabel.numberOfLines = 0
//        answersLabel.textAlignment = .right
//        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
//
//        view.addSubview(answersLabel)
//
//        currentAnswer = UITextField()
//        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
//        currentAnswer.placeholder = "Tap letters to guess"
//        currentAnswer.textAlignment = .center
//        currentAnswer.font = UIFont.systemFont(ofSize: 44)
//        currentAnswer.isUserInteractionEnabled = false
//        view.addSubview(currentAnswer)
//
//        let submit = UIButton(type: .system)
//        submit.translatesAutoresizingMaskIntoConstraints = false
//        submit.setTitle("SUBMIT", for: .normal)
//        submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
//        view.addSubview(submit)
//
//        let clear = UIButton(type: .system)
//        clear.translatesAutoresizingMaskIntoConstraints = false
//        clear.setTitle("CLEAR", for: .normal)
//        clear.addTarget(self, action: #selector(clearTapped), for:  .touchUpInside)
//        view.addSubview(clear)
//
//        let buttonsView = UIView()
//        buttonsView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(buttonsView)
//
//        NSLayoutConstraint.activate([
//            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//
//            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
//            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
//            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
//
//            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
//            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
//            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
//            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
//
//            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
//            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
//
//            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
//            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
//            submit.heightAnchor.constraint(equalToConstant: 44),
//
//            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
//            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
//            clear.heightAnchor.constraint(equalToConstant: 44),
//
//            buttonsView.widthAnchor.constraint(equalToConstant: 750),
//            buttonsView.heightAnchor.constraint(equalToConstant: 320),
//            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
//            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
//        ])
//
//        let width = 150
//        let height = 80
//        buttonsView.layer.borderWidth = 1
//        buttonsView.layer.borderColor = UIColor.gray.cgColor
//
//        for row in 0..<4 {
//
//            for col in 0..<5 {
//                let letterButton = UIButton(type: .system)
//                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
//
//                letterButton.layer.borderWidth = 1
//                letterButton.layer.borderColor = UIColor.gray.cgColor
//
//                letterButton.setTitle("wWw", for: .normal)
//                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
//
//                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
//                letterButton.frame = frame
//
//                buttonsView.addSubview(letterButton)
//
//                letterButtons.append(letterButton)
//
//                buttonsView.backgroundColor = .white
//
//            }
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()

//        Chalange#2
//Modify project 8 so that loading and parsing a level takes place in the background. Once you’re done, make sure you update the UI on the main thread!

//DispatchQueue.global(qos: .userInitiated).async {
    //            [weak self] in
    //            self?.loadLevel()
    //        }
    //
    //    }
    //
    //    @objc func letterTapped(_ sender: UIButton) {
    //
    //        guard let buttonTitle = sender.titleLabel?.text else { return }
    //        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
    //        activatedButtons.append(sender)
    //        sender.isHidden = true
    //    }
    //
    //    @objc func submitTapped(_ sender: UIButton){
    //
    //        guard let answerText = currentAnswer.text else { return }
    //
    //        if answerText.isEmpty { return }
    //        if let solutionPosition = solutions.firstIndex(of: answerText) {
    //            activatedButtons.removeAll()
    //
    //            var splitAnswers =  answersLabel.text?.components(separatedBy: "\n")
    //            splitAnswers?[solutionPosition] = answerText
    //            answersLabel.text = splitAnswers?.joined(separator: "\n")
    //
    //            currentAnswer.text = ""
    //            //            let vc = UIAlertController(title: "Well, correct answer!", message: nil, preferredStyle: .alert)
    //            //            vc.addAction(UIAlertAction(title: "OK", style: .default))
    //            //            present(vc, animated: true)
    //            score += 1
    //
    //            //            if score % 7 == 0 {
    //            if letterButtons.allSatisfy({$0.isHidden}) {
    //                let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
    //                ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
    //                present(ac, animated: true)
    //            }
    //        } else {
    //            score -= 1
    //            let message = UIAlertController(title: "Wrong, no correct", message: "You spelled the word wrong", preferredStyle: .alert)
    //            message.addAction(UIAlertAction(title: "OK", style: .default))
    //            present(message, animated: true)
    //
    //        }
    //    }
    //
    //    func levelUp(action: UIAlertAction) {
    //        level += 1
    //        solutions.removeAll(keepingCapacity: true)
    //        DispatchQueue.global(qos: .userInitiated).async {
    //            [weak self] in
    //            self?.loadLevel()
    //        }
    //
    //        for btn in letterButtons {
    //            btn.isHidden = false
    //        }
    //    }
    //
    //    @objc func clearTapped(_ sender: UIButton){
    //
    //        currentAnswer.text = ""
    //
    //        for btn in activatedButtons {
    //            btn.isHidden = false
    //        }
    //
    //        activatedButtons.removeAll()
    //    }
    //
    //    func loadLevel() {
    //        var clueString = ""
    //        var solutionString = ""
    //        var letterBits = [String]()
    //
    //        if let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: "txt") {
    //            if let levelContents = try? String(contentsOf: levelFileURL) {
    //                var lines = levelContents.components(separatedBy: "\n")
    //                lines.shuffle()
    //
    //                for(index, line) in lines.enumerated() {
    //                    let parts = line.components(separatedBy: ": ")
    //                    let answer = parts[0]
    //                    let clue = parts[1]
    //
    //                    clueString += "\(index + 1). \(clue)\n"
    //
    //                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
    //                    solutionString += "\(solutionWord.count) letters\n"
    //                    solutions.append(solutionWord)
    //
    //                    let bits = answer.components(separatedBy: "|")
    //                    letterBits += bits
    //                }
    //            }
    //        }
    //        //        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
    //        //        answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
    //
    //        letterBits.shuffle()
    //
    //        DispatchQueue.main.async {
    //            [weak self] in
    //            self?.cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
    //            self?.answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
    //
    //            if let letterButtons = self?.letterButtons {
    //                if letterBits.count == letterButtons.count {
    //                    for i in 0 ..< letterButtons.count {
    //                        letterButtons[i].setTitle(letterBits[i], for: .normal)
    //
    //                    }
    //                }
    //
    //            }
    //        }
    //    }
    //}
    
    
    
class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filtredPetition = [Petition]()
    var words = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(didTabButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(filter))
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
                showError()
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    @objc func didTabButton() {
        //        navigationController?.pushViewController(SeconViewController(), animated: true)
        let ac = UIAlertController(title: "Credits", message: "The data comes from the We The People API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func filter() {
        
        let ac = UIAlertController(title: "Filters", message: "Write the filter criteria", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "OK", style: .default) {
            [weak self, weak ac] _ in
            self?.words = ac?.textFields?[0].text ?? ""
            DispatchQueue.global().async {
                [weak self] in
                self?.filterTwo()
            }
            
            DispatchQueue.global().async {
                [weak self] in
                self?.tableView.reloadData()
            }
        })
        present(ac, animated: true)
    }
    func filterTwo() {
        if words.isEmpty {
            filtredPetition = petitions
            return
        }
        filtredPetition = petitions.filter({$0.title.lowercased().contains(words.lowercased()) ||  $0.title.lowercased().contains(words.lowercased())})
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredPetition.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filtredPetition[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filtredPetition[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
