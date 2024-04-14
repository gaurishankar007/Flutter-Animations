import 'package:flutter/material.dart';

import '../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: "Implicit Animations"),
                Tab(text: "Explicit Animations"),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  implicitAnimationListView(context),
                  explicitAnimationListView(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView implicitAnimationListView(BuildContext context) {
    return ListView.separated(
      itemCount: implicitAnimations.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        String path = implicitAnimations.keys.elementAt(index);
        String title = path.split("/").last;

        return ListTile(
          onTap: () => Navigator.pushNamed(context, path),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        );
      },
    );
  }

  ListView explicitAnimationListView(BuildContext context) {
    return ListView.separated(
      itemCount: explicitAnimations.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        String path = explicitAnimations.keys.elementAt(index);
        String title = path.split("/").last;

        return ListTile(
          onTap: () => Navigator.pushNamed(context, path),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        );
      },
    );
  }
}
