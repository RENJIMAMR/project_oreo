import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 330,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.loginBg),
                        fit: BoxFit.cover)),
                // child: Image.asset(ImageConstants.loginOreo),
              ),
              Positioned(
                top: 100,
                left: 40,
                child: Container(
                  height: 110,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ImageConstants.loginOreo,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 31),
              child: Form(
                key: _formKey,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: ColorConstants.blackMain,
                            fontSize: 35,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: ColorConstants.blackMain,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        controller: mailcontroller,
                        validator: (value) {
                          if (mailcontroller.text != null &&
                              mailcontroller.text.isNotEmpty &&
                              mailcontroller.text.contains('@gmail') &&
                              mailcontroller.text.contains('.in')) {
                            return null;
                          } else {
                            return 'Enter Valid Email';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter the mail Id',
                            hintStyle: TextStyle(
                                color: ColorConstants.greyMain, fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color:
                                        ColorConstants.greyMain.withOpacity(.3),
                                    width: 1))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            color: ColorConstants.blackMain,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (passcontroller.text != null &&
                              passcontroller.text.isNotEmpty &&
                              mailcontroller.text.length == 5) {
                            return null;
                          } else {
                            return 'Enter Valid Password';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter the password',
                            hintStyle: TextStyle(
                                color: ColorConstants.greyMain, fontSize: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color:
                                        ColorConstants.greyMain.withOpacity(.3),
                                    width: 1))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: checked,
                            onChanged: (value) {
                              checked = !checked;
                              setState(() {});
                            },
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                                color: ColorConstants.blackMain,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            'Forgot Password? ',
                            style: TextStyle(
                                color: ColorConstants.blueMain,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            return null;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: ColorConstants.redMain,
                                content: Text(
                                  'Invalid Crdentials',
                                  style: TextStyle(
                                      color: ColorConstants.whiteMain,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )));
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(ImageConstants.loginBg),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: ColorConstants.whiteMain,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
