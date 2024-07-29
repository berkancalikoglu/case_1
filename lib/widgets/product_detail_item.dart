import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailItem extends StatelessWidget {
  final String title;
  final String value;

  const ProductDetailItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(9, 15, 71, 1),
              ),
        ),
        SizedBox(width: 24.w),
        Text(
          value,
          style: const TextStyle(
            color: Color.fromRGBO(9, 15, 71, 1),
          ),
        ),
      ],
    );
  }
}
