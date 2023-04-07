import 'dart:math';

import 'package:e_magazine_ui_challenge/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';

class MagazineCard extends StatelessWidget {
  final String imagePath;
  final bool isFrontImage;
  const MagazineCard({
    super.key,
    required this.imagePath,
    required this.isFrontImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: !isFrontImage
          ? BackCard(
              imagePath: imagePath,
              size: size,
            )
          : GestureDetector(
              onPanStart: (details) {
                context.read<MagazineCardCubit>().onStartPosition(details);
              },
              onPanUpdate: (details) {
                context
                    .read<MagazineCardCubit>()
                    .onUpdatePosition(details, size);
              },
              onPanEnd: (details) {
                context
                    .read<MagazineCardCubit>()
                    .onEndPosition(size, imagePath);
              },
              child: BlocBuilder<MagazineCardCubit, MagazineCardState>(
                builder: (context, state) {
                  return LayoutBuilder(builder: (context, constraints) {
                    final angle = state.angle * pi / 180;
                    final center = constraints.smallest.center(Offset.zero);
                    return AnimatedContainer(
                      curve: Curves.ease,
                      duration: state.isDragging
                          ? const Duration(milliseconds: 0)
                          : const Duration(milliseconds: 300),
                      transform: Matrix4.identity()
                        ..translate(center.dx, center.dy)
                        ..rotateZ(angle)
                        ..translate(center.dx, center.dy)
                        ..translate(
                          state.position.dx,
                          state.position.dy,
                        ),
                      height: size.height * 0.42,
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
                    );
                  });
                },
              ),
            ),
    );
  }
}

class BackCard extends StatelessWidget {
  final String imagePath;
  final Size size;
  const BackCard({
    super.key,
    required this.imagePath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.42,
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
    );
  }
}
