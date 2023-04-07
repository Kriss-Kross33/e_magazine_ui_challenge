import 'package:e_magazine_ui_challenge/src/models/models.dart';
import 'package:e_magazine_ui_challenge/src/ui/magazine_home_screen/widgets/widgets.dart';
import 'package:e_magazine_ui_challenge/src/utils/utils.dart';
import 'package:flutter/material.dart';

class MagazineList extends StatelessWidget {
  final Size size;
  const MagazineList({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'All magazines',
            style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: magazineItemModels.length,
              itemBuilder: (context, index) {
                return MagazineItem(
                  imagePath: magazineItemModels[index].imagePath,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
