import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../../redux/lift/quote_form/lift_quote_form_actions.dart';
import '../../../../redux/lift/quote_form/lift_quote_form_state.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../data/models/lift_image.dart';
import '../../../../utils/layout.dart';
import '../../../../utils/colors.dart';
import '../../../presentation/base_card.dart';

class LiftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Spacer(flex: 1), LiftImagePicker(), Spacer(flex: 1)],
    );
  }
}

class LiftImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
            child: BaseCard(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => _loadAssets(viewModel.addLiftImage),
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  height: 80,
                  width: viewModel.images == null ? null : 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500]), borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.photo_camera, size: 40, color: Colors.grey[500]),
                      if (viewModel.images == null) ...[
                        Container(width: 24),
                        Text('Ajouter une image',
                            style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.grey[600]))
                      ]
                    ],
                  ),
                ),
              ),
              if (viewModel.images != null)
                Expanded(
                  child: Container(
                      height: 100,
                      child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          scrollDirection: Axis.horizontal,
                          children: List.generate(viewModel.images.length, (int index) {
                            final List keys = viewModel.images.keys.toList();

                            return Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    child: AssetThumb(
                                      asset: viewModel.images[keys[index]].image,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -10,
                                  right: 0,
                                  child: InkWell(
                                      onTap: () => viewModel.deleteLiftImage(viewModel.images[keys[index]]),
                                      child: _loadingOrDelete(viewModel.images[keys[index]])),
                                )
                              ],
                            );
                          }))),
                )
            ],
          ),
        ));
      },
    );
  }

  Widget _loadingOrDelete(LiftImage image) {
    final bool isLoading = image.url == null;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Icon(Icons.brightness_1, color: Colors.white, size: 28),
        if (isLoading)
          SizedBox(
              width: 14,
              height: 14,
              child:
                  CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(primaryColor))),
        if (!isLoading) Icon(Icons.cancel, color: primaryColor, size: 28),
      ],
    );
  }

  Future<void> _loadAssets(Function addLiftImage) async {
    List<Asset> images;
    String error;

    try {
      images = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
      );
    } on PlatformException catch (e) {
      error = e.message;
    }

    images.forEach((Asset image) => addLiftImage(image));
  }
}

class _ViewModel {
  final BuiltMap<String, LiftImage> images;
  final Function addLiftImage;
  final Function deleteLiftImage;

  _ViewModel({this.images, this.addLiftImage, this.deleteLiftImage});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        images: store.state.liftState.liftQuoteFormState.liftQuoteForm.images,
        addLiftImage: (Asset image) => store.dispatch(AddLiftImage(image: image, uuid: Uuid().v4())),
        deleteLiftImage: (LiftImage image) => store.dispatch(DeleteLiftImage(image: image)));
  }
}
