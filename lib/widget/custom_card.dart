import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final String imageAvatar,nameText,emailText;

  const CustomCard({Key? key,required this.imageAvatar,required this.nameText,required this.emailText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      padding:const EdgeInsets.all(10.0),    
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                15.0) //                 <--- border radius here
                            ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 45.0,
                            backgroundImage:
                                NetworkImage(imageAvatar),
                            backgroundColor: Colors.transparent,
                          ),
                        const SizedBox(height: 10,),
                          Center(
                              child: Text(
                          nameText,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                          )),
                          Center(
                              child: Text(
                            emailText,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                          )),
                        ],
                      ));
    
  }
}
