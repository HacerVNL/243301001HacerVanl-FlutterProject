import 'package:flutter/material.dart';

class EklemeEkrani extends StatefulWidget {
  const EklemeEkrani({super.key});

  @override
  State<EklemeEkrani> createState() => _EklemeEkraniState();
}

class _EklemeEkraniState extends State<EklemeEkrani> {
  final _baslikController = TextEditingController();
  final _hedefController = TextEditingController();

  @override
  void dispose() {
    _baslikController.dispose();
    _hedefController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Kampanya Ekle"),
        backgroundColor: Colors.pink[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _baslikController,
              decoration: const InputDecoration(
                labelText: "Kampanya Başlığı",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _hedefController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Hedef Tutar (TL)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String baslik = _baslikController.text.trim();
                  int? hedef = int.tryParse(_hedefController.text.trim());

                  if (baslik.isNotEmpty && hedef != null) {
                    Navigator.pop(context, {
                      "baslik": baslik,
                      "hedef": hedef,
                      "toplanan": 0,
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Lütfen geçerli bilgiler girin!"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[700],
                ),
                child: const Text(
                  "KAMPANYAYI EKLE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
