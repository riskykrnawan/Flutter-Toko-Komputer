import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetxFormController extends GetxController {
  var text = ''.obs;
  var nama = ''.obs;
  var harga = 0.obs;
  var stok = 0.obs;
  var deskripsi = ''.obs;
  var jenis = 'Pilih Jenis'.obs;
  var warna = 'Pilih Warna'.obs;
  
  void setText(String value) {
    text.value = value;
  }
  void setNama(String value) {
    nama.value = value;
  }
  void setDeskripsi(String value) {
    deskripsi.value = value;
  }
  void setJenis(String value) {
    jenis.value = value;
  }
  void setWarna(String value) {
    warna.value = value;
  }
  void setHarga(int value) {
    harga.value = value;
  }
  void setStok(int value) {
    stok.value = value;
  }

  final textEditingController = TextEditingController();
  final namaEditingController = TextEditingController();
  final hargaEditingController = TextEditingController();
  final stokEditingController = TextEditingController();
  final jenisEditingController = TextEditingController();
  final warnaEditingController = TextEditingController();
  final deskripsiEditingController = TextEditingController();
}