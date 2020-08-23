import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/services/table_service.dart';
import 'package:league_app/src/models/table.dart';

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  List<Standing> _tableStandingList = [];

  @override
  void initState() {
    super.initState();
    _fetchTable();
  }

  void _fetchTable() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Client client = Client();
      TableService tableService = TableService(client);
      _tableStandingList = await tableService.getTableStandingList();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      final SnackBar snackBar = SnackBar(
          content: Text(
            'Could not get table list',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white);
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorElevated16,
        title: Text(
          AppStrings.table,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: _isLoading
          ? Center(
              child: _buildLoadingIndicator(),
            )
          : _tableStandingList.isEmpty
              ? Center(
                  child: Text('Table unavailable',
                      style: TextStyle(color: Colors.white)),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    child: _buildLeagueTableContainer(context),
                  ),
                ),
    );
  }

  Widget _buildTableTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppStrings.leagueTableTitle,
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTableTopBar() {
    return Container(
      color: AppColors.backgroundColorElevated24,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  'Pos',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Expanded(child: SizedBox.shrink()),
            Expanded(
              flex: 5,
              child: Text(
                'Club',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: Text(
                'P',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: Text(
                'GD',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: Text(
                'Pts',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeagueTableItem(
      {@required int position,
      @required String imageAsset,
      @required String clubName,
      @required int played,
      @required int goalDifference,
      @required int points}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    position.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: CircleAvatar(
                  radius: 2.0,
                  backgroundColor: AppColors.backgroundColorElevated24,
                ),
              )),
              Expanded(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: Image.network(imageAsset)),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      clubName,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  played.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  goalDifference.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Text(
                  points.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.backgroundColorElevated24,
          thickness: 1.0,
          height: 0.0,
        )
      ],
    );
  }

  Widget _buildLeagueTableContainer(BuildContext context) {
    return Card(
        color: AppColors.backgroundColorElevated16,
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
          child: Column(
            children: <Widget>[
              _buildTableTitle(),
              SizedBox(height: 16.0),
              _buildTableTopBar(),
              Column(
                children: _tableStandingList
                    .map(
                      (standing) => _buildLeagueTableItem(
                        imageAsset: standing.logo,
                        played: standing.all.matchsPlayed,
                        goalDifference: standing.goalsDiff,
                        points: standing.points,
                        clubName: standing.teamName,
                        position: standing.rank,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ));
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
}
