import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/rusdan.jpg'), // Ganti dengan path gambar profil kamu
            ),
            SizedBox(height: 16),
            Text(
              'Nama Saya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Muhamad Rusdan S.Pd.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Aplikasi ini merupakan produk pengembangan inovasi dalam pembelajaran dengan memanfatkan teknologi informasi , didirikan oleh salah satu mahasiswi Program Pendidikan profesi guru prajabatan universitas pasundan gelombang satu tahun 2024,bernama Muhamad Rusdan S.Pd, kelahiran Sumedang, 27 Juli 2000',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Informasi Tambahan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '- Hobi: Olahraga',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '- Lokasi: Sumedang,Jawa Barat, Indonesia',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '- Email: Rusdan272000@gmail.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
