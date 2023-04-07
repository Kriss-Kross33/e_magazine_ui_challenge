import 'package:e_magazine_ui_challenge/src/utils/constants/asset_consts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'magazine_card_state.dart';

class MagazineCardCubit extends Cubit<MagazineCardState> {
  MagazineCardCubit()
      : super(
          const MagazineCardState(
            magazineImages: [],
          ),
        );

  void initializeMagazines() {
    emit(state.copyWith(
      position: state.position,
      isDragging: true,
      magazineImages: magazineImages,
    ));
  }

  void setSize(Size size) {
    emit(state.copyWith(
      screenSize: size,
    ));
  }

  void onStartPosition(DragStartDetails details) {
    emit(state.copyWith(
      position: state.position,
      isDragging: true,
      magazineImages: magazineImages,
    ));
  }

  List<String> magazineImages = <String>[
    AssetConsts.dazed2,
    AssetConsts.dazed3,
    AssetConsts.dazed1
  ];

  void onUpdatePosition(DragUpdateDetails details, Size size) {
    final newPosition = details.delta + state.position;
    final angle = 45 * newPosition.dx / size.width;
    emit(
      state.copyWith(
        position: newPosition,
        screenSize: size,
        angle: angle,
        magazineImages: magazineImages,
      ),
    );
  }

  void resetMagazinePosition() {
    emit(
      state.copyWith(
        position: Offset.zero,
        isDragging: false,
        screenSize: Size.zero,
        angle: 0,
        magazineImages: state.magazineImages,
      ),
    );
  }

  void onEndPosition(Size size, String imagePath) {
    double dragAngle = 20;
    late Offset newPosition;
    if (state.angle.isNegative) {
      newPosition = state.position + Offset(-2 * size.width, 0);
    } else {
      newPosition = state.position + Offset(2 * size.width, 0);
    }
    final magazineCardModel = state.magazineImages.removeLast();
    state.magazineImages.insert(0, magazineCardModel);
    emit(
      state.copyWith(
        position: newPosition,
        isDragging: false,
        screenSize: Size.zero,
        angle: dragAngle,
        magazineImages: state.magazineImages,
      ),
    );

    resetMagazinePosition();
  }
}
