import 'package:flutter/material.dart';
import 'package:hg_task/model/user_information.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({super.key, required this.user});

  final UserInformation user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.nameSurname,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(user.email,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 5,
              ),
              Text(user.date.toDate().toString(),
                  style: Theme.of(context).textTheme.titleMedium!),
            ],
          ),
          Text(user.bio)
        ],
      ),
    );
  }
}
