import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadbannerScreen extends StatefulWidget {
  const UploadbannerScreen({super.key});
  static const String routeName = '\UploadBannerScreen';

  @override
  State<UploadbannerScreen> createState() => _UploadbannerScreenState();
}

class _UploadbannerScreenState extends State<UploadbannerScreen> {
  dynamic _image;

  String? fileName;

  PickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;

        fileName = result.files.first.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Upload Banner',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Divider(
            height: 20,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      border: Border.all(
                        color: Color.fromARGB(255, 30, 71, 255),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: _image != null
                      ? Image.memory(_image)
                      : Center(
                          child: Text('Banner'),
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        PickImage();
                      },
                      child: Text(
                        'Upload Banner',
                        selectionColor: Colors.yellow,
                      )),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Save Banner'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
