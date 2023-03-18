
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../widget/file_picker_widget.dart';


class new_user extends StatefulWidget {
  const new_user({Key? key}) : super(key: key);

  @override
  State<new_user> createState() => _new_userState();
}

class _new_userState extends State<new_user> {
  String dropdownvalue = 'Individual';
  var items = ['Individual', 'Corporate'];
  late String countryValue;
  late String stateValue;
  late String cityValue;
  String document = 'Aadhar card';
  var documentitems = [
    'Customer App. Form',
    'Aadhar card',
    'PAN Card',
    'Driving License',
    'Passport',
    'Light Bill'
  ];
  var itemsm = ['Facebook', 'Twitter', 'Instagram', 'Google', 'LinkedIN'];
  String dropdownvaluem = 'Facebook';
  final _form = GlobalKey<FormState>();


  bool value = false;
  var useridcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var fisrtnamecontroller = TextEditingController();
  var middlenamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var nationalitycontroller = TextEditingController();
  var aadharaddcontroller = TextEditingController();
  var distrctcontroller = TextEditingController();
  var talukacontroller = TextEditingController();
  var pincontroller = TextEditingController();
  var areatcontroller = TextEditingController();
  var landmarkctcontroller = TextEditingController();
  var lanectcontroller = TextEditingController();
  var roomctcontroller = TextEditingController();
  var onuctcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var phoenocontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var pancontroller = TextEditingController();
  var gstncontroller = TextEditingController();
  var billingnamecontroller = TextEditingController();
  var helpcontroller = TextEditingController();
  var othercontroller =TextEditingController();
  var desccontroller = TextEditingController();
  var amtcontroller = TextEditingController();
  var totalamtcontroller = TextEditingController();
  var profilecontroller = TextEditingController();


