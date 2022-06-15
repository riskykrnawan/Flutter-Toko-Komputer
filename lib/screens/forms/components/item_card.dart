import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String nama;
  final int harga;
  final int stok;
  final String deskripsi;
  final String jenis;
  final String warna;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.nama, this.harga, this.stok, this.deskripsi, this.jenis, this.warna, {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      ),
                      Text(
                        "Harga: $harga"
                      ),
                      Text(
                        "Stok: $stok "
                      ),
                      Text(
                        "Deskripsi: $deskripsi"
                      ),
                      Text(
                        "Jenis: $jenis"
                      ),
                      Text(
                        "Warna: $warna"
                      ),
                  ],)
                  )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.blueAccent,
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.refresh_outlined,
                        color: Colors.white,
                      )),
                      onPressed: () {
                        onUpdate!();
                      }),
                ),

                SizedBox(
                  height: 40,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.red,
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                      onPressed: () {
                        if (onDelete != null) onDelete!();
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
