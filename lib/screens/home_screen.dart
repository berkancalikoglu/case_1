import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import '../models/deal_model.dart';
import '../services/toast_service.dart';
import '../theme/app_theme.dart';
import '../utils/navigation.dart';
import '../utils/strings.dart';
import '../widgets/category_container.dart';
import '../widgets/deal_grid.dart';
import '../widgets/banner.dart';
import '../services/api_service.dart';
import '../widgets/image_dialog.dart';
import '../services/image_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Deal>> futureDeals;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    futureDeals = ApiService().fetchDeals();
    _loadImageFromCache();
  }

  Future<void> _loadImageFromCache() async {
    _imageFile = await ImageService.loadImageFromCache();
    setState(() {});
  }

  Future<void> _pickImage() async {
    var image = await ImageService.pickImage();
    if (image != null) {
      _showImageDialog(image);
    }
  }

  Future<void> _showImageDialog(File imageFile) async {
    showDialog(
      context: context,
      builder: (context) => ImageDialog(
        imageFile: imageFile,
        onSave: (croppedFile) {
          setState(() {
            _imageFile = croppedFile;
          });
          ImageService.saveImageToCache(croppedFile.path);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFF),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildHeader(),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTopCategories(),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => ToastService.showToast(
                                "Dental kategorisine tıkladınız"),
                            child: const CategoryContainer(
                              title: 'Dental',
                              gradient: LinearGradient(
                                colors: [Color(0xFFFF9598), Color(0xFFFF70A7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => ToastService.showToast(
                                "Wellness kategorisine tıkladınız"),
                            child: const CategoryContainer(
                              title: 'Wellness',
                              gradient: LinearGradient(
                                colors: [Color(0xFF19e5a5), Color(0xFF15bd92)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => ToastService.showToast(
                                "Homeo kategorisine tıkladınız"),
                            child: const CategoryContainer(
                              title: 'Homeo',
                              gradient: LinearGradient(
                                colors: [Color(0xFFFFC06F), Color(0xFFFF793A)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => ToastService.showToast(
                                "Eye care kategorisine tıkladınız"),
                            child: const CategoryContainer(
                              title: 'Eye care',
                              gradient: LinearGradient(
                                colors: [Color(0xFF4DB7FF), Color(0xFF3E7DFF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      const BannerWidget(),
                      SizedBox(height: 24.h),
                      _buildDealsOfTheDay(),
                      FutureBuilder<List<Deal>>(
                        future: futureDeals,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Hata: ${snapshot.error}'));
                          } else {
                            return DealGrid(
                              deals: snapshot.data
                                      ?.where(
                                          (deal) => deal.data?.price != null)
                                      .toList() ??
                                  [],
                              onDealTap: (deal) =>
                                  Navigation.navigateToProductDetails(
                                      context, deal),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildSearchBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: customBlue,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -260.h,
            left: -220.w,
            child: Container(
              width: 400.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!)
                            : const AssetImage('assets/photo1.png')
                                as ImageProvider,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    const Spacer(),
                    Image.asset(
                      'assets/notification.png',
                      width: 22.5.w,
                      height: 22.5.h,
                    ),
                    SizedBox(width: 16.w),
                    Image.asset(
                      'assets/shopping_bag.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Rahul',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                    ),
                    Text(
                      AppStrings.welcomeMessage,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopCategories() {
    return Text(
      AppStrings.topCategories,
      style: Theme.of(context)
          .textTheme
          .displaySmall
          ?.copyWith(fontSize: 14.h, color: const Color.fromRGBO(9, 15, 71, 1)),
    );
  }

  Widget _buildDealsOfTheDay() {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.dealsOfTheDay,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 14.h, color: const Color.fromRGBO(9, 15, 71, 1)),
          ),
          Text(
            AppStrings.more,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF006AFF),
                  fontSize: 12.h,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: 170.h,
      left: 26.w,
      right: 26.w,
      child: Container(
        padding: EdgeInsets.only(left: 4.w, right: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            border: InputBorder.none,
            hintText: AppStrings.searchHint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
          ],
        ),
      ),
    );
  }
}
