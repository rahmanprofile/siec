import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siec/controller/data/todo_bloc.dart';
import 'package:siec/view/local_page.dart';
import 'dart:math' as math;
import '../controller/searching/searching_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchText = "";
  final searchController = TextEditingController();
  final TodoBloc _todoBloc = TodoBloc();
  int currentPage = 1;
  int perItemsPage = 50;

  @override
  void initState() {
    _todoBloc.add(FetchTodo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocListener<SearchingBloc, SearchingState>(
              bloc: context.read<SearchingBloc>(),
              listener: (context, state) {
                if (state is SearchingFoundState) {
                  searchText = state.searchValue;
                  setState(() {});
                }
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  onChanged: (value) => context.read<SearchingBloc>().add(SearchTextEvent(searchText: value)),
                  controller: searchController,
                  style: GoogleFonts.inter(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search here',
                    prefixIcon: const Icon(CupertinoIcons.search),
                    hintStyle: GoogleFonts.inter(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<TodoBloc, TodoState>(
              bloc: _todoBloc,
              builder: (context, state) {
                if (state is TodoInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodoError) {
                  return Center(child: Text(state.message));
                } else if (state is TodoException) {
                  return Center(child: Text(state.message));
                } else if (state is FetchTodoData) {
                  if (state.todoModel.isEmpty) {
                    return const Center(child: Text("List is empty"));
                  }

                  final filterItems = state.todoModel.where((element) {
                    return element.title.toLowerCase().contains(searchText.toLowerCase());
                  }).toList();

                  if (filterItems.isEmpty) {
                    return const Center(child: Text("No records found"));
                  }

                  final startIndex = (currentPage - 1) * perItemsPage;
                  final endIndex = math.min(currentPage * perItemsPage, filterItems.length);
                  final paginatedItems = filterItems.sublist(startIndex, endIndex);



                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: paginatedItems.length + 1,
                      itemBuilder: (context, index) {
                        if (index == paginatedItems.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (currentPage > 1)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentPage--;
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.blue,
                                      ),
                                      child: const Center(child: Text('Previous Page',style: TextStyle(color: Colors.white))),
                                    ),
                                  ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPage++;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue,
                                    ),
                                    child: const Center(child: Text('Next Page',style: TextStyle(color: Colors.white))),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        final data = paginatedItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Material(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey[200],
                                      ),
                                      child: const Center(child: Icon(CupertinoIcons.doc_plaintext)),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          (data.completed)
                                              ? const Text("Complete", style: TextStyle(fontSize: 11, color: Colors.black54))
                                              : const Text("Incomplete", style: TextStyle(fontSize: 11, color: Colors.black54)),
                                          Text(data.title[0].toUpperCase() + data.title.substring(1), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)  => const LocalPage())),
        child: const Icon(CupertinoIcons.add, color: Colors.white),
      ),
    );
  }
}
