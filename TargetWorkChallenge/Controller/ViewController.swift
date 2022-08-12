//
//  ViewController.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 04/08/22.
//

import UIKit
import FeedKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let controller = FeedController(feedUrl: "https://g1.globo.com/rss/g1/carros")
    
    // MARK: - INICIALIZADOR
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - METODOS PRIVADOS
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = HeaderViewController()
            header.commonInit()
            return header
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 150
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "InfosUIViewController") as? InfosUIViewController else {return}
        viewController.feeds = controller.loadRSS()[indexPath.row]
        self.present(viewController, animated: true)
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as? FeedTableViewCell else {return UITableViewCell()}
        let title = controller.loadRSS()[indexPath.row].title ?? ""
        let description = controller.loadRSS()[indexPath.row].description ?? ""
        let imageURL = controller.loadRSS()[indexPath.row].media?.mediaContents?.first?.attributes?.url ?? ""
        cell.setup(title: title, description: description, image: imageURL)
        return cell
    }
    
    func irParaInfos(_ infos: RSSFeedItem?) {
        let infosController = InfosUIViewController.init(nibName: "InfosUIViewController", bundle: nil)
        navigationController?.pushViewController(infosController, animated: true)
    }
}
