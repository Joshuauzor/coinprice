import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/app/app.dart';
import 'package:todo/app/styles/loader.dart';
import 'package:todo/features/home/home.dart';

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
                                profit: item.ath,
                                image: item.image,
                              );
                            },
                          ),
                          // SingleChildScrollView(
                          //   child: Column(
                          //     children: [
                          //       CurrencyList(
                          //           status: '',
                          //           currency: '',
                          //           amount: 'amount',
                          //           time: 'time',
                          //           profit: 'profit')
                          //     ],
                          //   ),
                          // ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class CurrencyList extends StatelessWidget {
  const CurrencyList({
    required this.status,
    required this.currency,
    required this.amount,
    required this.time,
    required this.profit,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String status;
  final dynamic currency;
  final dynamic amount;
  final String time;
  final dynamic profit;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14),
                color: AppColors.white,
              ),
              child: Image.network(
                image,
              ),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BodyText(
                    'Received',
                    color: AppColors.ash,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BodyText(
                        '$amount $currency',
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      BodyText(
                        profit.toString(),
                        color: AppColors.green,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  const Gap(10),
                  const BodyText(
                    '09:34, AUG 27, 2022',
                    color: AppColors.ash,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
          ],
        ),
        const Gap(30)
      ],
    );
  }
}
