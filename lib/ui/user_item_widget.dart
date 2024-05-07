import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String imgUrl;
  final String email;

  const UserItem(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.imgUrl,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          color: const Color(0xFF3685F5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.network(
                  imgUrl,
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("First Name:"),
                        Text(firstName),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Last Name:"),
                        Text(lastName),
                      ],
                    ),
                    Text("Email: $email"),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
