// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: const Text('Lorem Ipsum'),
            actions: [
              IconButton(onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.search)),
            ],
            bottom: const TabBar(tabs: [
              Tab(child: Text('ALL POSTS')),
              Tab(child: Text('PROFILE'))
            ])),
        body: TabBarView(children: [
          ListView.builder(itemBuilder: (context, index){
            return ListTile(title:Text('Title',
                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                subtitle:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed mattis finibus libero eu rutrum.',style: TextStyle(fontSize: 16),),
               Divider(height: 20.0,)
            ],),
            );
          }),
          Text('Profile')
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: (){},child: Icon(Icons.add,),),
      ),
    );
  }
}
