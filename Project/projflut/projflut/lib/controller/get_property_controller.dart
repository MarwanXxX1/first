import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projflut/model/property_model.dart';
import 'package:projflut/services/firestore_property.dart';

class GetPropertyController extends GetxController {
  String? locationn,
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
      userPhone,
      userEmail,
      pic;

  //var userPhone, userEmail;

  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<PropertyModel> get propertyModel => _propertyModel;

  List<PropertyModel> _propertyModel = [];

  getProperties() async {
    _loading.value = true;
    FireStoreProperty().getPropertiess().then((value) {
      for (int i = 0; i < value.length; i++) {
        _propertyModel.add(PropertyModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
  }

  GetPropertyController() {
    getProperties();
  }

  CollectionReference properties =
      FirebaseFirestore.instance.collection('StaffProperties');

  Future<void> addProperty() async {
    return properties.add({
      'Location': locationn,
      'area': area,
      'type': type,
      'price': price,
      'numberofrooms': noOfRooms,
      'numberofbaths': noOfBaths,
      'Amenties': amenty,
      'paymenttype': paymentType,
      'downpayment': downPayment,
      'installmentvalue': installmentValue,
      'description': description,
      'userphone': userPhone,
      'useremail': userEmail,
      'pic': pic,
    }).then((value) {
      print("User Added");
      update();
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
