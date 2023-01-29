import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({Key? key}) : super(key: key);

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    void openFiles()async{
      FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select valid file',
        allowedExtensions: ['jpg','jpeg','png','pdf']
      );
      if(resultFile != null){
        PlatformFile file = resultFile.files.first;
        print(file.name);
      }else{
      }
    }
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.grey.shade400),
        onPressed: () async {
          openFiles();
        },
        child: Text(
          "Chose File",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
