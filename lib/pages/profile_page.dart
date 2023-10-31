import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_user.dart';
import 'package:menu_resto/pages/login_page.dart';
import 'package:menu_resto/style.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  ProfilePage({Key? key, required this.name}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ApiUser apiUser = ApiUser();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = true;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 178, 158),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            expandedHeight: 100,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Profile'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              accInfo(),
              settings(),
            ]),
          )
        ],
      ),
    );
  }

  Widget accInfo() {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 96, 83, 63),
            radius: 45,
            child: Text(widget.name[0].toUpperCase(),
                style: defaultB.copyWith(fontSize: 50)),
          ),
          const SizedBox(width: 20),
          Text(widget.name, style: defaultB.copyWith(fontSize: 22))
        ],
      ),
    );
  }

  Widget settings() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 139, 125, 103),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                obscureText: true,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 139, 125, 103),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              listTileMaker(
                Icons.logout,
                'Log Out',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget listTileMaker(icon, title, {subtitle, route}) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: defaultB.copyWith(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black54),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: defaultB.copyWith(fontSize: 11, color: Colors.black38),
            )
          : null,
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Widget logOutButton() {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.red.shade800,
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.red.shade600,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Log Out',
                  style: defaultB.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 19))
            ],
          ),
        ),
      ),
    );
  }
}
