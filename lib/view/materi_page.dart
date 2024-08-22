import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class MateriPage extends StatefulWidget {
  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  String pdfPath = "";

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    final ByteData bytes = await rootBundle.load('assets/BAHAN AJAR PESERTA DIDIK KELAS 12 ELMEN 2.pdf');
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/bahan_ajar.pdf';
    final File file = File(path);
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    setState(() {
      pdfPath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materi'),
      ),
      body: pdfPath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: pdfPath,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: true,
              pageFling: true,
              onRender: (_pages) {
                setState(() {});
              },
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
            ),
    );
  }
}
