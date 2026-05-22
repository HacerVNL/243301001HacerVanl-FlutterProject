import 'package:flutter/material.dart';
import 'analiste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bağış Takip',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _yeniEmail;
  String? _yeniSifre;
  String? _yeniAdSoyad;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _hesapOlusturBottomSheet() {
    final adController = TextEditingController();
    final emailController = TextEditingController();
    final sifreController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "YENİ HESAP OLUŞTUR",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: adController,
              decoration: const InputDecoration(
                labelText: "Ad Soyad",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "E-posta",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: sifreController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Şifre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (adController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    sifreController.text.isNotEmpty) {
                  setState(() {
                    _yeniEmail = emailController.text.trim();
                    _yeniSifre = sifreController.text.trim();
                    _yeniAdSoyad = adController.text.trim();
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Hesap başarıyla oluşturuldu! Giriş yapabilirsiniz.",
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[800],
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "KAYDOL",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _parolamiUnuttumBottomSheet() {
    final emailController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "PAROLAMI UNUTTUM",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 15),
            const Text(
              "Şifre sıfırlama bağlantısı gönderilecek e-posta adresinizi giriniz.",
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "E-posta",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isNotEmpty) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Şifre sıfırlama linki ${emailController.text.trim()} adresine gönderildi!",
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[800],
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Sıfırlama Linki Gönder",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Icon(Icons.volunteer_activism, size: 80, color: Colors.pink[800]),
              const SizedBox(height: 10),
              Text(
                "BAĞIŞ TAKİP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[900],
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "E-posta",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Şifre",
                  suffixIcon: const Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    if (email == "elifkaya@gmail.com" && password == "1111") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListeEkrani(
                            email: "elifkaya@gmail.com",
                            adSoyad: "Elif Kaya",
                            rol: "Yönetici",
                          ),
                        ),
                      );
                    } else if (email == "ahmetyilmaz@gmail.com" &&
                        password == "2222") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListeEkrani(
                            email: "ahmetyilmaz@gmail.com",
                            adSoyad: "Ahmet Yılmaz",
                            rol: "Kullanıcı",
                          ),
                        ),
                      );
                    } else if (_yeniEmail != null &&
                        email == _yeniEmail &&
                        password == _yeniSifre) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListeEkrani(
                            email: _yeniEmail!,
                            adSoyad: _yeniAdSoyad ?? "Yeni Kullanıcı",
                            rol: "Kullanıcı",
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Hatalı E-posta veya Şifre!"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "GİRİŞ YAP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: _hesapOlusturBottomSheet,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: BorderSide(color: Colors.pink[800]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "HESAP OLUŞTUR",
                  style: TextStyle(color: Colors.pink[800]),
                ),
              ),
              TextButton(
                onPressed: _parolamiUnuttumBottomSheet,
                child: Text(
                  "Parolamı Unuttum",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
