import 'package:cadastro/components/user_tile.dart';

import 'package:cadastro/provider/users.dart';
import 'package:cadastro/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Lista User'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:users.count ,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}