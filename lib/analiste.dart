import 'package:flutter/material.dart';
import 'profil.dart';
import 'detay.dart';
import 'ekle.dart';

class ListeEkrani extends StatefulWidget {
  final String email;
  final String adSoyad;
  final String rol;

  const ListeEkrani({
    super.key,
    required this.email,
    required this.adSoyad,
    required this.rol,
  });

  @override
  State<ListeEkrani> createState() => _ListeEkraniState();
}

class _ListeEkraniState extends State<ListeEkrani> {
  final List<Map<String, dynamic>> kampanyalar = [
    {"baslik": "Okul Kütüphanesi", "hedef": 5000, "toplanan": 1250},
    {"baslik": "Sokak Hayvanları", "hedef": 3000, "toplanan": 3000},
    {"baslik": "Afet Bölgesi Destek", "hedef": 10000, "toplanan": 4500},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aktif Kampanyalar"),
        backgroundColor: Colors.pink[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileEkrani(
                    email: widget.email,
                    adSoyad: widget.adSoyad,
                    rol: widget.rol,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: kampanyalar.length,
        itemBuilder: (context, index) {
          final kampanya = kampanyalar[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListTile(
              title: Text(kampanya["baslik"]),
              subtitle: Text(
                "Hedef: ${kampanya["hedef"]} TL | Toplanan: ${kampanya["toplanan"]} TL",
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                final bagisMiktari = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetayEkrani(
                      baslik: kampanya["baslik"],
                      hedef: kampanya["hedef"],
                      toplanan: kampanya["toplanan"],
                    ),
                  ),
                );

                if (bagisMiktari != null && bagisMiktari is int) {
                  setState(() {
                    kampanyalar[index]["toplanan"] =
                        kampanyalar[index]["toplanan"] + bagisMiktari;
                  });
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: widget.rol == "Yönetici"
          ? FloatingActionButton(
              backgroundColor: Colors.pink[800],
              onPressed: () async {
                final yeniKampanya = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EklemeEkrani()),
                );

                if (yeniKampanya != null &&
                    yeniKampanya is Map<String, dynamic>) {
                  setState(() {
                    kampanyalar.add(yeniKampanya);
                  });
                }
              },
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}
