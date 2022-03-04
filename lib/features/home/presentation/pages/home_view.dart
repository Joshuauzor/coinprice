import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/app/app.dart';
import 'package:todo/app/styles/loader.dart';
import 'package:todo/features/home/home.dart';

import '../widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return model.stocks == null
              ? const Center(
                  child: Loader(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BodyText(
                              'History',
                              color: AppColors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                            Row(
                              children: const [
                                Icon(Icons.ac_unit),
                                Gap(5),
                                BodyText(
                                  'Sort/Filter',
                                  color: AppColors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            )
                          ],
                        ),
                        const Gap(20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.stocks!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final Stocks item = model.stocks![index];
                              return CurrencyList(
                                status: '',
                                currency: item.name,
                                amount: item.currentPrice,
                                time: 'time',
                                profit: item.athChangePercentage,
                                image: item.image,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
