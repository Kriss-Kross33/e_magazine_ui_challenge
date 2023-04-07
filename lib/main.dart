import 'package:e_magazine_ui_challenge/src/ui/ui.dart';
import 'package:e_magazine_ui_challenge/src/utils/constants/asset_consts.dart';
import 'package:e_magazine_ui_challenge/src/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/blocs.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.addPostFrameCallback((_) async {
    BuildContext context = binding.renderViewElement!;
    for (var asset in AssetConsts.allAssets()) {
      precacheImage(AssetImage(asset), context);
    }
  });
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MagazineCardCubit>(
      create: (context) => MagazineCardCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        home: const MagazineHomeScreen(),
      ),
    );
  }
}
