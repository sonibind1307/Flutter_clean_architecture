import 'package:animation/bloc/add_user_screen.dart';
import 'package:animation/bloc/user_bloc.dart';
import 'package:animation/bloc/user_event.dart';
import 'package:animation/bloc/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'list_state.dart';

class UserScreenList extends StatelessWidget {
  const UserScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(UserRepository())..add(FetchUsers()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Text("Add"),
              onPressed: () {
                // print("soni");
                // context.read<UserBloc>().add(FetchUsers());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserPostScreen()),
                );
              },
            ),
            appBar: AppBar(title: Text('Users')),
            body: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: ListTile(
                        // leading: CircleAvatar(radius: 20, backgroundColor: Colors.white),
                        title: Container(height: 12, color: Colors.white),
                        subtitle: Container(
                          height: 10,
                          margin: EdgeInsets.only(top: 4),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                } else if (state is UserLoaded) {
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return Theme(
                            data: Theme.of(
                              context,
                            ).copyWith(dividerColor: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 4,
                                child: ExpansionTile(
                                  initiallyExpanded: false,
                                  tilePadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "May 28, 2025",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "₹169.75",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                      // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          _buildRow(
                                            "Particulars1",
                                            "Balance",
                                            "Daily Interest %",
                                            "Amount",
                                            isHeader: true,
                                          ),
                                          Divider(
                                            height: 1,
                                            color: Colors.black,
                                          ),
                                          _buildRow(
                                            "Ledger",
                                            "₹1,85,269",
                                            "0.04%",
                                            "₹75.23",
                                            balanceColor: Colors.green,
                                          ),
                                          _buildRow(
                                            "MTF Ledger",
                                            "₹-2,91,363",
                                            "18.25%",
                                            "₹62.45",
                                            balanceColor: Colors.red,
                                          ),
                                          _buildRow(
                                            "Margin Shortfall",
                                            "₹12,356",
                                            "14.60%",
                                            "₹32.07",
                                            balanceColor: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 12),
                                  ],
                                ),
                              ),
                            ),
                          );

                    },
                  );
                }
                return Container();
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(
    String title,
    String balance,
    String interest,
    String amount, {
    bool isHeader = false,
    Color? balanceColor,
  }) {
    final textStyle = TextStyle(
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      color: isHeader ? Colors.black : null,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 3, child: Text(title, style: textStyle)),
          Expanded(
            flex: 3,
            child: Text(
              balance,
              style: textStyle.copyWith(color: balanceColor),
            ),
          ),
          Expanded(flex: 2, child: Text(interest, style: textStyle)),
          Expanded(flex: 2, child: Text(amount, style: textStyle)),
        ],
      ),
    );
  }
}
