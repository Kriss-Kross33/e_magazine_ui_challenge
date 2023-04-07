part of 'magazine_card_cubit.dart';

class MagazineCardState extends Equatable {
  const MagazineCardState({
    this.position = Offset.zero,
    this.isDragging = false,
    this.screenSize = Size.zero,
    this.angle = 0,
    required this.magazineImages,
  });

  final Offset position;
  final bool isDragging;
  final Size screenSize;
  final double angle;
  final List<String> magazineImages;

  MagazineCardState copyWith(
      {Offset? position,
      bool? isDragging,
      Size? screenSize,
      double? angle,
      List<String>? magazineImages}) {
    return MagazineCardState(
      position: position ?? this.position,
      isDragging: isDragging ?? this.isDragging,
      screenSize: screenSize ?? this.screenSize,
      angle: angle ?? this.angle,
      magazineImages: magazineImages ?? this.magazineImages,
    );
  }

  @override
  List<Object> get props =>
      [position, isDragging, screenSize, angle, magazineImages];
}
