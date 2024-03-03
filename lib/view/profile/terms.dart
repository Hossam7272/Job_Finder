import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions ',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,

      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Lorem ipsum dolor",
                style: TextStyle(
                    fontSize: 15,color:Colors.black,
                    fontWeight: FontWeight.bold
                ),

              ),
              const SizedBox(height: 20,),

              const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. '
                  'Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec '
                  'feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                  ' Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit '
                  'mauris rutrum at. '),


              const SizedBox(height: 20,),


              const Text("Lorem ipsum dolor",style: TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.bold


              ),

              ),

              const SizedBox(height: 20,),

              const Text('Nunc quis bibendum orci. Donec feugiat massa mi,'
                  'at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),

              const SizedBox(height: 30,),
              Container(
                width: 360,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. '
                      'Donec feugiat massa mi, at hendrerit mauris rutrum at. '),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci.'
                  ' Donec feugiat massa mi, at hendrerit mauris rutrum at. '),
            ]
        ),
      ) ,




    );
  }
}
