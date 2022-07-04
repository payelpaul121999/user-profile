import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userprofile/model/user_model.dart';
import 'package:userprofile/service/service_userlist.dart';
import 'package:userprofile/widget/custom_card.dart';

class UserProfileList extends StatefulWidget {
  const UserProfileList({Key? key}) : super(key: key);

  @override
  State<UserProfileList> createState() => _UserProfileListState();
}

class _UserProfileListState extends State<UserProfileList> {
  UserModel? user;
  @override
  void initState() {
    ServiceUserList.getAllUserList().then((userList) {
      setState(() {
        user = userList!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightC = MediaQuery.of(context).size.height;
    //double weightC = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 240, 240),
      // appBar: AppBar(
      //     centerTitle: true,
      //     backgroundColor: Colors.white,
      //     title: const Text(
      //       "User List",
      //       style: TextStyle(color: Colors.black),
      //     )),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Hello , User",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/1458/1458201.png"),
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.zero,
                  height: heightC * 0.3,
                  child: user != null
                      ? ListView.builder(
                          itemCount: user!.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            UserModel? model = user;
                            return CustomCard(
                              imageAvatar: model!.data[index].avatar,
                              emailText: model.data[index].email,
                              nameText:
                                  '${model.data[index].firstName} ${model.data[index].lastName}',
                            );
                          })
                      : ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: heightC * 0.25,
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        15.0) //                 <--- border radius here
                                    ),
                              ),
                              child: const CupertinoActivityIndicator(
                                color: Color.fromARGB(255, 18, 82, 192),
                                radius: 20,
                              ),
                            );
                          })),
            ),
          ],
        ),
      ),
    );
  }
}
