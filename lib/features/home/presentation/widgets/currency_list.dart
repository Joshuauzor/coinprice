import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo/app/app.dart';

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
              child: Center(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                    ),
                  ),
                ),
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
                        maxLines: 3,
                      ),
                      BodyText(
                        profit.toStringAsFixed(2),
                        color: AppColors.green,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
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
