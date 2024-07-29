// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/deal_model.dart';
import '../widgets/package_size_card.dart';
import '../widgets/product_detail_item.dart';

class ProductDetails extends StatefulWidget {
  final Deal deal;

  const ProductDetails({super.key, required this.deal});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF091C3F)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          actions: [
            Image.asset(
              'assets/notification2.png',
              width: 22.5.w,
              height: 22.5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 24.w),
              child: Image.asset(
                'assets/shopping_bag2.png',
                width: 22.5.w,
                height: 22.5.h,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name: ${widget.deal.name}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF090F47)),
              ),
              SizedBox(height: 4.h),
              Text(
                'Etiam mollis metus non purus',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color.fromRGBO(9, 15, 71, 0.45),
                    ),
              ),
              SizedBox(height: 8.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: const Color(0xFFF8F8F8),
                ),
                width: 310.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                      child: PageView.builder(
                        itemCount: 3,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            'assets/product1.png',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? const Color(0xFF4157FF)
                            : const Color.fromRGBO(9, 15, 71, 0.45),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text(
                    'price ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(9, 15, 71, 1),
                        ),
                  ),
                  const Text(
                    'Rs.99',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Color.fromRGBO(9, 15, 71, 0.5),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    widget.deal.data?.price?.toString() ?? 'Belirtilmemiş',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color.fromRGBO(9, 15, 71, 1),
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              if (widget.deal.data != null) ...[
                if (widget.deal.data?.year != null)
                  ProductDetailItem(
                    title: 'year',
                    value: widget.deal.data!.year.toString(),
                  ),
                if (widget.deal.data?.cpuModel != null)
                  ProductDetailItem(
                    title: 'CPU model',
                    value: widget.deal.data!.cpuModel!,
                  ),
                if (widget.deal.data?.hardDiskSize != null)
                  ProductDetailItem(
                    title: 'Hard disk size',
                    value: widget.deal.data!.hardDiskSize!,
                  ),
                if (widget.deal.data?.color != null)
                  ProductDetailItem(
                    title: 'color',
                    value: widget.deal.data!.color!,
                  ),
                if (widget.deal.data?.capacity != null)
                  ProductDetailItem(
                    title: 'Capacity',
                    value: widget.deal.data!.capacity!,
                  ),
                if (widget.deal.data?.generation != null)
                  ProductDetailItem(
                    title: 'generation',
                    value: widget.deal.data!.generation!,
                  ),
                if (widget.deal.data?.strapColor != null)
                  ProductDetailItem(
                    title: 'Strap color',
                    value: widget.deal.data!.strapColor!,
                  ),
                if (widget.deal.data?.caseSize != null)
                  ProductDetailItem(
                    title: 'Case size',
                    value: widget.deal.data!.caseSize!,
                  ),
                if (widget.deal.data?.screenSize != null)
                  ProductDetailItem(
                    title: 'Screen size',
                    value: widget.deal.data!.screenSize.toString(),
                  ),
                if (widget.deal.data?.description != null)
                  ProductDetailItem(
                    title: 'Description',
                    value: widget.deal.data!.description!,
                  ),
              ],
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Etiam mollis",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color.fromRGBO(9, 15, 71, 0.7),
                                ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              SizedBox(height: 4.h),
              Text(
                'Package size',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(9, 15, 71, 1)),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const PackageSizeCard(
                    price: 'Rs.106',
                    size: '500 pellets',
                    selected: true,
                  ),
                  SizedBox(width: 16.w),
                  const PackageSizeCard(
                    price: 'Rs.166',
                    size: '110 pellets',
                    selected: false,
                  ),
                  SizedBox(width: 16.w),
                  const PackageSizeCard(
                    price: 'Rs.252',
                    size: '300 pellets',
                    selected: false,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Product Details',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(9, 15, 71, 1),
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(9, 15, 71, 0.45),
                    ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(9, 15, 71, 1),
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(9, 15, 71, 0.45),
                    ),
              ),
              SizedBox(height: 8.h),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductDetailItem(
                    title: 'Expiry Date',
                    value: '25/12/2023',
                  ),
                  ProductDetailItem(
                    title: 'Brand Name',
                    value: 'Something',
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
