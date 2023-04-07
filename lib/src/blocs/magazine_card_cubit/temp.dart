// import 'package:e_magazine_ui_challenge/src/utils/constants/asset_consts.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'magazine_card_state.dart';

// class MagazineCardCubit extends Cubit<MagazineCardState> {
//   MagazineCardCubit()
//       : super(
//           const MagazineCardState(
//             magazineImages: [],
//           ),
//         );

//   void initializeMagazines() {
//     emit(state.copyWith(
//       position: state.position,
//       isDragging: true,
//       magazineImages: magazineImages,
//     ));
//   }

//   void onStartPosition(DragStartDetails details) {
//     emit(state.copyWith(
//       //   position: state.position,
//       isDragging: true,
//       // magazineImages: magazineImages,
//     ));
//   }

//   List<String> magazineImages = <String>[
//     AssetConsts.dazed2,
//     AssetConsts.dazed3,
//     AssetConsts.dazed1
//   ];

//   void onUpdatePosition(DragUpdateDetails details, Size size) {
//     final newPosition = details.delta + state.position;
//     final width = size.width - 120;
//     final angle = 60 * newPosition.dx / width;
//     emit(
//       state.copyWith(
//         position: newPosition,
//         screenSize: size,
//         angle: angle,
//         magazineImages: magazineImages,
//       ),
//     );
//   }

//   void resetMagazinePosition() {
//     emit(
//       state.copyWith(
//         position: Offset.zero,
//         isDragging: false,
//         screenSize: Size.zero,
//         angle: 0,
//         magazineImages: state.magazineImages,
//       ),
//     );
//   }

//   void setSize(Size size) {
//     emit(state.copyWith(
//       screenSize: size,
//     ));
//   }

//   Offset get newPosition => state.position;

//   set newPosition(Offset position) {
//     newPosition = position;
//   }

//   void onEndPosition(Size size, String imagePath) {
//     double dragAngle = 100;

//     if (state.angle.isNegative) {
//       newPosition += Offset(2 * size.width, 0);
//       print('STATE POSITION ${state.position}');
//       print('NEW POSITION $newPosition');
//     } else {
//       newPosition += Offset(-2 * size.width, 0);
//       print('STATE POSITION ${state.position}');
//       print('NEW POSITION $newPosition');
//     }
//     final magazineCardModel = state.magazineImages.removeLast();
//     state.magazineImages.insert(0, magazineCardModel);
//     print('Final POSITION $newPosition');

//     emit(
//       state.copyWith(
//         position: newPosition,
//         isDragging: false,
//         screenSize: Size.zero,
//         angle: dragAngle,
//         magazineImages: state.magazineImages,
//       ),
//     );

//     resetMagazinePosition();
//   }
// }
