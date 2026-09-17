//
//  ViewController.swift
//  MyConcertApp
//
//  Created by Can on 12.07.2026.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let artists: [Artist] = [
        Artist(
            name: "Ati242",
            songs: [
                Song(name: "Kalbim Yanımda", videoName: "Kalbim Yanımda", lyricsFile: "Kalbim Yanımda"),
                Song(name: "25", videoName: "25", lyricsFile: "25"),
                Song(name: "Değişmene Rağmen", videoName: "Değişmene Rağmen", lyricsFile: "Değişmene Rağmen"),
                Song(name: "Kaptan", videoName: "Kaptan", lyricsFile: "Kaptan"),
                Song(name: "Yarasalar", videoName: "Yarasalar", lyricsFile: "Yarasalar"),
                Song(name: "Intro", videoName: "Intro", lyricsFile: "Intro"),
                Song(name: "Maybach", videoName: "Maybach", lyricsFile: "Maybach"),
                Song(name: "Gülşen", videoName: "Gülşen", lyricsFile: "Gülşen"),
                Song(name: "Italy Forma", videoName: "Italy Forma", lyricsFile: "Italy Forma"),
                Song(name: "Telefon", videoName: "Telefon", lyricsFile: "Telefon"),
                Song(name: "Ait Hissetmiyorum", videoName: "Ait Hissetmiyorum", lyricsFile: "Ait Hissetmiyorum"),
                Song(name: "Keşke", videoName: "Keşke", lyricsFile: "Keşke"),
                Song(name: "Sönen Sigaralar", videoName: "Sönen Sigaralar", lyricsFile: "Sönen Sigaralar"),
                Song(name: "Her Neredeysen", videoName: "Her Neredeysen", lyricsFile: "Her Neredeysen"),
                Song(name: "Hoşçakal Ati", videoName: "Hoşçakal Ati", lyricsFile: "Hoşçakal Ati"),
                Song(name: "Shoote Shoote", videoName: "Shoote Shoote", lyricsFile: "Shoote Shoote"),
                Song(name: "Mavi Chivas", videoName: "Mavi Chivas", lyricsFile: "Mavi Chivas"),
                Song(name: "Sıfırdan Zirveye", videoName: "Sıfırdan Zirveye", lyricsFile: "Sıfırdan Zirveye"),
                Song(name: "Yıldızlar Parlar", videoName: "Yıldızlar Parlar", lyricsFile: "Yıldızlar Parlar"),
                Song(name: "Maraton", videoName: "Maraton", lyricsFile: "Maraton")
            ]
        ),
        Artist(
            name: "Emre Aydın",
            songs: [
                Song(name: "Kim Dokunduysa Sana Ona Git", videoName: "Kim Dokunduysa Sana Ona Git", lyricsFile: "Kim Dokunduysa Sana Ona Git"),
                Song(name: "Git", videoName: "Git", lyricsFile: "Git"),
                Song(name: "Anlıyorsun Değil Mi", videoName: "Anlıyorsun Değil Mi", lyricsFile: "Anlıyorsun Değil Mi"),
                Song(name: "Bir Pazar Kahvaltısı", videoName: "Bir Pazar Kahvaltısı", lyricsFile: "Bir Pazar Kahvaltısı"),
                Song(name: "Alıştım Susmaya", videoName: "Alıştım Susmaya", lyricsFile: "Alıştım Susmaya"),
                     Song(name: "Sen Beni Unutamazsın", videoName: "Sen Beni Unutamazsın", lyricsFile: "Sen Beni Unutamazsın"),
                Song(name: "Beni Vurup Yerde Bırakma", videoName: "Beni Vurup Yerde Bırakma", lyricsFile: "Beni Vurup Yerde Bırakma"),
                Song(name: "Tam Dört Yıl Olmuş Dün", videoName: "Tam Dört Yıl Olmuş Dün", lyricsFile: "Tam Dört Yıl Olmuş Dün"),
                Song(name: "Hoşçakal" , videoName: "Hoşçakal", lyricsFile: "Hoşçakal"),
                Song(name: "Belki Bir Gün Özlersin", videoName: "Belki Bir Gün Özlersin", lyricsFile: "Belki Bir Gün Özlersin"),
                Song(name: "Afilli Yalnızlık", videoName: "Afilli Yalnızlık", lyricsFile: "Afilli Yalnızlık")
                
            ]
        ),
        Artist(
            name: "Mlisa",
            songs: [
                Song(name: "Arabalar", videoName: "Arabalar", lyricsFile: "Arabalar"),
                Song(name: "Salına Salına", videoName: "Salına Salına", lyricsFile: "Salına Salına"),
                Song(name: "Gecelerde", videoName: "Gecelerde", lyricsFile: "Gecelerde"),
                Song(name: "Kim Bilir", videoName: "Kim Bilir", lyricsFile: "Kim Bilir"),
                Song(name: "Aç Yaralar", videoName: "Aç Yaralar", lyricsFile: "Aç Yaralar"),
                     Song(name: "Dekor", videoName: "Dekor", lyricsFile: "Dekor"),
                Song(name: "Şu Halime Baksana", videoName: "Şu Halime Baksana", lyricsFile: "Şu Halime Baksana"),
                Song(name: "Damlalar", videoName: "Damlalar", lyricsFile: "Damlalar"),
                Song(name: "Daha Mutlu Olamam" , videoName: "Daha Mutlu Olamam", lyricsFile: "Daha Mutlu Olamam"),
                Song(name: "Vurdum Tellerine", videoName: "Vurdum Tellerine", lyricsFile: "Vurdum Tellerine"),
               
                
            ]
        ),
        Artist(
            name: "Kendimden Hallice",
            songs: [
                Song(name: "Senden Sonrası Yalan", videoName: "Senden Sonrası Yalan", lyricsFile: "Senden Sonrası Yalan"),
                Song(name: "Üzülmeye Nereden Başlasak", videoName: "Üzülmeye Nereden Başlasak", lyricsFile: "Üzülmeye Nereden Başlasak"),
                Song(name: "Unutulmayan Hep Biri Vardır", videoName: "Unutulmayan Hep Biri Vardır", lyricsFile: "Unutulmayan Hep Biri Vardır"),
                Song(name: "Sakince Yoruldum", videoName: "Sakince Yoruldum", lyricsFile: "Sakince Yoruldum"),
                Song(name: "Soğuk Şarap", videoName: "Soğuk Şarap", lyricsFile: "Soğuk Şarap"),
                     Song(name: "Düşer O", videoName: "Düşer O", lyricsFile: "Düşer O"),
                Song(name: "Böyle Gitme",videoName: "Böyle Gitme", lyricsFile: "Böyle Gitme")
               
               ]
        ),
        Artist(
            name: "Fatma Turgut",
            songs: [
                Song(name: "İkimizden Biri", videoName: "İkimizden Biri", lyricsFile: "İkimizden Biri"),
                Song(name: "Bir Varmış Bir Yokmuş", videoName: "Bir Varmış Bir Yokmuş", lyricsFile: "Bir Varmış Bir Yokmuş"),
                Song(name: "Bir Pazar Kahvaltısı F", videoName: "Bir Pazar Kahvaltısı F", lyricsFile: "Bir Pazar Kahvaltısı F"),
                Song(name: "Sen Ona Aşıksın", videoName: "Sen Ona Aşıksın", lyricsFile: "Sen Ona Aşıksın"),
                Song(name: "Bir Melek Vardı", videoName: "Bir Melek Vardı", lyricsFile: "Bir Melek Vardı"),
                     Song(name: "AntiDepresan Gülümsemesi", videoName: "AntiDepresan Gülümsemesi", lyricsFile: "AntiDepresan Gülümsemesi"),
                Song(name: "Hata",videoName: "Hata", lyricsFile: "Hata"),
                Song(name: "Mey",videoName: "Mey", lyricsFile: "Mey"),
                Song(name: "Pembe Mezarlık",videoName: "Pembe Mezarlık", lyricsFile: "Pembe Mezarlık"),
                Song(name: "Değmesin Ellerimiz",videoName: "Değmesin Ellerimiz", lyricsFile: "Değmesin Ellerimiz")
                
               
               ]
        ),
        Artist(
            name: "Pinhani",
            songs: [
                Song(name: "Hele Bi Gel", videoName: "Hele Bi Gel", lyricsFile: "Hele Bi Gel"),
                Song(name: "Beni Al", videoName: "Beni Al", lyricsFile: "Beni Al"),
                Song(name: "Sevmekten Usanmam", videoName: "Sevmekten Usanmam", lyricsFile: "Sevmekten Usanmam"),
                Song(name: "Ben Nasıl Büyük Adam Olucam", videoName: "Ben Nasıl Büyük Adam Olucam", lyricsFile: "Ben Nasıl Büyük Adam Olucam"),
                Song(name: "Dön Bak Dünyaya", videoName: "Dön Bak Dünyaya", lyricsFile: "Dön Bak Dünyaya")
            ] ),
       Artist(
        name: "Arem Arman",
        songs:
            [
                Song(name: "Astronaut In The Ocean", videoName: "Astronaut In The Ocean", lyricsFile: "Astronaut In The Ocean"),
                Song(name: "Flo Rida Low", videoName: "Flo Rida Low", lyricsFile: "Flo Rida Low"),
                Song(name: "Aşkın Olayım", videoName: "Aşkın Olayım", lyricsFile: "Aşkın Olayım"),
                Song(name: "Manifest", videoName: "Manifest", lyricsFile: "Manifest"),
                Song(name: "Beggin", videoName: "Beggin", lyricsFile: "Beggin"),
                Song(name: "Bir Derdim Var", videoName: "Bir Derdim Var", lyricsFile: "Bir Derdim Var"),
                Song(name: "Anormal", videoName: "Anormal", lyricsFile: "Anormal"),
                Song(name: "LvbelC5", videoName: "LvbelC5", lyricsFile: "LvbelC5"),
                Song(name: "10 Numara", videoName: "10 Numara", lyricsFile: "10 Numara"),
                Song(name: "Zehir Remix", videoName: "Zehir Remix", lyricsFile: "Zehir Remix"),
                Song(name: "Freed From Desire", videoName: "Freed From Desire", lyricsFile: "Freed From Desire"),
                
            ]
       ),
        
       Artist(
        name: "Yüksek Sadakat",
        songs: [
            Song(name: "Belki Üstümüzden Bir Kuş Geçer", videoName: "Belki Üstümüzden Bir Kuş Geçer", lyricsFile: "Belki Üstümüzden Bir Kuş Geçer"),
            Song(name: "Fener", videoName: "Fener", lyricsFile: "Fener"),
            Song(name: "Aşk Durdukça", videoName: "Aşk Durdukça", lyricsFile: "Aşk Durdukça"),
            Song(name: "Dönceceksin Diye Söz Ver", videoName:"Döneceksin Diye Söz Ver" , lyricsFile: "Döneceksin Diye Söz Ver"),
            Song(name: "Kafile", videoName: "Kafile", lyricsFile: "Kafile"),
            Song(name: "Haydi Gel İçelim", videoName: "Haydi Gel İçelim", lyricsFile: "Haydi Gel İçelim")
        ]
       ),
        
       Artist(
        name: "Derya Uluğ",
        songs: [
            Song(name: "Okyanus", videoName: "Okyanus", lyricsFile: "Okyanus"),
            Song(name: "Kanunlar Gibi", videoName: "Kanunlar Gibi", lyricsFile: "Kanunlar Gibi"),
            Song(name: "Sana Çıkıyor Yollar", videoName: "Sana Çıkıyor Yollar", lyricsFile: "Sana Çıkıyor Yollar"),
            Song(name: "Gel Yabani", videoName: "Gel Yabani", lyricsFile: "Gel Yabani"),
            Song(name: "Gibi Gibi", videoName: "Gibi Gibi", lyricsFile: "Gibi Gibi"),
            Song(name: "Yansıma", videoName: "Yansıma", lyricsFile: "Yansıma"),
            Song(name: "Çakkıdı", videoName: "Çakkıdı", lyricsFile: "Çakkıdı"),
            Song(name: "Şans Meleğim", videoName: "Şans Meleğim", lyricsFile: "Şans Meleğim"),
            Song(name: "Öp", videoName: "Öp", lyricsFile: "Öp")
        ]
       ),
        Artist(
            name: "Manga",
            songs: [
                Song(name: "Dursun Zaman", videoName: "Dursun Zaman", lyricsFile: "Dursun Zaman"),
                Song(name: "Cevapsız Sorular", videoName: "Cevapsız Sorular", lyricsFile: "Cevapsız Sorular"),
                Song(name: "Haykıracak Nefesim", videoName: "Haykıracak Nefesim", lyricsFile: "Haykıracak Nefesim"),
                Song(name: "Dünyanın Sonuna Doğmuşum", videoName: "Dünyanın Sonuna Doğmuşum", lyricsFile: "Dünyanın Sonuna Doğmuşum")
            ]
        ),
        Artist(
            name: "Blok 3",
            songs: [
                Song(name: "Baba", videoName: "Baba", lyricsFile: "Baba"),
                Song(name: "Escobar", videoName: "Escobar", lyricsFile: "Escobar"),
                Song(name: "Vur", videoName: "Vur", lyricsFile: "Vur"),
                Song(name: "Affetmem", videoName: "Affetmem", lyricsFile: "Affetmem" ),
                Song(name: "Patlat", videoName: "Patlat", lyricsFile: "Patlat"),
                Song(name: "Yaptırıcaz Tırnaklarını", videoName: "Yaptırıcaz Tırnaklarını", lyricsFile: "Yaptırıcaz Tırnaklarını"),
                Song(name: "Güzel Ve İddialı", videoName: "Güzel Ve İddialı", lyricsFile: "Güzel Ve İddialı"),
                Song(name: "Kırgınım", videoName: "Kırgınım", lyricsFile: "Kırgınım"),
                Song(name: "BayBay", videoName: "BayBay", lyricsFile: "BayBay"),
                Song(name: "Gelme İstemem", videoName: "Gelme İstemem", lyricsFile: "Gelme İstemem"),
                Song(name: "Naptığını Bilmesem De", videoName: "Naptığını Bilmesem de", lyricsFile: "Naptığını Bilmesem De"),
                Song(name: "Kayıp Kalp", videoName: "Kayıp Kalp", lyricsFile: "Kayıp Kalp"),
                Song(name: "Mosmor Perde", videoName: "Mosmor Perde", lyricsFile: "Mosmor Perde"),
                Song(name: "Kusura Bakma", videoName: "Kusura Bakma", lyricsFile: "Kusura Bakma"),
                Song(name: "Habibi", videoName: "Habibi", lyricsFile: "Habibi"),
                Song(name: "Uyuz", videoName: "Uyuz", lyricsFile: "Uyuz"),
                Song(name: "Değiştiremezsin Yazılmışsa", videoName: "Değiştiremezsin Yazılmışsa", lyricsFile: "Değiştiremezsin Yazılmışsa"),
                Song(name: "Git Blok3", videoName: "Git Blok3", lyricsFile: "Git Blok3"),
                Song(name: "Sebebi Yar", videoName: "Sebebi Yar", lyricsFile: "Sebebi Yar"),
                Song(name: "Napıyosun Mesela", videoName: "Napıyosun Mesela", lyricsFile: "Napıyosun Mesela"),
                Song(name: "Sevmeyi Denemedin", videoName: "Sevmeyi Denemedin", lyricsFile: "Sevmeyi Denemedin"),
                Song(name: "Salla Salla", videoName: "Salla Salla", lyricsFile: "Salla Salla"),
                Song(name: "Zehirli Gül", videoName: "Zehirli Gül", lyricsFile: "Zehirli Gül"),
                Song(name: "Çok Güzel Gülüyorsun", videoName: "Çok Güzel Gülüyorsun", lyricsFile: "Çok Güzel Gülüyorsun")
                
                
            ]
            
        ),
        
        Artist(
            name: "Manifest",
            songs: [
                Song(name: "Manifest Giriş", videoName: "Manifest Giriş", lyricsFile: "Manifest Giriş"),
                Song(name: "Manifest Dans", videoName: "Manifest Dans", lyricsFile: "Manifest Dans"),
                Song(name: "Hilal", videoName: "Hilal", lyricsFile: "Hilal"),
                Song(name: "Sueda", videoName: "Sueda", lyricsFile: "Sueda"),
                Song(name: "Lidya", videoName: "Lidya", lyricsFile: "Lidya"),
                Song(name: "Mina", videoName: "Mina", lyricsFile: "Mina"),
                Song(name: "Zoktay", videoName: "Zoktay", lyricsFile: "Zoktay"),
                Song(name: "Toz Pembe", videoName: "Toz Pembe", lyricsFile: "Toz Pembe"),
                Song(name: "Daha İyi", videoName: "Daha İyi", lyricsFile: "Daha İyi"),
                Song(name: "Zamansızdık", videoName: "Zamansızdık", lyricsFile: "Zamansızdık"),
                Song(name: "Arıyo", videoName: "Arıyo", lyricsFile: "Arıyo"),
                Song(name: "Snap", videoName: "Snap", lyricsFile: "Snap"),
                Song(name: "Hileli", videoName: "Hileli", lyricsFile: "Hileli"),
                Song(name: "Yaşanacaksa", videoName: "Yaşanacaksa", lyricsFile: "Yaşanacaksa"),
                Song(name: "Rüya", videoName: "Rüya", lyricsFile: "Rüya"),
                Song(name: "Başrol Sensin", videoName: "Başrol Sensin", lyricsFile: "Başrol Sensin"),
                Song(name: "Zehir Motive", videoName: "Zehir Motive", lyricsFile: "Zehir Motive"),
                Song(name: "Pvg", videoName: "Pvg", lyricsFile: "Pvg"),
                
            ]
        ),
        
       
        
        
        
         
        
      
        
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Artists"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 85
        view.backgroundColor = UIColor(
            red: 10/255,
            green: 20/255,
            blue: 60/255,
            alpha: 1
        )

        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    
    }
    override func prepare(
            for segue: UIStoryboardSegue,
            sender: Any?
        ) {
            if segue.identifier == "toSongsVC",
               let songsVC = segue.destination as? SongsViewController,
               let selectedArtist = sender as? Artist {

                songsVC.selectedArtist = selectedArtist
            }
        }
    }

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(
            _ tableView: UITableView,
            numberOfRowsInSection section: Int
    ) -> Int {
            return artists.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath) as! ArtistTableViewCell

        let artist = artists[indexPath.row]

        cell.artistNameLabel.text = artist.name
        cell.artistImageView.image = UIImage(named: artist.name)
       

        cell.backgroundColor = UIColor(
            red: 35/255,
            green: 45/255,
            blue: 90/255,
            alpha: 0.9
        )
        let arrow = UIImageView(image: UIImage(systemName: "chevron.right"))
        arrow.tintColor = .white
        arrow.contentMode = .scaleAspectFit
        arrow.frame = CGRect(x: 0, y: 0, width: 18, height: 18)

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

            let selectedArtist = artists[indexPath.row]

            performSegue(
                withIdentifier: "toSongsVC",
                sender: selectedArtist
            )
        }
    }
   


