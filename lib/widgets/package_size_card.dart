import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageSizeCard extends StatelessWidget {
  final String price;
  final String size;
  final bool selected;

  const PackageSizeCard({
    Key? key,
    required this.price,
    required this.size,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: selected
            ? const Color.fromARGB(24, 255, 164, 27)
            : const Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: selected ? const Color(0xFFFFA41B) : const Color(0xFFF5F5F5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            price,
            style: TextStyle(
              color: selected
                  ? const Color(0xFFFFA41B)
                  : const Color.fromRGBO(9, 15, 71, 1),
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          Text(
            size,
            style: TextStyle(
              letterSpacing: -0.7,
              color:
                  selected ? const Color(0xFFFFA41B) : const Color(0xFF090F47),
            ),
          ),
        ],
      ),
    );
  }
}
