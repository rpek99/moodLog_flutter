import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:mood_log_app/src/theme/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Country selectedCountry = Country(
    phoneCode: "90",
    countryCode: "TR",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Türkiye",
    example: "Türkiye",
    displayName: "Türkiye",
    displayNameNoCountryCode: "TR",
    e164Key: "",
  );

  bool? isChecked = false;

  final TextEditingController _controllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Moodify',
          style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/moodify_logo.png', // Replace with your image asset
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Log In or Sign Up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 50,
                decoration: BoxDecoration(
                    color: foreignGrey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: foreignGrey)),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controllerPhoneNumber,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _controllerPhoneNumber.text = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              hintStyle: const TextStyle(
                                color: Colors.black38,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffixIcon: _controllerPhoneNumber.text.length > 9
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      margin: const EdgeInsets.all(10.0),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: foreignGrey),
                                      child: const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  : null,
                              prefixIcon: Container(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  right: 8.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                        context: context,
                                        countryListTheme:
                                            const CountryListThemeData(
                                          bottomSheetHeight: 500,
                                        ),
                                        onSelect: (value) {
                                          setState(() {
                                            selectedCountry = value;
                                          });
                                        });
                                  },
                                  child: Text(
                                    "${selectedCountry.flagEmoji}  +${selectedCountry.phoneCode}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(width: 140.0, child: Divider()),
                  ),
                  Text("or"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(width: 140.0, child: Divider()),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                icon: const Icon(Icons.g_translate),
                label: const Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: foreignGrey,
                  foregroundColor: foreignBlack,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                icon: const Icon(Icons.apple),
                label: const Text('Sign in with Apple'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: foreignGrey,
                  foregroundColor: foreignBlack,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: foreignBlack,
                      checkColor: const Color.fromARGB(255, 255, 255, 255),
                      side: const BorderSide(color: Colors.black, width: 1.5),
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By continuing, you agree to our Terms",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            TextSpan(
                              text: "of Service and Privacy Policy",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                height: 40,
                child: Card(
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: foreignBlack,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onTap: () {},
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18,
                            color: foreignGrey,
                            fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
