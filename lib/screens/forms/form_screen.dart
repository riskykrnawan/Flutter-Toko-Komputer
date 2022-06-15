import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posttest6_2009106050_riskykurniawan/getx_controller/form_controller.dart';
import 'package:path/path.dart' as path;
import 'package:posttest6_2009106050_riskykurniawan/screens/forms/components/item_card.dart';

class MyForm extends StatelessWidget {
  MyForm({Key? key}) : super(key: key);

  final GetxFormController formController = Get.put(GetxFormController());
  final GetxFormController getFormController = Get.find();

  @override
  Widget build(BuildContext context) { 
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    CollectionReference products = _fireStore.collection('products');
    
    var nama = getFormController.nama;
    var harga = getFormController.harga;
    var stok = getFormController.stok;
    var deskripsi = getFormController.deskripsi;
    var jenis = getFormController.jenis;
    var warna = getFormController.warna;

    final List<String> listWarna = [
      'Pilih Warna',
      'Merah',
      'Kuning',
      'Hijau',
      'Biru',
      'Hitam',
      'Silver',
      'Ungu',
      'Cyan',
    ];
    
    final List<String> listJenis = [
      'Pilih Jenis',
      'Reel',
      'Joran',
      'Joran Tegek',
      'Lure',
      'Hook',
      'Spool',
      'Baju',
    ];


    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.04,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextFormField(
                  controller: formController.namaEditingController,
                  onChanged: (newValue) {
                    formController.setNama(newValue);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                    prefixIcon: Icon(Icons.shopping_bag_outlined),
                    labelText: 'Nama Barang',
                  ),
                ),
              ),
            ],
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (newValue) {
                    formController.setHarga(int.parse(newValue));
                  },
                  controller: formController.hargaEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                    prefixIcon: Icon(Icons.price_change_outlined),
                    labelText: 'Harga Barang',
                  ),
                ),
              ),
            ],
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: formController.stokEditingController,
                  onChanged: (newValue) {
                    formController.setStok(int.parse(newValue));
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.calculate_outlined),
                    contentPadding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                    // border: OutlineInputBorder(),
                    labelText: 'Stok Barang',
                  ),
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextFormField(
                  controller: formController.deskripsiEditingController,
                  maxLines: 3,
                  onChanged: (newValue) {
                    formController.setDeskripsi(newValue);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                    labelText: 'Deskripsi Barang',
                  ),
                ),
              ),
            ],
          ),

          Obx(() =>
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: CustomDropdownButton2(
                dropdownItems: listJenis,
                hint: 'Pilih Warna',
                value: formController.jenis.value,
                onChanged: (newValue) {
                  formController.setJenis(newValue.toString());
                },
              ),
            )
          ),

          Obx(() =>
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: CustomDropdownButton2(
                dropdownItems: listWarna,
                hint: 'Pilih Warna',
                value: formController.warna.value,
                onChanged: (newValue) { 
                  formController.setWarna(newValue.toString());
                },
              ),
            )
          ),

          Container(
            margin: const EdgeInsets.only(top: 27, right: 25, left: 25),
            child: AnimatedButton(
              text: 'Submit',
              height: 40,
              color: Colors.blueAccent,
              pressEvent: () {
                products.add({
                  'nama': formController.nama.value,
                  'deskripsi': formController.deskripsi.value,
                  'harga': formController.harga.value,
                  'stok': formController.stok.value,
                  'jenis': formController.jenis.value,
                  'warna': formController.warna.value,
                });
                final snackBar = SnackBar(
                  content: const Text('Barang berhasil ditambahkan!'),
                  action: SnackBarAction(
                    label: 'Batalkan',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                AwesomeDialog(
                  context: context,
                  animType: AnimType.LEFTSLIDE,
                  headerAnimationLoop: false,
                  dialogType: DialogType.SUCCES,
                  showCloseIcon: true,
                  title: 'Success',
                  desc:
                  "Nama: $nama\n"
                  "Harga: $harga\n"
                  "Stok: $stok\n"
                  "Deskripsi: $deskripsi\n"
                  "Jenis: $jenis\n"
                  "Warna: $warna\n"
                  "berhasil ditambahkan!",
                  btnOkOnPress: () {
                    debugPrint('OnClcik');
                  },
                  btnOkIcon: Icons.check_circle,
                  onDissmissCallback: (type) {
                    debugPrint('Dialog Dissmiss from callback $type');
                  },
                ).show();
              },
            ),
          ),

          StreamBuilder<QuerySnapshot>(
            stream: products.snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                ? Column(
                  children: snapshot.data!.docs
                    .map(
                    (e) => ItemCard(
                      e.get('nama'),
                      e.get('harga'),
                      e.get('stok'),
                      e.get('deskripsi'),
                      e.get('jenis'),
                      e.get('warna'),
                      onUpdate: () {
                        products.doc(e.id).update(
                          {
                            'nama': formController.nama.value,
                            'deskripsi': formController.deskripsi.value,
                            'harga': formController.harga.value,
                            'stok': formController.stok.value,
                            'jenis': formController.jenis.value,
                            'warna': formController.warna.value,
                          }
                        );
                      },
                      onDelete: () {
                        products.doc(e.id).delete();
                      },
                    )
                  )
                    .toList(),
                  )
                : const Text('Loading...');
            },
          ),
        ],
      ),
    );
  }
}
