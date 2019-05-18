import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../../data/models/lift_image.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/layout.dart';
import '../../../../presentation/base_card.dart';
import '../../../../presentation/form_wrapper.dart';
import '../../../../presentation/layout/title_form_button_layout.dart';
import '../../../../presentation/title_widget.dart';

class LiftQuoteFormImage extends StatelessWidget {
  static int step = 1;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return FormWrapper(
          child: LiftImageForm(viewModel),
          onExit: viewModel.exit,
          onPreviousStep: viewModel.previousStep,
        );
      },
    );
  }
}

class LiftImageForm extends StatelessWidget {
  final _ViewModel viewModel;
  LiftImageForm(this.viewModel);

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = viewModel.images == null || viewModel.images.length == 0;

    return TitleFormButton(
      title: TitleWidget(
          title: 'Que veut-tu débarasser ?',
          subtitle:
              'Ajoute une photo de tout ce que tu souhaites que l\'on prenne afin qu\'on puisse te donner le prix.'),
      form: BaseCard(
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => _loadAssets(viewModel.addLiftImage),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: Layout.of(context).gridUnit(1.5)),
                height: Layout.of(context).gridUnit(10),
                width: isEmpty
                    ? MediaQuery.of(context).size.width - Layout.of(context).gridUnit(11)
                    : Layout.of(context).gridUnit(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]),
                    borderRadius: BorderRadius.circular(Layout.of(context).gridUnit(1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.photo_camera, size: 40, color: Colors.grey[500]),
                    if (isEmpty) ...[
                      Container(width: Layout.of(context).gridUnit(3)),
                      Text('Ajouter une image',
                          style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.grey[600]))
                    ]
                  ],
                ),
              ),
            ),
            if (!isEmpty) ...[
              SizedBox(width: Layout.of(context).gridUnit(1.5)),
              Flexible(
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
                                padding: EdgeInsets.only(right: Layout.of(context).gridUnit(1.5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(Layout.of(context).gridUnit(1))),
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
            ]
          ],
        ),
      ),
      button: RaisedButton(
          child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
          onPressed: viewModel.nextStep),
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
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final BuiltMap<String, LiftImage> images;
  final Function addLiftImage;
  final Function deleteLiftImage;

  _ViewModel({this.nextStep, this.previousStep, this.exit, this.images, this.addLiftImage, this.deleteLiftImage});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        nextStep: () => store.dispatch(LiftQuoteFormNextStep()),
        previousStep: () => store.dispatch(LiftQuoteFormPreviousStep()),
        exit: () => store.dispatch(LiftQuoteFormExit()),
        images: store.state.liftState.liftQuoteFormState.liftQuoteForm.images,
        addLiftImage: (Asset image) => store.dispatch(AddLiftImage(image: image, uuid: Uuid().v4())),
        deleteLiftImage: (LiftImage image) => store.dispatch(DeleteLiftImage(image: image)));
  }
}
