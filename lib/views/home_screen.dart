import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../core/appbar_home_search_all_add.dart';
import '../core/bottomnavigatorbar.dart';
import '../core/enums.dart';
import 'components/item_date_create_new_task.dart';
import 'components/item_task.dart';
import 'components/search_bar.dart';
import 'home/home_bloc.dart';
import 'home/home_event.dart';
import 'home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // context.read<HomeBloc>().add(LoadDataTask());
    _controller.text = "";
    context.read<HomeBloc>().add(FetchDataTaskOfDayEvent(
        date: DateFormat.yMMMd().format(DateTime.now())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarHomeSearchAllAddTask(
        canBack: false,
        title: 'Home',
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) => SearchBarComponent(
              index: 1,
              controller: _controller,
              onChange: () {},
              keySearch: _controller.text,
              placeholder: 'Search for Tasks, Events',
            ),),
            const ItemDateCreateNewTask(
              date: 'Today',
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              switch (state.postStatus) {
                case PostStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.failure:
                  return Text(state.message.toString());
                case PostStatus.success:
                  {
                    if (state.listTodayTasks.length == 0) {
                      return const Center(child: Text("No tasks available"));
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: state.listTodayTasks.length,
                            itemBuilder: (context, index) {
                              return ItemTask(
                                  task: state.listTodayTasks[index],);
                            }),
                      );
                    }
                  };
              }
            })
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigatorBarTodolist(
        initIndex: 0,
      ),
    );
  }
}
