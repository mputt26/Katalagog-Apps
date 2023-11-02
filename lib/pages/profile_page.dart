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

// -------------------------- SHOW EDIT ------------------------------
  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveData();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveData() async {
    String nama = _namaController.text;
    String username = _usernameController.text;
    String email = _emailController.text;

    try {
      // memanggil fungsi update data ke mockapi
      await apiUser.updateData(nama, username, email);
      // Setelah berhasil disimpan, memperbarui controller
      setState(() {
        _namaController.text = nama;
        _usernameController.text = username;
        _emailController.text = email;
      });
      // Setelah berhasil disimpan
    } catch (error) {
      print('Error saving data: $error');
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
        editButton(),
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

  Widget editButton() {
    return GestureDetector(
      onTap: () {
        _showEditDialog();
      },
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Edit Profil',
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
