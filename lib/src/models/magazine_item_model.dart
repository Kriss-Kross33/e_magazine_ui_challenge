import 'package:e_magazine_ui_challenge/src/utils/constants/asset_consts.dart';

class MagazineItemModel {
  final String imagePath;

  MagazineItemModel({required this.imagePath});
}

List<MagazineItemModel> magazineItemModels = [
  MagazineItemModel(imagePath: AssetConsts.magItem1),
  MagazineItemModel(imagePath: AssetConsts.magItem2),
  MagazineItemModel(imagePath: AssetConsts.magItem3),
  MagazineItemModel(imagePath: AssetConsts.magItem4),
];
