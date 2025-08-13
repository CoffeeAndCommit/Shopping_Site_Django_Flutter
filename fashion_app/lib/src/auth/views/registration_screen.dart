import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/email_textfield.dart';
import 'package:fashion_app/common/widgets/password_field.dart';
import 'package:fashion_app/src/auth/controller/auth_notifier.dart';
import 'package:fashion_app/src/auth/models/login_model.dart';
import 'package:fashion_app/src/auth/models/registration_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegistrationPage> {
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _emailController = TextEditingController();

  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 160.h,
          ),
          Text(
            "Your Own Fashion",
            textAlign: TextAlign.center,
            style: appStyle(24, MColors.kPrimary, FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),

          Text(
            "Hi, welcome back you were missed",
            textAlign: TextAlign.center,
            style: appStyle(24, MColors.kGray, FontWeight.normal),
          ),
          // SizedBox(height: 10.h,),

          SizedBox(
            height: 25.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: 'UserName',
                  controller: _usernameController,
                  prefixIcon: const Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: MColors.kGray,
                  ),
                  keyboardType: TextInputType.name,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: 'Email ',
                  controller: _emailController,
                  prefixIcon: const Icon(
                    CupertinoIcons.mail,
                    size: 20,
                    color: MColors.kGray,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                PasswordField(
                  radius: 25,
                  focusNode: _passwordNode,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                context.watch<AuthNotifier>().isRegisLoading
                    ? const CircularProgressIndicator(
                        backgroundColor: MColors.kPrimary,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(MColors.kWhite),
                      )
                    : CustomButton(
                        onTap: () {
                          RegistrationModel model = RegistrationModel(
                              username: _usernameController.text,
                              password: _passwordController.text,
                              email: _emailController.text);

                          String data = registrationModelToJson(model);
                         
                          context
                              .read<AuthNotifier>()
                              .registrationFunction(data, context);
                        },
                        text: "S I G N U P",
                        btnWidth: ScreenUtil().screenWidth,
                        btnHieght: 40,
                        radius: 20,
                      )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 130.h,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 110,
            ),
            child: GestureDetector(
              onTap: () {
                context.push('/login');
              },
              child: Text(
                "Already Have An Account ? Sign In",
                style: appStyle(
                  12,
                  Colors.blue,
                  FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
