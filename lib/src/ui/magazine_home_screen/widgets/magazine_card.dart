import 'package:e_magazine_ui_challenge/src/utils/utils.dart';
import 'package:flutter/material.dart';

class MagazineCard extends StatelessWidget {
  final String imagePath;
  const MagazineCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height * 0.4,
        width: size.width - 120,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.alabaster,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
