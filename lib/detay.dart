import 'package:flutter/material.dart';

class DetayEkrani extends StatefulWidget {
  final String baslik;
  final int hedef;
  final int toplanan;

  const DetayEkrani({
    super.key,
    required this.baslik,
    required this.hedef,
    required this.toplanan,
  });

  @override
  State<DetayEkrani> createState() => _DetayEkraniState();
}

class _DetayEkraniState extends State<DetayEkrani> {
  final _bagisController = TextEditingController();
  late int _guncelToplanan;

  @override
  void initState() {
    super.initState();
    _guncelToplanan = widget.toplanan;
  }

  @override
  void dispose() {
    _bagisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ilerleme = _guncelToplanan / widget.hedef;
    if (ilerleme > 1.0) ilerleme = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.baslik),
        backgroundColor: Colors.pink[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.baslik,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Hedef: ${widget.hedef} TL"),
            Text("Toplanan: $_guncelToplanan TL"),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: ilerleme,
              backgroundColor: Colors.grey[300],
              color: Colors.pink[800],
              minHeight: 15,
            ),
            const SizedBox(height: 10),
            Text("% ${(ilerleme * 100).toStringAsFixed(1)} tamamlandı"),
            const Divider(height: 40),
            TextField(
              controller: _bagisController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Bağış Miktarı (TL)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  int? miktar = int.tryParse(_bagisController.text.trim());
                  if (miktar != null && miktar > 0) {
                    setState(() {
                      _guncelToplanan += miktar;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("$miktar TL bağış yapıldı! Teşekkürler."),
                      ),
                    );
                    _bagisController.clear();

                    Navigator.pop(context, miktar);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Lütfen geçerli bir miktar girin!"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[800],
                ),
                child: const Text(
                  "BAĞIŞ YAP",
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
