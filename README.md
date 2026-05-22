# Bağış Takip ve Hedef Belirleme Sistemi

Bu proje, mobil uygulama geliştirme dersi dönem sonu ödevi kapsamında Flutter framework'ü kullanılarak geliştirilmiş bir Bağış Takip ve Hedef Belirleme Sistemi uygulamasıdır. Uygulama içerisinde kullanıcı rolleri, dinamik bağış takibi, kampanya yönetimi ve işlem geçmişi loglama özellikleri yer almaktadır.

## Proje Özellikleri ve Gereklilikler

* *Çoklu Kullanıcı ve Rol Yönetimi:* Uygulamada Yönetici ve Standart Kullanıcı olmak üzere iki farklı rol yapısı kurgulanmıştır.
* *Dinamik Veri Akışı ve State Yönetimi:* Kampanya ekleme, bağış yapma ve toplanan tutarların anlık güncellenmesi süreçleri dinamik state yapısı ile yönetilmektedir.
* *Uygulama Ekranları:* Giriş Ekranı (Login), Hesap Oluşturma Penceresi, Parolamı Unuttum Penceresi, Aktif Kampanyalar Listesi (Ana Ekran), Kampanya Detay Ekranı, Yeni Kampanya Ekleme Ekranı ve Profil / İşlem Geçmişi (Log) Ekranı olmak üzere toplamda 5'ten fazla işlevsel ekrandan oluşmaktadır.
* *İşlem Geçmişi (Log Kaydı):* Kullanıcıların gerçekleştirdiği sisteme giriş, kampanya ekleme ve bağış yapma gibi tüm kritik aksiyonlar profil ekranında kronolojik log listesi olarak tutulmaktadır.

## Test Hesap Bilgileri

Uygulamayı test etmek için aşağıdaki kayıtlı hesapları kullanabilir veya Giriş Ekranındaki "Hesap Oluştur" butonu ile dinamik olarak yeni bir standart kullanıcı hesabı açabilirsiniz.

| E-posta Adresi | Şifre | Rolü | Tanımlı Yetkiler |
| :--- | :--- | :--- | :--- |
| elifkaya@gmail.com | 1111 | Yönetici | Yeni kampanya ekleyebilir, tüm sistem loglarını görebilir, bağış yapabilir. |
| ahmetyilmaz@gmail.com | 2222 | Kullanıcı | Aktif kampanyaları listeler, bağış yapabilir, sadece kendi loglarını görebilir. |

## Kullanılan Teknolojiler ve Mimari

* *Framework:* Flutter (Dart)
* *Veri Yönetimi:* StatefulWidget, Anlık State Güncellemesi (setState) ve Sayfalar Arası Veri Geri Dönüş Mekanizmaları (Navigator.pop veri nesnesi transferi)
* *Veri Depolama Yapısı:* Firebase / Supabase servis entegrasyon şemasına uygun, uygulama içi asenkron çalışan dinamik bellek koleksiyonları (List<Map> yapısı).
*
