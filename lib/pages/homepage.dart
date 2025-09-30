import 'package:flutter/material.dart';
import 'package:latihanquiz/data/menulist.dart';
import 'package:latihanquiz/models/modeldata.dart';
import 'orderdetailpage.dart';
import 'package:latihanquiz/login_page.dart';
import 'package:latihanquiz/likebtn.dart';

int _likeCount = 0;
bool _isLiked = false; // Untuk melacak apakah pengguna sudah menyukai postinga

class Homepage extends StatelessWidget {
  final String username;

  const Homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Struktur utama halaman
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang @$username",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            // Teks tambahan di bawah sapaan
            const Text(
              "kamu mau cari informasi game apa?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          // Tombol logout di kanan atas
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
        ],
      ),

      // Isi halaman
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[],
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          (() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  },
            ),
            // Judul "Daftar Menu"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Daftar Game:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            // Grid daftar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Scroll ikut SingleChildScrollView
                shrinkWrap: true, // Biar grid menyesuaikan ukuran
                itemCount: menuList.length, // Jumlah item menu
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kolom (2 menu per baris)
                  mainAxisSpacing: 12, // Jarak antar baris
                  crossAxisSpacing: 12, // Jarak antar kolom
                  childAspectRatio: 0.75, // Rasio ukuran card
                ),
                itemBuilder: (context, index) {
                  final MenuItem item = menuList[index]; // Ambil data menu
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3, // Efek bayangan card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Bagian gambar menu
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              item.imageAsset, // Gambar dari assets
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.fastfood, size: 50),
                            ),
                          ),
                        ),

                        // Bagian teks nama, like, dan tombol selengkapnya
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama menu
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),

                              // deskrisi
                              Text(
                                item.description,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),

                              // like menu
                              Text(
                                "Like Terkahir ${item.price}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.redAccent,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                children: [
                                  // Widget lain
                                  LikeButtonWidget(),
                                  // Widget lain
                                ],
                              ),
                              // Tombol selengkapnya
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Pindah ke halaman detail pesanan
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            OrderDetailPage(menuItem: item),
                                      ),
                                    );
                                  },
                                  child: const Text("Selengkapnya"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
