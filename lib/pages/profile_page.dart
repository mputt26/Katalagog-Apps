import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_user.dart';
import 'package:menu_resto/pages/login_page.dart';
import 'package:menu_resto/style.dart';

class ProfilePage extends StatefulWidget {
  final String nama;
  ProfilePage({Key? key, required this.nama}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ApiUser apiUser = ApiUser();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final userData = await apiUser.fetchData();
      _namaController.text = userData['nama'] ?? '';
      _emailController.text = userData['email'] ?? '';
      _usernameController.text = userData['username'] ?? '';
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
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
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return accInfo();
                } else {
                  return FutureBuilder<Map<String, dynamic>>(
                    future: apiUser.fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final userData = snapshot.data?.cast<String, dynamic>();
                        return settings(userData);
                      }
                    },
                  );
                }
              },
              childCount: 2,
            ),
          ),
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
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWh98LAB7aS7ChXk0g3XiP_klmG9x7NOOw24Y4FskQIkU63eilJNV2JdQgOkeg_AIf3O4&usqp=CAU',
            ),
            radius: 45,
          ),
          const SizedBox(width: 20),
          Text(widget.nama, style: defaultB.copyWith(fontSize: 22)),
        ],
      ),
    );
  }

  Widget settings(Map<String, dynamic>? userData) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              TextFormField(
                initialValue: userData?['nama'] ?? '',
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                initialValue: userData?['email'] ?? '',
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                initialValue: userData?['username'] ?? '',
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        logOutButton()
      ],
    );
  }

  Widget logOutButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Log Out',
            style: defaultB.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
