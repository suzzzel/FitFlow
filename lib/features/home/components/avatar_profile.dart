import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AvatarProfile extends StatefulWidget {
  const AvatarProfile({super.key});

  @override
  State<AvatarProfile> createState() => _AvatarProfileState();
}

class _AvatarProfileState extends State<AvatarProfile> {
  File? image;

  _loadImage() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    final imageProfile = File('${appDirectory.path}/userPhoto.jpg');
    if (!imageProfile.existsSync()) {
      image = null;
    } else {
      image = imageProfile;
    }
    setState(() {});
  }

  _pickImage() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return null;
    } else {
      Directory appDirectory = await getApplicationDocumentsDirectory();
      File newImage = File('${appDirectory.path}/userPhoto.jpg');
      await newImage.writeAsBytes(File(pickedFile.path).readAsBytesSync());
      image = newImage;
      setState(() {});
    }
  }

  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 4),
            color:
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.47))
      ]),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(1),
        radius: 60,
        child: InkWell(
          onTap: () => _pickImage(),
          child: ClipOval(
              child: image != null
                  ? Image.memory(
                      image!.readAsBytesSync(),
                      width: 122,
                      height: 121,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 25,
                      height: 25,
                      child: FittedBox(
                        child: Icon(
                          Icons.photo_camera,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    )),
        ),
      ),
    );
  }
}
