import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> allUsers = [];
  List<dynamic> filteredUsers = [];
  final TextEditingController searchController = TextEditingController();

  void initState() {
    super.initState();
    fetchUsers();
    searchController.addListener(onSearchTextChanged);
  }

  Future<void> fetchUsers() async {
    final uri = Uri.parse('https://ifpaserver.org:4443/usuarios');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        allUsers = data;
        filteredUsers = data;
      });
    } else {
      // Erro ao buscar os dados
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao carregar usuários')));
    }
  }

  void onSearchTextChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredUsers = allUsers
          .where((user) =>(user['nome'] ?? '').toString().toLowerCase().contains(query),
          ).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Buscar por nome',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.green.shade900,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 41,
                      children: filteredUsers.map((user) {
                        return InfoCard(
                          title: user['nome'] ?? 'Sem nome',
                          subTitle:
                              user['matricula']?.toString() ?? 'Sem matrícula',
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 350,
      color: Color(0xffe3f5f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          CircleAvatar(
            radius: 136,
            backgroundColor: Colors.green.shade100,
            child: const CircleAvatar(
              radius: 128,
              backgroundImage: AssetImage('assets/images/homem.webp'),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Thaís Oliveira',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.green.shade900,
            ),
          ),
          const Divider(),
          InfoButton(selected: true, onTap: () {}),
          InfoButton(selected: false, onTap: () {}),
          InfoButton(selected: false, onTap: () {}),
        ],
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final bool selected;
  final VoidCallback? onTap;
  const InfoButton({super.key, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: selected ? Colors.green.shade200 : null,
        height: 68,
        child: Row(
          children: [
            if (selected)
              Container(
                height: double.maxFinite,
                width: 6,
                color: Colors.green.shade800,
              )
            else
              const SizedBox(width: 6),
            const SizedBox(width: 16),
            const Text('Menu', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const InfoCard({super.key, this.subTitle = '', this.title = ''});

  @override
Widget build(BuildContext context) {
  return SizedBox(
    width: 260,
    height: 200,
    child: Card(
      color: Colors.white,
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xffe3f5f5),
            minRadius: 32,
            child: Icon(
              Icons.person_outline,
              size: 32,
              color: Color(0xff479f9b),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            subTitle,
            style: const TextStyle(color: Colors.black54),
            textAlign: TextAlign.center,
            // overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
} }