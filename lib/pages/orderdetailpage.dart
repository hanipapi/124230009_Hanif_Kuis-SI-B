import 'package:flutter/material.dart';
import 'package:latihanquiz/models/modeldata.dart';

// Halaman detail pesanan
class OrderDetailPage extends StatefulWidget {
  final MenuItem menuItem;
  const OrderDetailPage({super.key, required this.menuItem});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  int get price => widget.menuItem.price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menuItem.name),
      ), //Judul appbar pakai nama menu
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilan gambar menu
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.menuItem.imageAsset,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            
            Text(
              widget.menuItem.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // ✅ Like
            Text(
              "Disukai Oleh: $price orang",
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(222, 255, 23, 23),
              ),
            ),
            const SizedBox(height: 16),

            // Deskirpsi
            Text(
              widget.menuItem.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8),

            const Spacer(), //Dorong tombol ke bawah layar
            //Tombol kembali
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // ✅ Tampilkan pesan sukses
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("cari game lain")));

                  // ✅ Kembali ke halaman sebelumnya (HomePage)
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Kembali"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
