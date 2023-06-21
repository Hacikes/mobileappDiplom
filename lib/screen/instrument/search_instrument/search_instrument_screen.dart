import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/search_instrument/result_search_list.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key? key,
    required this.toggleView,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails,
  }) : super(key: key);

  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String query = '';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () async {
        final result = await showSearch(
          context: context,
          delegate: CustomSearchDelegate(
            toggleView: widget.toggleView,
            AccountIdForDetails: widget.AccountIdForDetails,
            AccountNameForDetails: widget.AccountNameForDetails,
            BrokerNameForDetails: widget.BrokerNameForDetails,
            initialQuery: query,
          ),
        );

        if (result != null) {
          setState(() {
            query = result;
          });
        }
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final Function toggleView;
  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;
  final String initialQuery;

  CustomSearchDelegate({
    required this.toggleView,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails,
    required this.initialQuery,
  }) : super(searchFieldLabel: 'Название', keyboardType: TextInputType.text);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsClass.getBackgroundForAppbar(),
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.black54,
      textTheme: theme.textTheme.copyWith(
        headline6: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ResultSearchList(
      toggleView: toggleView,
      SearchRequest: query,
      AccountIdForDetails: AccountIdForDetails,
      AccountNameForDetails: AccountNameForDetails,
      BrokerNameForDetails: BrokerNameForDetails,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: ColorsClass.getBackgroundForSrceen(),
      ),
      child: Container(),
    );
  }
}
