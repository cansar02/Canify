//
//  SongsViewController.swift
//  MyConcertApp
//
//  Created by Can on 13.07.2026.
//

import Foundation

import UIKit

class SongsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var selectedArtist: Artist?

    var songs: [Song] = []
    
    private let artistNameLabel: UILabel = {
           let label = UILabel()
           label.textColor = .white
           label.font = UIFont.systemFont(
               ofSize: 34,
               weight: .bold
           )
           label.numberOfLines = 1
           return label
       }()

       private let songCountLabel: UILabel = {
           let label = UILabel()
           label.textColor = .systemTeal
           label.font = UIFont.systemFont(
               ofSize: 20,
               weight: .semibold
           )
           return label
       }()


    override func viewDidLoad() {
        super.viewDidLoad()

        songs = (selectedArtist?.songs ?? []).sorted {
            $0.name.compare(
                $1.name,
                locale: Locale(identifier: "tr_TR")
                ) == .orderedAscending
        }

        setupScreen()
        setupTableHeader()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    private func setupScreen() {
           view.backgroundColor = UIColor(
               red: 22/255,
               green: 18/255,
               blue: 45/255,
               alpha: 1
           )

           tableView.backgroundColor = .clear
           tableView.separatorStyle = .none
           tableView.rowHeight = 84

           navigationController?.navigationBar.tintColor = .white
           navigationItem.largeTitleDisplayMode = .never
       }
    private func setupTableHeader() {
         let headerView = UIView(
             frame: CGRect(
                 x: 0,
                 y: 0,
                 width: tableView.bounds.width,
                 height: 125
             )
         )

         artistNameLabel.text = selectedArtist?.name
         songCountLabel.text = "\(songs.count) Tracks"

         artistNameLabel.frame = CGRect(
             x: 24,
             y: 24,
             width: headerView.bounds.width - 48,
             height: 44
         )

         songCountLabel.frame = CGRect(
             x: 24,
             y: 72,
             width: headerView.bounds.width - 48,
             height: 24
         )

         headerView.addSubview(artistNameLabel)
         headerView.addSubview(songCountLabel)

         tableView.tableHeaderView = headerView
     }

        
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier == "toSongDetailVC",
           let detailVC = segue.destination as? SongDetailViewController,
           let selectedSong = sender as? Song {

            detailVC.selectedSong = selectedSong
        }
    }
}

extension SongsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return songs.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SongCell",
            for: indexPath
        )
        let song = songs[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = "♪  \(song.name)"
        cell.textLabel?.font = UIFont.systemFont(
            ofSize: 18,
            weight: .semibold
        )

        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none

        cell.contentView.backgroundColor = UIColor(
            red: 48/255,
            green: 42/255,
            blue: 82/255,
            alpha: 1
        )

        cell.contentView.layer.cornerRadius = 16
        cell.contentView.layer.masksToBounds = true
        
        let config = UIImage.SymbolConfiguration(
                    pointSize: 17,
                    weight: .bold
                )

        let arrow = UIImageView(image: UIImage(systemName: "chevron.right",withConfiguration: config))
        arrow.tintColor = .white
        arrow.contentMode = .scaleAspectFit

        cell.accessoryView = arrow

        

        return cell
    }
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
        let selectedSong = songs[indexPath.row]

        performSegue(
            withIdentifier: "toSongDetailVC",
            sender: selectedSong
        )
    }
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 78
    }

    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        cell.contentView.frame = cell.contentView.frame.inset(
            by: UIEdgeInsets(
                top: 6,
                left: 12,
                bottom: 6,
                right: 12
            )
        )
    }
    
}
