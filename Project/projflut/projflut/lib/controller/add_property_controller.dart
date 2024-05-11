// ignore_for_file: unnecessary_overrides, non_constant_identifier_names, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyController extends GetxController {
  String? location,
      area,
      type,
      paymentType,
      amenty,
      noOfRooms,
      noOfBaths,
      price,
      downPayment,
      installmentValue,
      description,
      pic;

  // var image;

  // List<XFile> imageList = [];

  // final imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  File? pickedImageProfile;
  Future<void> pickImageProfile(ImageSource source) async {
    final pick = ImagePicker();
    final pickedFile = await pick.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      pickedImageProfile = File(pickedFile.path);
    }

    await saveImagePickerInFirebase();
  }

  String? imageUrlFromFirbase;
  Future saveImagePickerInFirebase() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    final Reference storgeRef =
        FirebaseStorage.instance.ref().child('user_images').child('$user.jpg');

    await storgeRef.putFile(pickedImageProfile!);
    imageUrlFromFirbase = await storgeRef.getDownloadURL();
    // await setIsImage();

    // notifyListeners();
  }

  CollectionReference properties =
      FirebaseFirestore.instance.collection('Properties_home');

  DocumentReference doc_ref =
      FirebaseFirestore.instance.collection('assessor_Properties').doc();

  late DocumentSnapshot documentSnapshot;

  Future<void> addProperty() async {
    return properties
        .add({
          'Location': FirebaseFirestore.instance
              .collection('assessor_Properties')
              .doc('Location'),
          'area': documentSnapshot['area'],
          'type': documentSnapshot['type'],
          'price': documentSnapshot['price'],
          'number of rooms': documentSnapshot['number of rooms'],
          'number of baths': documentSnapshot['number of baths'],
          'Amenties': documentSnapshot['Amenties'],
          'payment type': documentSnapshot['payment type'],
          'down payment': documentSnapshot['down payment'],
          'installment value': documentSnapshot['intsallment value'],
          'description': documentSnapshot['description'],
          'pic': documentSnapshot['pic']
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



}
