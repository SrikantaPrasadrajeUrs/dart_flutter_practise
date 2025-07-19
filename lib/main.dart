import 'package:first_project/ui_clone/channel_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // this widget will be displayed in ui
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigoAccent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.black,       // ✅ explicitly set
            unselectedItemColor: Colors.grey,      // ✅ explicitly set
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.black),
          )
      ),
      home: const Demo1(),
    );
  }
}

class Demo1 extends StatefulWidget {
  const Demo1({super.key});

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  int count = 0;
  TextStyle greyStyle = TextStyle(color: Colors.grey, fontSize: 16);

  Widget getRowWidget(String imageUrl, String name, int number){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(imageUrl, height: 50, width: 50, fit: BoxFit.fill)),
          SizedBox(width: 10),
          Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
          Spacer(),
          Container(
              width: 30,
              height: 17,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("$number", style: TextStyle(fontSize: 10, color: Colors.indigoAccent),)))
        ],
      ),
    );
  }

  Widget getChannel(String imageUrl, String channelName){
    return  GestureDetector(
      onTap: (){
        // Navigator
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChannelPage(
          channelName: channelName,
          imageUrl: imageUrl,
        )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(imageUrl, height: 50, width: 50, fit: BoxFit.fill)),
            SizedBox(width: 10),
            Text(channelName, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),// name
            Spacer(),
          ],
        ),
      ),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  void showPopUp(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Add Channels"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Channel Name"
                ),
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(
                    hintText: "image url"
                ),
              ),
            ],
          ),
        );
      }
    ).whenComplete((){
      setState(()=>channels.add(
          getChannel(imageUrlController.text, nameController.text)
      ));
      nameController.clear();
      imageUrlController.clear();
    });
  }

  List<Widget> channels = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)

          ),
          child: Icon(Icons.add_a_photo_outlined, size: 18),
        ),
        title: Text("Cool Company", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        actions: [ // row
          Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,),
          SizedBox(width: 10)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.black,), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black,), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black,), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.share, color: Colors.black,), label: "Share"),
          ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              shape: RoundedRectangleBorder(),
              leading: Icon(Icons.keyboard_arrow_down, color: Colors.black),
              title: Text("Team Marketing", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                showTrailingIcon: false,
              expandedAlignment: Alignment.centerLeft,
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.only(left: 60),
              children: [
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Branding", style: greyStyle,),
                    Text("Content stuff", style: greyStyle,),
                    Text("Digital", style: greyStyle,),
                    Text("Public regulations", style: greyStyle,),
                    Text("Seo activities", style: greyStyle,),
                    Text("Social media", style: greyStyle,),
                    Text("strategists", style: greyStyle,),
                    Text("Flutter", style: greyStyle,),
                  ],
                )
              ],
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            Text("Unread", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17)),
            getRowWidget("https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=",
            "Peter", 2),
            getRowWidget("https://static-cse.canva.com/blob/1911653/tools_transparent-background_promo-showcase_01-AFTER.jpg", "Bjorn", 1),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            Text("Channels", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17)),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: Column(
                children: channels,
              ),
            ),
            GestureDetector(
                onTap: (){
                  showPopUp();
                },
                child: Text("+ Add channels", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 17))),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: (){},
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                spreadRadius: 3,
                offset: Offset(1.4, 2)
              )
            ],
            borderRadius: BorderRadius.circular(35)),
          child: Center(child: Icon(Icons.edit, color: Colors.white, size: 15)),
        ),
      ),
    );
  }
}
