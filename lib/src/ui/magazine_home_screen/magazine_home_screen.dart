import 'package:e_magazine_ui_challenge/src/blocs/blocs.dart';
import 'package:e_magazine_ui_challenge/src/ui/magazine_home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/asset_consts.dart';
import '../../utils/utils.dart';

class MagazineHomeScreen extends StatefulWidget {
  const MagazineHomeScreen({super.key});

  @override
  State<MagazineHomeScreen> createState() => _MagazineHomeScreenState();
}

class _MagazineHomeScreenState extends State<MagazineHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      context.read<MagazineCardCubit>().setSize(size);
    });
    context.read<MagazineCardCubit>().initializeMagazines();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: AppColor.black,
            ),
            label: '',
            activeIcon: Icon(
              Icons.home_filled,
              color: AppColor.black,
            ),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble,
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.circle_sharp,
            ),
            label: '',
          ),
        ],
      ),
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: const BoxDecoration(),
            ),
          ),
          Positioned(
            top: 40,
            left: 30,
            right: 30,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.cyan,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Magaz',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  AssetConsts.scanner,
                  height: 25,
                  width: 25,
                  color: AppColor.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 30,
            child: SizedBox(
              height: 50,
              width: size.width,
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  prefixIconConstraints: const BoxConstraints(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Image.asset(
                      AssetConsts.search,
                      color: AppColor.white,
                      height: 35,
                      width: 35,
                      fit: BoxFit.fill,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF232223),
                ),
              ),
            ),
          ),
          Positioned(
            child: BlocBuilder<MagazineCardCubit, MagazineCardState>(
              builder: (context, state) {
                return Stack(
                  children: state.magazineImages
                      .map(
                        (magazineImage) => Transform(
                          transform: Matrix4.identity(),
                          //      ..rotateZ(cardModel.angle * pi / 180),
                          //  alignment: Alignment.center,
                          child: MagazineCard(
                            imagePath: magazineImage,
                            isFrontImage:
                                state.magazineImages.last == magazineImage,
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            right: 30,
            child: MagazineList(
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
