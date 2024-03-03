import 'package:flutter/material.dart';
import 'package:job_finder/main.dart';

class Privacy_Policy extends StatelessWidget {
  const Privacy_Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      appBar: AppBar(
        title: const Text('Privacy Policy',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,

      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
            children: const  [
               Text("Your privacy is important",
                style: TextStyle(
                    fontSize: 15,color:Colors.black,
                    fontWeight: FontWeight.bold


                ),


              ),
              SizedBox(height: 20,),


              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.'
                  ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. '
                  'Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. '
                  'Donec feugiat massa mi, at hendrerit mauris rutrum at. '),
              SizedBox(height: 20,),
              Text("Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci."
                  " Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. "
                  "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. "),
              SizedBox(height: 30,),
              Text('Data controllers and contract partners',style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci.'
                  ' Donec feugiat massa mi, at hendrerit mauris rutrum at. '),

            ],
        ),

      ),

    );
  }
}
