import 'package:flutter/material.dart';

class ProfileEkrani extends StatelessWidget {
  final String email;
  final String adSoyad;
  final String rol;

  const ProfileEkrani({
    super.key,
    required this.email,
    required this.adSoyad,
    required this.rol,
  });

  final List<Map<String, String>> tumLoglar = const [
    {
      "kullanici": "elifkaya@gmail.com",
      "islem": "Sisteme Giriş Yapıldı (Yönetici)",
      "tarih": "14.05.2026 10:30",
    },
    {
      "kullanici": "ahmetyilmaz@gmail.com",
      "islem": "Okul Kütüphanesi kampanyasına 100 TL bağış yapıldı",
      "tarih": "14.05.2026 11:15",
    },
    {
      "kullanici": "elifkaya@gmail.com",
      "islem": "Yeni kampanya oluşturuldu: 'Sokak Hayvanları'",
      "tarih": "14.05.2026 12:00",
    },
    {
      "kullanici": "ahmetyilmaz@gmail.com",
      "islem": "Sisteme Giriş Yapıldı",
      "tarih": "14.05.2026 13:45",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final gosterilecekLoglar = rol == "Yönetici"
        ? tumLoglar
        : tumLoglar.where((log) => log["kullanici"] == email).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil ve İşlem Geçmişi"),
        backgroundColor: Colors.pink[800],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            adSoyad,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text("$email ($rol)", style: const TextStyle(color: Colors.grey)),
          const Divider(height: 40),
          const Text(
            "İŞLEM LOGLARI",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: gosterilecekLoglar.length,
              itemBuilder: (context, index) {
                final log = gosterilecekLoglar[index];
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(log["islem"] ?? ""),
                  subtitle: Text(log["tarih"] ?? ""),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
