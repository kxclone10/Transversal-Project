import 'package:demo/ChangerCode3.dart';
import 'package:demo/Connexion3.dart';
import 'package:demo/changerCode1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: constant_identifier_names
class ChangerCode2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              padding: const EdgeInsets.only(left: 50),
              child:  Text(
                'Entrez votre nouveau code secret',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,50,0),
              child: EnterOTP(),
            ),




            Padding(
              padding: const EdgeInsets.fromLTRB(50,50,50,0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ChangerCode3()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(0xFF,0x00,0x01,0x4F),
                  onPrimary: Colors.white,
                  shadowColor: Colors.blueAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(400, 50), //////// HERE
                ),
                child: const Text(
                  'Suivant',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30,80,0,80),
              height: 90,
              width: 90,
              decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.fill,
                  )
              ),
            )
          ],
        )
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed:() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const ChangerCode1()));
        },
      ),
      backgroundColor: Colors.white,
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








