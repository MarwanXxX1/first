class PropertyModel{

  String?  locationn, area, type, paymentType,price, amenty, noOfRooms, noOfBaths, downPayment, installmentValue, description, userPhone, userEmail, pic;

  

  PropertyModel({
    this.locationn,
    this.area,
    this.type, 
    this.noOfRooms,
    this.noOfBaths, 
    this.amenty,
    this.paymentType, 
    this.price,
    this.downPayment, 
    this.installmentValue,
    this.description,
    this.userPhone,
    this.userEmail,
     this.pic,
});

  PropertyModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null){
      return;
    }
    locationn = map['Location'];
    area = map['area'];
    type = map['type'];
    price = map['price'];
    noOfRooms = map['numberofrooms'];
    noOfBaths = map['numberofbaths'];
    amenty = map['Amenties'];
    paymentType = map['paymenttype'];
    downPayment = map['downpayment'];
    installmentValue = map['installmentvalue'];
    description = map['description'];
    userPhone = map['userphone'];
    userEmail = map['useremail'];
        pic = map['pic'];

  }

  toJson(){
    return{
      'Location': locationn,
      'area': area,
      'type': type,
      'price': price,
      'numberofrooms': noOfRooms,
      'numberofbaths': noOfBaths,
      'Amenties': amenty,
      'paymenttype':paymentType,
      'downpayment':downPayment,
      'installmentvalue': installmentValue,
      'description': description,
      'userphone': userPhone,
      'pic': pic
    };
  }
}
