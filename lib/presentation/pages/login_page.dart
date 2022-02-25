import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/common/state_enum.dart';
import 'package:jangjo_customer/presentation/pages/home_page.dart';
import 'package:jangjo_customer/presentation/pages/register_page.dart';
import 'package:jangjo_customer/presentation/provider/auth_notifier.dart';
import 'package:jangjo_customer/presentation/widgets/back_button_widget.dart';
import 'package:jangjo_customer/presentation/widgets/custom_alert.dart';
import 'package:jangjo_customer/presentation/widgets/loader.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:jangjo_customer/presentation/widgets/primary_button.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  // ignore: constant_identifier_names
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
        body: BuildViewLogin(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

class BuildViewLogin extends StatefulWidget {
  const BuildViewLogin({Key? key}) : super(key: key);

  @override
  State<BuildViewLogin> createState() => _BuildViewLoginState();
}

class _BuildViewLoginState extends State<BuildViewLogin> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  // untuk menampung apakah password dapat dilihat atau tidak
  bool _secure = true;
  bool _isValidEmail = false;
  bool _isValidPassword = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void _loginUser() async {
    setState(() {
      _isLoading = true;
    });

    var email = _emailController.text;
    var password = _passwordController.text;
    final bool isValid = EmailValidator.validate(_emailController.text);
    final bool isValidPassword = _passwordController.text.length >= 6;
    // if (isValid && isValidPassword) {
    AuthNotifier stateLogin = Provider.of<AuthNotifier>(context, listen: false);

    try {
      await stateLogin.loginUser(email, password);
      if (stateLogin.state == RequestState.loaded) {
        Navigator.pushNamed(context, HomePage.routeName);
      } else {
        // show error
        setState(() {
          _isLoading = false;
        });
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CustomAlert(
              title: "Warning",
              content: Container(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Failed process authentication",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: kGrey),
                ),
              ),
              onCancel: () {
                Navigator.of(context).pop();
              },
              onContinue: () async {
                Navigator.of(context).pop();
              },
              isCancelButtonExist: false,
              confirmLabel: "Ok",
              cancelLabel: 'Tidak',
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: BackButtonWidget(),
            ),
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Welcome Back! ',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: kBlack),
                  ),
                  const Text(
                    'Sign in to your account.',
                    style: TextStyle(color: kGrey, fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(color: kBlack),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Email',
                  errorText:
                      _isValidEmail ? 'Please enter a valid email' : null,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: kPink,
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Color(0xffF9F9FA), width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xffF9F9FA), width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: Stack(
                children: [
                  TextField(
                    controller: _passwordController,
                    style: const TextStyle(color: kBlack),
                    obscureText: _secure,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: _isValidPassword
                          ? 'Please enter password min 6'
                          : null,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: kPink,
                      ),
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(0xffF9F9FA), width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Color(0xffF9F9FA), width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: InkWell(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            _secure = !_secure;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 35,
                        ),
                        child: Icon(
                          _secure ? Icons.visibility : Icons.visibility_off,
                          size: 18,
                          color: kPink,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: _isLoading
                  ? Loader()
                  : const SizedBox(
                      height: 16,
                    ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: kPink),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: edge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: PrimaryButton(
                  text: 'Login',
                  onTap: () {
                    // var email = _emailController.text;
                    // var password = _passwordController.text;
                    // Provider.of<LoginNotifier>(context, listen: false)
                    //     .loginUser(email, password);
                    _loginUser();
                    // } else {
                    //   if (!isValidPassword) {
                    //     setState(() {
                    //       _isValidPassword = true;
                    //     });
                    //   } else {
                    //     setState(() {
                    //       _isValidEmail = true;
                    //     });
                    //   }
                    // }
                  }),
            ),
            // Consumer<LoginNotifier>(
            //   builder: (context, data, child) {
            //     if (data.state == RequestState.loading) {
            //       return Center(
            //         child: Loader(),
            //       );
            //     } else if (data.state == RequestState.loaded) {
            //       Navigator.pushNamed(context, HomePage.routeName);
            //       return Container();
            //     } else {
            //       if (data.state == RequestState.error) {
            //         // ScaffoldMessenger.of(context).showSnackBar(
            //         //   const SnackBar(
            //         //     content: Text("Login failed"),
            //         //   ),
            //         // );
            //         showAlertDialog(BuildContext context) {
            //           // set up the button
            //           Widget okButton = TextButton(
            //             child: Text("OK"),
            //             onPressed: () {},
            //           );

            //           // set up the AlertDialog
            //           AlertDialog alert = AlertDialog(
            //             title: Text("Warning"),
            //             content: Text("Login Failed"),
            //             actions: [
            //               okButton,
            //             ],
            //           );

            //           // show the dialog
            //           showDialog(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return alert;
            //             },
            //           );
            //         }
            //       }
            //     }
            //     return Container();
            //   },
            // ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have account? ',
                    style: TextStyle(color: kGrey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: kPink),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(color: kGrey),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Or login with',
                      style: TextStyle(color: kGrey),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(color: kGrey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE8E8E8), width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/ic_google.png',
                      width: 20,
                    ),
                    const Expanded(
                        child: Center(
                      child: Text(
                        'Login with Google',
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: edge,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
