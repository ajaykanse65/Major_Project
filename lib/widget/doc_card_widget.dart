import 'package:bms/widget/documnets_dropdown_widget.dart';
import 'package:bms/widget/file_picker_widget.dart';
import 'package:flutter/material.dart';

class DocumentsCardWidget extends StatefulWidget {
  const DocumentsCardWidget({Key? key}) : super(key: key);

  @override
  State<DocumentsCardWidget> createState() => _DocumentsCardWidgetState();
}

class _DocumentsCardWidgetState extends State<DocumentsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 20,
      color: Colors.deepOrangeAccent.shade100,
      child: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DOCMUNTES",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Divider(
                endIndent: 10,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              FittedBox(child: DocumnetDropDownWidget()),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FilePickerWidget(),
                ],
              ),
              SizedBox(height: 4,),
              Row(children: [
                ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.blueAccent),child: Icon(Icons.add,size: 30,color: Colors.white,),),
                SizedBox(width: 8,),
                ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.red),child: Icon(Icons.delete,size: 30,color: Colors.white,),),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