  // void dispose(){
  //   useridcontroller.dispose();
  //   passwordcontroller.dispose();
  //   fisrtnamecontroller.dispose();
  //   middlenamecontroller.dispose();
  //   lastnamecontroller.dispose();
  //   nationalitycontroller.dispose();
  //   aadharaddcontroller.dispose();
  //   distrctcontroller.dispose();
  //   talukacontroller.dispose();
  //   pincontroller.dispose();
  //   areatcontroller.dispose();
  //   landmarkctcontroller.dispose();
  //   lanectcontroller.dispose();
  //   roomctcontroller.dispose();
  //   onuctcontroller.dispose();
  //   mobilecontroller.dispose();
  //   phoenocontroller.dispose();
  //   emailcontroller.dispose();
  //   addresscontroller.dispose();
  //   billingnamecontroller.dispose();
  //   pancontroller.dispose();
  //   gstncontroller.dispose();
  //   helpcontroller.dispose();
  //   othercontroller.dispose();
  //   desccontroller.dispose();
  //   amtcontroller.dispose();
  //   totalamtcontroller.dispose();
  //   profilecontroller.dispose();
  // }s
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const SearchBar(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                const SizedBox(height: 10,),
                const HeadlineWidget(bal: '5000'),
                const SizedBox(height: 15,),
                Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.black,
                elevation: 20,
                  color: const Color(0xFF607894),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text("CREDENTIALS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,),),
                        const Divider(
                          color: Colors.black,
                          endIndent: 10,
                        ),
                        const SizedBox(height: 15,),
                        const Text('User Type',style: TextStyle(color: Colors.black,fontSize: 18,),),
                        const SizedBox(height: 10,),
                        Container(
                      height: 32,
                      width: 120,
                      decoration: const BoxDecoration(
                      ),
                      child: DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(items),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                        const SizedBox(height: 20,),
                        const Text("User Id",style: TextStyle(color: Colors.black,fontSize: 18,),),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value1){
                              if (value1 == null || value1.isEmpty){
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            controller: useridcontroller,
                            decoration: const InputDecoration(
                              hintText: "User Id",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("Password",style: TextStyle(color: Colors.black,fontSize: 18,),),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value1){
                              if (value1 == null || value1.isEmpty){
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                // CredentialsCardWidget
                const SizedBox(height: 5,),
                Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadowColor: Colors.black,
                elevation: 20,
                  color: Color(0xFF607894),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 452,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("PERSONAL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,),),
                        const Divider(
                          color: Colors.black,
                          endIndent: 10,
                        ),
                        const SizedBox(height: 15,),
                        const Text("First Name",style: TextStyle(color: Colors.black,fontSize: 18,),),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value1){
                              if (value1 == null || value1.isEmpty){
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            controller: fisrtnamecontroller,
                            decoration: const InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("Middle Name",style: TextStyle(color: Colors.black,fontSize: 18,),),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: middlenamecontroller,
                            decoration: const InputDecoration(
                              hintText: "Middle Name",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("Last Name",style: TextStyle(color: Colors.black,fontSize: 18,),),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value1){
                              if (value1 == null || value1.isEmpty){
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            controller: lastnamecontroller,
                            decoration: const InputDecoration(
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("Nationality",style: TextStyle(color: Colors.black,fontSize: 18,),),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value1){
                              if (value1 == null || value1.isEmpty){
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            controller: nationalitycontroller,
                            decoration: const InputDecoration(
                              hintText: "Indian",
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                // PersonalCardWidget(),
                const SizedBox(height: 5,),
                // AddressCardWidget(),
                Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.black,
              elevation: 20,
                  color: Color(0xFF607894),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "INSTALLATION ADDRESS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        endIndent: 10,
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      SelectState(
                        dropdownColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        onCountryChanged: (value) {
                          setState(() {
                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                          });
                        },
                      ),

                      const SizedBox(height: 20,),
                      const Text("District", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: distrctcontroller,
                          decoration: const InputDecoration(
                            hintText: "District",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Taluka", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: talukacontroller,
                          decoration: const InputDecoration(
                            hintText: "Taluka",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Pin Code", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: pincontroller,
                          decoration: const InputDecoration(
                            hintText: "Pin Code",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Area Name", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: areatcontroller,
                          decoration: const InputDecoration(
                            hintText: "Area Name",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Landmark", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: landmarkctcontroller,
                          decoration: const InputDecoration(
                            hintText: "Land Mark",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Lane/CHS/Building", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: lanectcontroller,
                          decoration: const InputDecoration(
                            hintText: "Lane/CHS/Building",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Room No. / Details Address", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: roomctcontroller,
                          decoration: const InputDecoration(
                            hintText: "Details Address",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Connected ONU", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: onuctcontroller,
                          decoration: const InputDecoration(
                            hintText: "Connected ONU",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
                const SizedBox(height: 5,),
                // AadharAddressCardWidget(),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.black,
                  elevation: 20,
                  color: Color(0xFF607894),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ADDRESS ON AADHAR / PASSPORt / DRIVING LICENSE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            endIndent: 10,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Addres on Aadhar / Passport / Driving License',
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            height: 150,
                            child: TextFormField(
                              validator: (value1){
                                if (value1 == null || value1.isEmpty){
                                  return 'Please fill this field';
                                }
                                return null;
                              },
                              controller: aadharaddcontroller,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                hintText: 'Addres on Aadhar / Passport / Driving License',
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("Same As Above",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,),),
                              const SizedBox(width: 1,),
                              Checkbox(
                                focusColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                value: this.value,
                                onChanged: (bool? value) {
                                  setState((){
                                    this.value =  value!;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                // ContactCardWidget(),
                Card(
              elevation: 20,
                  color: Color(0xFF607894),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CONTACT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(
                        endIndent: 10,
                        color: Colors.black,
                      ),

                      const SizedBox(height: 20,),
                      const Text("Primary Mobile", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: mobilecontroller,
                          decoration: const InputDecoration(
                            hintText: "Primary Mobile",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Phone", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          onChanged: (valu){
                            _form.currentState?.validate();
                          },
                          validator: (value1){
                            if(value1!.isEmpty){
                              return "Please Enter Email";
                            }else if(!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value1))
                            {
                              return "Please Enter a Valid Email";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: phoenocontroller,
                          decoration: const InputDecoration(
                            hintText: "Phone",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Email", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val){
                            _form.currentState?.validate();
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Email";
                            }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                            {
                              return "Please Enter a Valid Email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Aadhar/DL/Passport", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: addresscontroller,
                          decoration: const InputDecoration(
                            hintText: "aadhar/DL/Passport",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
                const SizedBox(height: 5,),
                // BillingCardWidget(),
                Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.black,
              elevation: 20,
                  color: Color(0xFF607894),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Billing",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Billing Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: billingnamecontroller,
                          decoration: const InputDecoration(
                            hintText: "District",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            focusColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            value: this.value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          const Text(
                            "Same As Above Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20,),
                      const Text("PAN Number", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: pancontroller,
                          decoration: const InputDecoration(
                            hintText: "District",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("GSTN Number", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: gstncontroller,
                          decoration: const InputDecoration(
                            hintText: "District",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
                const SizedBox(height: 5,),
                // InstallationCardWidget(),
                Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.black,
              elevation: 20,
                  color: Color(0xFF607894),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "INSTALLATION",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(
                        endIndent: 10,
                        color: Colors.black,
                      ),

                      const SizedBox(height: 20,),
                      const Text('Wiring Helped By',style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: helpcontroller,
                          decoration: const InputDecoration(
                            hintText: "Wiring Helped By",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text('Router Configured By (If Other)',style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: othercontroller,
                          decoration: const InputDecoration(
                            hintText: "Router Configured By",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
                const SizedBox(height: 5,),
                // DocumentsCardWidget(),
                Card(
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 20,
                  color: Color(0xFF607894),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "DOCMUNTES",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 32,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: DropdownButton(
                            value: document,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: documentitems.map((String items1) {
                              return DropdownMenuItem(
                                value: items1,
                                child: Text(items1),
                              );
                            }).toList(),
                            onChanged: (String? newValue1) {
                              setState(() {
                                document = newValue1!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const FilePickerWidget(),
                        ],
                      ),
                      const SizedBox(height: 4,),
                      Row(children: [
                        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),child: const Icon(Icons.add,size: 30,color: Colors.white,),),
                        const SizedBox(width: 8,),
                        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.red),child: const Icon(Icons.delete,size: 30,color: Colors.white,),),
                      ],),
                    ],
                  ),
                ),
              ),
            ),
                const SizedBox(height: 5,),
                // RefundableCardWidget(),
                Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 20,
              shadowColor: Colors.black,
                  color: Color(0xFF607894),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "REFUNDABLE DEPOSITE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        endIndent: 10,
                      ),

                      const SizedBox(height: 20,),
                      const Text("Description", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: desccontroller,
                          decoration: const InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),
                      const Text("Amount", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: amtcontroller,
                          decoration: const InputDecoration(
                            hintText: "Amount",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),


                      Row(
                        children: [
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),child: const Icon(Icons.add,size: 30,color: Colors.white,),),
                          const SizedBox(width: 8,),
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.red),child: const Icon(Icons.delete,size: 30,color: Colors.white,),),
                        ],
                      ),

                      const SizedBox(height: 20,),
                      const Text("Total Amount", style:TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: totalamtcontroller,
                          decoration: const InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
                const SizedBox(height: 5,),
                // SoicalMediaCardWidegt(),
                Card(
              shadowColor: Colors.black,
                  color: Color(0xFF607894),
                  elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                margin: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "SOCIAL MEDIA PROFILE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        endIndent: 10,
                      ),
                      const SizedBox(height: 20,),
                      Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: DropdownButton(
                        value: dropdownvaluem,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: itemsm.map((String items2) {
                          return DropdownMenuItem(
                            value: items2,
                            child: Text(items2,textAlign: TextAlign.center,),
                          );
                        }).toList(),
                        onChanged: (String? newValue2) {
                          setState(() {
                            dropdownvaluem = newValue2!;
                          });
                        },
                      ),
                    ),
                  ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: profilecontroller,
                          decoration: const InputDecoration(
                            hintText: "Profile Link",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),

                      Row(
                        children: [
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),child: const Icon(Icons.add,size: 30,color: Colors.white,),),
                          const SizedBox(width: 8,),
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.red),child: const Icon(Icons.delete,size: 30,color: Colors.white,),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),child: const Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),),
                    ElevatedButton(onPressed: (){clearText();},style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),child: const Text("Reset",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),),
                    ElevatedButton(onPressed: (){add();},style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),child: const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> add() async{
    var res = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: {"utype" : dropdownvalue,"username" : useridcontroller.text, "password" : passwordcontroller.text,
          'fname' : fisrtnamecontroller.text, 'mname' : middlenamecontroller.text, 'lname' : lastnamecontroller.text, 'nation' : nationalitycontroller.text,
          'aadharadd' : aadharaddcontroller.text, 'dist' : distrctcontroller.text, 'taluka' : talukacontroller.text,
          'pincode' : pincontroller.text, 'area' : areatcontroller.text, 'land' : landmarkctcontroller.text, 'lane' : lanectcontroller.text, 'roomno' : roomctcontroller.text, 'onu' : onuctcontroller.text,
          'mobileno' : mobilecontroller.text, 'phone' : phoenocontroller.text, 'email' : emailcontroller.text, 'address' : addresscontroller.text,
          'pan' : pancontroller.text, 'gstn' : gstncontroller.text, 'billing' : billingnamecontroller.text, 'help': helpcontroller.text, 'other'  :othercontroller.text,
          'desc' : desccontroller.text, 'amt' : amtcontroller.text, 'totalamt' : totalamtcontroller.text,'documenttype' : document, 'profiletypr' : dropdownvaluem, 'profile' : profilecontroller.text,
          'country' : countryValue, 'state' : stateValue, 'city' : cityValue,
        });
    print(res.body);
  }

  void clearText(){
    useridcontroller.clear();
    passwordcontroller.clear();
    fisrtnamecontroller.clear();
    middlenamecontroller.clear();
    lastnamecontroller.clear();
    nationalitycontroller.clear();
    aadharaddcontroller.clear();
    distrctcontroller.clear();
    talukacontroller.clear();
    pincontroller.clear();
    areatcontroller.clear();
    landmarkctcontroller.clear();
    lanectcontroller.clear();
    roomctcontroller.clear();
    onuctcontroller.clear();
    mobilecontroller.clear();
    phoenocontroller.clear();
    emailcontroller.clear();
    addresscontroller.clear();
    billingnamecontroller.clear();
    pancontroller.clear();
    gstncontroller.clear();
    helpcontroller.clear();
    othercontroller.clear();
    desccontroller.clear();
    amtcontroller.clear();
    totalamtcontroller.clear();
    profilecontroller.clear();
  }
}
