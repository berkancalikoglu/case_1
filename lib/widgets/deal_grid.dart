import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/deal_model.dart';
import 'deal_card.dart';

class DealGrid extends StatelessWidget {
  final List<Deal> deals;
  final Function(Deal) onDealTap;

  const DealGrid({
    Key? key,
    required this.deals,
    required this.onDealTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 70 / 100,
      ),
      itemCount: deals.length,
      itemBuilder: (context, index) {
        final deal = deals[index];
        return GestureDetector(
          onTap: () => onDealTap(deal),
          child: DealCard(
            title: deal.name,
            imagePath: 'assets/product1.png',
            price: deal.data?.price?.toString() ?? 'Belirtilmemiş',
          ),
        );
      },
    );
  }
}
