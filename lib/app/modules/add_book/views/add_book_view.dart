import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add-BookView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: controller.judulController,
                      decoration:
                      InputDecoration(hintText: "Masukkan Judul"),
                      validator: (value) {
                        if (value!.length < 2) {
                          return "Judul Tidak Boleh Kosong";
                        }
                        return null;
                      }),
                  TextFormField(
                    controller: controller.penulisController,
                    decoration: InputDecoration(hintText: "Masukkan Penulis"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Penulis Tidak Boleh Kosong";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.penerbitController,
                    decoration: InputDecoration(hintText: "Masukkan Penerbit"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Penerbit Tidak Boleh Kosong";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.tahunTerbitController,
                    decoration: InputDecoration(hintText: "Masukkan Tahun Terbit"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Tahun Terbit Tidak Boleh Kosong";
                      }
                      return null;
                    },
                  ),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(onPressed: () {
                    controller.addbook();
                  },
                      child: Text("Tambah")))
                ],
              ))),
    );
  }
}
