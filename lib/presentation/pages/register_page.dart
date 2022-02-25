import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/presentation/pages/login_page.dart';
import 'package:jangjo_customer/presentation/pages/otp_page.dart';
import 'package:jangjo_customer/presentation/widgets/back_button_widget.dart';
import 'package:jangjo_customer/presentation/widgets/input_text.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:jangjo_customer/presentation/widgets/primary_button.dart';

class RegisterPage extends StatelessWidget {
  // ignore: constant_identifier_names
  static const routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
          body: BuildViewRegister(
        key: UniqueKey(),
      )),
    );
  }
}

class BuildViewRegister extends StatefulWidget {
  const BuildViewRegister({Key? key}) : super(key: key);

  @override
  _BuildViewRegisterState createState() => _BuildViewRegisterState();
}

class _BuildViewRegisterState extends State<BuildViewRegister> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget passIcon = const Icon(
    Icons.lock,
    color: kPink,
  );

  bool _obscureText = true;

  final String _password = 'password';
  bool _aggree = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: edge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const BackButtonWidget(),
              const SizedBox(
                height: edge,
              ),
              Text(
                'Getting Started',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: kBlack),
              ),
              Text(
                'Create an account to continue!',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kGrey, fontSize: 16),
              ),
              const SizedBox(
                height: edge,
              ),
              InputText(
                  icon: const Icon(
                    Icons.person_sharp,
                    color: kPink,
                  ),
                  controller: _fullNameController,
                  hintText: 'Full Name'),
              const SizedBox(
                height: 16,
              ),
              InputText(
                  icon: const Icon(
                    Icons.mail,
                    color: kPink,
                  ),
                  controller: _emailController,
                  hintText: 'Email'),
              const SizedBox(
                height: 16,
              ),
              InputText(
                  icon: const Icon(
                    Icons.mail,
                    color: kPink,
                  ),
                  controller: _phoneController,
                  hintText: 'Phone'),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 56,
                color: kBackground,
                child: Stack(
                  children: [
                    TextField(
                      controller: _passwordController,
                      style: const TextStyle(color: kBlack),
                      obscureText: _obscureText,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: _password,
                        prefixIcon: passIcon,
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: kBackground, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: kBackground, width: 2),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: _toggle,
                          child: _obscureText
                              ? Image.asset(
                                  'assets/ic_eye.png',
                                  width: 24,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: kPink,
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _aggree,
                    checkColor: kWhite,
                    activeColor: kPink,
                    shape: const CircleBorder(),
                    onChanged: (value) {
                      setState(() {
                        _aggree = value!;
                      });
                    },
                  ),
                  Text(
                    'By creating an account, you aggree to\nour Terms and Conditions',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: kBlack),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              PrimaryButton(
                text: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, OtpPage.routeName);
                },
                enable: _aggree,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Already have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kGrey),
                      children: [
                        TextSpan(
                          text: ' Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(
                                context, LoginPage.routeName),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kPink),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              // Row(
              //   children: <Widget>[
              //     Expanded(
              //       child: Container(
              //         height: 1,
              //         decoration: const BoxDecoration(color: kGrey),
              //       ),
              //     ),
              //     const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 16),
              //       child: Text(
              //         'Or login with',
              //         style: TextStyle(color: kGrey),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         height: 1,
              //         decoration: const BoxDecoration(color: kGrey),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 16,
              ),
              // Container(
              //   height: 56,
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: const Color(0xffE8E8E8), width: 1),
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         'assets/ic_google.png',
              //         width: 20,
              //       ),
              //       const Expanded(
              //           child: Center(
              //         child: Text(
              //           'Continue with Google',
              //           style: TextStyle(
              //               color: kBlack,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w700),
              //         ),
              //       ))
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: edge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
