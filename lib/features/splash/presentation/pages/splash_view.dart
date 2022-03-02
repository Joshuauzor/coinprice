import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/app/app.dart';
import 'package:todo/core/constant/constant.dart';
import 'package:todo/features/splash/presentation/viewmodel/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _splashModel = SplashViewModel();

  @override
  void initState() {
    _splashModel.getList(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ViewModelBuilder<SplashViewModel>.nonReactive(
        viewModelBuilder: () => SplashViewModel(),
        builder: (context, model, child) {
          return Center(
            child: SizedBox(
              height: 150,
              width: 170,
              child: Image.asset(AppAssets.laucherImage),
            ),
          );
        },
      ),
    );
  }
}
