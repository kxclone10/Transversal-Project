
import 'package:demo/Interne1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Interne3.dart';
class Interne2 extends StatefulWidget {
  const Interne2({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Interne2> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1,"photo": 'images/ab.png', "name": "Abdou SAKHO", "tel": '77 000 00 00'},
    {"id": 2,"photo": 'images/fille.png', "name": "Adja Thiam", "tel": '77 000 00 00'},
    {"id": 3,"photo": 'images/garcon.png', "name": "Allou Ndecky", "tel": '77 000 00 00'},
    {"id": 4,"photo": 'images/fille.png', "name": "Barbara", "tel": '77 000 00 00'},
    {"id": 5,"photo": 'images/fille.png', "name": "Candy", "tel": '77 000 00 00'},
    {"id": 6,"photo": 'images/garcon.png', "name": "Fidel Castro", "tel": '77 000 00 00'},
    {"id": 7,"photo": 'images/fille.png', "name": "Fatou Bâ", "tel": '77 000 00 00'},
    {"id": 8,"photo": 'images/fille.png', "name": "Fanta Ndiaye", "tel": '77 000 00 00'},
    {"id": 9,"photo": 'images/garcon.png', "name": "Aliou Dême", "tel": '77 000 00 00'},
    {"id": 10,"photo": 'images/fille.png', "name": "Becky", "tel": '77 000 00 00'},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 30, 15,10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                    fillColor: Color.fromARGB(0xFF,0xE4,0xF2,0xFB),
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(80,0,0,0),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.white,
                  elevation: 1.5,
                  margin: const EdgeInsets.symmetric(vertical:0.5),
                  child: ListTile(
                    leading:CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 22,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(_foundUsers[index]['photo'].toString()),
                      ),
                    ),/*
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),*/
                    title: Text(_foundUsers[index]['name']),
                    subtitle: Text(
                        _foundUsers[index]["tel"].toString(),
                      textAlign: TextAlign.start,
                    ),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const Interne3()));
                      },
                  ),
                ),
              )
                  : const Text(
                'Aucun résultat trouvé',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
        onPressed:() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Interne1()));
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
      ),
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        'Transfert',
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.only(right: 5),
          icon: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 22,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/femme.jpg'),
            ),
          ),
          tooltip: 'photo de profil',
          onPressed: () {},
        ),
      ],
      backgroundColor: const Color.fromARGB(0xFF,0x7B,0x61,0xFF),

    );
  }
}


class OutputSection extends StatefulWidget{
  const OutputSection({super.key});

  @override
  MyOutputField createState(){
    return MyOutputField();
  }
}

class MyOutputField extends State<OutputSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(0xFF,0x7B,0x61,0xFF),
            Colors.blueAccent,
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(300),
              bottomLeft: Radius.circular(300)),
        ),
      ),
      padding: const EdgeInsets.only(top: 30),

    );
  }

}