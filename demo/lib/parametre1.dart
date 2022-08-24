import 'package:demo/Aide.dart';
import 'package:demo/Connexion1.dart';
import 'package:demo/Externe1.dart';
import 'package:demo/Interne1.dart';
import 'package:demo/Transfert1.dart';
import 'package:demo/changerCode1.dart';
import 'package:demo/depot1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: constant_identifier_names
class Param1 extends StatelessWidget{
  const Param1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar:MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            LogoSection(),
            InputSection(),
            // EnterOTP(),
          ],
        ),
      ),
    );
  }
}
class InputSection extends StatefulWidget{
  const InputSection({super.key});

  @override
  MyInputField createState(){
    return MyInputField();
  }
}


class MyInputField extends State<InputSection>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 197),
              child:  Text(
                'fatima  Sow',          // will be change after the backend done
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 50, 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(20,0,20,0),
                  title: const Text(
                      'Changer votre code secret',
                      style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const ChangerCode1()));
                  },
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 0.1),
                      borderRadius: BorderRadius.circular(10.0)),

                ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(20,0,20,0),
                title: const Text(
                  'Langue',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Transfert1()));
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey, width: 0.1),
                    borderRadius: BorderRadius.circular(10.0)),

              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(20,0,20,0),
                title: const Text(
                  'Aide',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Depot1()));
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey, width: 0.1),
                    borderRadius: BorderRadius.circular(10.0)),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 50, 80, 10),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(20,10,20,10),
                title: const Text(
                  'Deconnexion',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(0xFF,0x26,0x70,0xC6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: const Icon(
                  Icons.logout,
                  color: Color.fromARGB(0xFF,0x26,0x70,0xC6),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Connexion1()));
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color.fromARGB(0xFF,0x26,0x70,0xC6), width: 0.1),
                    borderRadius: BorderRadius.circular(40.0)),

              ),
            ),

          ],
        )
    );
  }
}

class LogoSection extends StatelessWidget{
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        padding: const  EdgeInsets.fromLTRB(0,50,0,10),
        child: Column(
          children: const [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('images/femme.jpg'),
                  ),
                )
          ],
        )
    );
  }
}


class EnterOTP extends StatelessWidget {
  const EnterOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OTPDigitTextFieldBox(first: true, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: true),
            ],
          )
        ]),
      ),
    );
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  const OTPDigitTextFieldBox(
      {Key? key, required this.first, required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            //contentPadding: const EdgeInsets.fromLTRB(5,0,2,0),
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.green),
                borderRadius: BorderRadius.circular(0)),
            hintText: "",
          ),
        ),
      ),
    );
  }
}








