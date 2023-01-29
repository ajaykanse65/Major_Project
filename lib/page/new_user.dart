import 'package:bms/widget/aadhar_aadress_card.dart';
import 'package:bms/widget/address_card_widget.dart';
import 'package:bms/widget/billing_card_widget.dart';
import 'package:bms/widget/contact_card_widget.dart';
import 'package:bms/widget/credentials_card_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/doc_card_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/installation_card_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:bms/widget/personal_card_widget.dart';
import 'package:bms/widget/refundable_card_widget.dart';
import 'package:bms/widget/soicalmedia_card_widget.dart';
import 'package:flutter/material.dart';

class new_user extends StatelessWidget {
  const new_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              SizedBox(height: 10,),
              HeadlineWidget(bal: '5000'),
              SizedBox(height: 15,),
              CredentialsCardWidget(),
              SizedBox(height: 5,),
              PersonalCardWidget(),
              SizedBox(height: 5,),
              AddressCardWidget(),
              SizedBox(height: 5,),
              AadharAddressCardWidget(),
              SizedBox(height: 5,),
              ContactCardWidget(),
              SizedBox(height: 5,),
              BillingCardWidget(),
              SizedBox(height: 5,),
              InstallationCardWidget(),
              SizedBox(height: 5,),
              DocumentsCardWidget(),
              SizedBox(height: 5,),
              RefundableCardWidget(),
              SizedBox(height: 5,),
              SoicalMediaCardWidegt(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.redAccent),child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),),
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),child: Text("Reset",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),),
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.greenAccent),child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
