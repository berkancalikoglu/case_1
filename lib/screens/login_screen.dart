import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../utils/strings.dart';
import '../utils/validators.dart';
import '../utils/navigation.dart';
import '../services/toast_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  void _validateAndSubmit() {
    final errorMessage =
        Validators.validatePhoneNumber('+90${_phoneController.text}', context);
    if (errorMessage != null) {
      ToastService.showToast(errorMessage);
    } else {
      Navigation.navigateToHomeScreen(context);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 180.h),
                child: Container(
                  width: 74.w,
                  height: 74.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -5,
                        blurRadius: 15,
                        offset: const Offset(0, 11),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 50.h,
                      width: 50.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontSize: 28.sp,
                      height: 35.45.h / 28.sp,
                      letterSpacing: -3,
                    ),
              ),
              SizedBox(height: 70.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.loginMessage,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(9, 15, 71, 0.45),
                        fontSize: 13.h),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          '+90',
                          style: TextStyle(
                            fontSize: 20.h,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          style: TextStyle(
                            fontSize: 20.h,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: '9265614292',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(9, 15, 71, 0.45),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 2.h),
                          ),
                          onFieldSubmitted: (_) => _validateAndSubmit(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _validateAndSubmit,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: customBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                    child: Text(
                      AppStrings.continueButton,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.white, fontSize: 14.h),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
