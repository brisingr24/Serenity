import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UtilsService {
  Future<String> uploadFile(File image,String path) async{
    firebase_storage.Reference storageReference = firebase_storage.FirebaseStorage.instance.ref(path);
    firebase_storage.UploadTask uploadTask = storageReference.putFile(image);

    await uploadTask.whenComplete(() => null);
    String returnURL ="";
    await storageReference.getDownloadURL().then((fileURL){
      returnURL = fileURL;
    });
    return returnURL;
  }
}