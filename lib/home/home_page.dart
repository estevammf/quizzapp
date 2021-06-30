import 'package:flutter/material.dart';
import 'package:quizapp/account/account_page.dart';
import 'package:quizapp/home/home_controller.dart';
import 'package:quizapp/home/home_state.dart';
import 'package:quizapp/home/widgets/home/home_widget.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserModel? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  int _index = 0;
  final List<Widget> _screens = [HomeWidget(), HomeWidget(), AccountPage()];

  _selectScreen(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return homeScaffold(context);
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }

  Scaffold homeScaffold(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: _selectScreen,
      items: [
        BottomNavigationBarItem( label: "",
          icon:  Icon(
              Icons.bar_chart,
              color: AppColors.buttonBlue,
              size: 40,
            )),
        BottomNavigationBarItem( label: "",
            icon: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.buttonBlue,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(
                Icons.home,
                color: AppColors.white,
              ),
          )),
        BottomNavigationBarItem( label: "",
            icon: Icon(
              Icons.account_circle,
              color: AppColors.buttonBlue,
              size: 40,
            )),
      ],
    );
  }
}
