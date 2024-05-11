import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/constants.dart';
import 'package:projflut/controller/add_property_controller.dart';
import 'package:projflut/controller/get_property_controller.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Real Estate Assessor',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AssessorPage(),
//     );
//   }
// }

class AssessorPage extends StatefulWidget {
  @override
  _AssessorPageState createState() => _AssessorPageState();
}

class _AssessorPageState extends State<AssessorPage> {
  List<Property> properties = [
    Property(
      id: 1,
      location: 'Example Location 1',
      areaRange: '500-600 sqft',
      bedrooms: 2,
      baths: 2,
      price: 200000,
      images: [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    ),
    Property(
      id: 2,
      location: 'Example Location 2',
      areaRange: '600-700 sqft',
      bedrooms: 3,
      baths: 2,
      price: 250000,
      images: [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    ),
    // Add more properties as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Assessor'),
        backgroundColor: primaryColor,
      ),
      body: properties.isEmpty
          ? Center(
        child: Text('No properties to assess'),
      )
          : GetBuilder<GetPropertyController>(
            init: GetPropertyController(),
            builder: (controller) => ListView.builder(
                  itemCount: controller.propertyModel.length,
                  itemBuilder: (context, index) {
            return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    //         TextFormField(
    //               decoration: InputDecoration(
    //               // labelText:'Location' ,
    //               // labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  
    //               hintText: controller.propertyModel[index].locationn ,hintStyle:TextStyle(fontSize: 10,color: Colors.black),
    //               suffixIcon: Icon(Icons.location_city,size: 17,color:Color(0xff446FAF),),
    //               enabledBorder: UnderlineInputBorder(       
    //                 borderSide:BorderSide(
    //                   color: primaryColor,
    //                   width: 1,
    //                   ),
    //                 )
    //               ), 
    //               validator: (value) {
    //                 if(value == null || value.isEmpty){
    //                   return 'please enter some text';
    //                 }
    //               },
    //               onSaved: (newvalue){
    //                 controller.locationn = newvalue;
    //               },
                    
    // ),
            Text('Location: ${controller.propertyModel[index].locationn}'),
            Text('Area Range: ${controller.propertyModel[index].area}'),
            Text('Bedrooms: ${controller.propertyModel[index].noOfRooms}'),
            Text('Baths: ${controller.propertyModel[index].noOfBaths}'),
            Text('Price: \$${controller.propertyModel[index].price}'),
            SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.builder(
            
                scrollDirection: Axis.horizontal,
                itemCount: controller.propertyModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image.asset('assets/hotel_2.png')
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: (){
                      controller.userEmail = controller.propertyModel[index].userEmail;
                      controller.userPhone = controller.propertyModel[index].userPhone;
                      controller.locationn = controller.propertyModel[index].locationn;
                      controller.area = controller.propertyModel[index].area;
                      controller.amenty = controller.propertyModel[index].amenty;
                      controller.description = controller.propertyModel[index].description;
                      controller.downPayment = controller.propertyModel[index].downPayment;
                      controller.installmentValue = controller.propertyModel[index].installmentValue;
                      controller.type = controller.propertyModel[index].type;
                      controller.noOfRooms = controller.propertyModel[index].noOfRooms;
                      controller.noOfBaths = controller.propertyModel[index].noOfBaths;
                      controller.price = controller.propertyModel[index].price;
                      controller.paymentType = controller.propertyModel[index].paymentType;
                      controller.addProperty();
                      setState(() {
                        controller.propertyModel.remove(controller.propertyModel[index]);
                      });
                      

                    },
                    child: Text('Approve'),
                  ),
                
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: (){

                  },
                  child: Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
                  },
                ),
          ),
    );
  }

  void approveProperty(Property property) {
    // Implement logic for approving property
    setState(() {
      properties.remove(property);
    });
    // You can add further logic like notifying the seller or updating database, etc.
  }

  void rejectProperty(Property property) {
    // Implement logic for rejecting property
    setState(() {
      properties.remove(property);
    });
    // You can add further logic like notifying the seller or updating database, etc.
  }
}

class PropertyItem extends StatelessWidget {
  final Property property;
  final VoidCallback onApproved;
  final VoidCallback onRejected;

  const PropertyItem({
    required this.property,
    required this.onApproved,
    required this.onRejected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${property.location}'),
            Text('Area Range: ${property.areaRange}'),
            Text('Bedrooms: ${property.bedrooms}'),
            Text('Baths: ${property.baths}'),
            Text('Price: \$${property.price.toString()}'),
            SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: property.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image.network(
                      property.images[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onApproved,
                  child: Text('Approve'),
                ),
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: onRejected,
                  child: Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Property {
  final int id;
  final String location;
  final String areaRange;
  final int bedrooms;
  final int baths;
  final int price;
  final List<String> images;

  Property({
    required this.id,
    required this.location,
    required this.areaRange,
    required this.bedrooms,
    required this.baths,
    required this.price,
    required this.images,
  });
}