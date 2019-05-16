import 'dart:async';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../redux/lift/quote_form/lift_quote_form_actions.dart';
import '../../redux/lift/quote_form/lift_quote_form_state.dart';
import '../../redux/app/app_state.dart';

class LiftsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: ImagePicker()));
  }
}

class ImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  List<Asset> images = List<Asset>();
  String _error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 1),
        Center(child: Text('$_error')),
        RaisedButton(
          child: Text('Pick Images'),
          onPressed: loadAssets,
        ),
        RaisedButton(
          child: Text('Delete'),
          onPressed: () => deleteAsset(
              'https://firebasestorage.googleapis.com/v0/b/oust-app.appspot.com/o/lifts%2F04ab2f8a-2fab-4c31-86a1-d0602a15c743.jpg?alt=media&token=02b86ea1-f4bc-40dc-b590-1f87080a65ad'),
        ),
        RaisedButton(
          child: Text('Click'),
          onPressed: () => print(StoreProvider.of<AppState>(context)
              .state
              .liftState
              .liftQuoteFormState
              .liftQuoteForm
              .images),
        ),
        Expanded(
          flex: 3,
          child: buildGridView(),
        )
      ],
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (int index) {
        final Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
      );
    } on PlatformException catch (e) {
      error = e.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;

      if (error == null) _error = 'No Error Dectected';
    });

    final Store<AppState> store = StoreProvider.of<AppState>(context);

    for (Asset image in images) {
      final String uuid = Uuid().v4();
      store.dispatch(AddLiftImage(image: image, uuid: uuid));
    }
  }

  Future<void> deleteAsset(String url) async {
    final StorageReference ref = await FirebaseStorage.instance.getReferenceFromUrl(url);
    await ref.delete();
  }

  // Future<String> saveImage(Asset asset) async {
  //   final ByteData byteData = await asset.requestOriginal(quality: 80);
  //   final List<int> imageData = byteData.buffer.asUint8List();
  //   final StorageMetadata metadata = StorageMetadata(contentType: 'image/jpeg');
  //   final StorageReference ref = FirebaseStorage.instance.ref().child('lifts/${Uuid().v4()}.jpg');
  //   final StorageUploadTask uploadTask = ref.putData(imageData, metadata);

  //   final String url = await (await uploadTask.onComplete).ref.getDownloadURL();
  //   print(url);
  //   return url;
  // }
}
