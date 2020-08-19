import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/models/team.dart';
import 'package:league_app/src/services/teams_service.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/teams/team_details_screen.dart';
import 'package:http/http.dart';

class TeamsScreen extends StatefulWidget {
  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;
  List<Team> _teamList = [];

  void _navigateToTeamDetailsScreen({BuildContext context, @required Team team}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TeamDetailScreen(team: team,)));
  }

  @override
  void initState() {
    super.initState();
    _fetchTeams();
  }

  void _fetchTeams() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Client client = Client();
      TeamsService teamsService = TeamsService(client);
      _teamList = await teamsService.getTeams();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      final SnackBar snackBar = SnackBar(
          content: Text(
            'Could not get teams.',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white);
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.teams,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.backgroundColorElevated16,
      ),
      body: Stack(
        children: <Widget>[
          _isLoading
              ? Center(
                  child: _buildLoadingIndicator(),
                )
              : _teamList.isEmpty
                  ? Center(
                      child: Text('No teams available',
                          style: TextStyle(color: Colors.white)),
                    )
                  : ListView.builder(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                      itemCount: _teamList.length,
                      itemBuilder: (context, index) {
                        return _buildTeamListTile(context, index: index);
                      }),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );

  Widget _buildTeamListTile(BuildContext context, {@required int index}) {
    Team team = _teamList[index];

    return Column(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: ListTile(
            onTap: () => _navigateToTeamDetailsScreen(context: context, team: team),
            contentPadding: EdgeInsets.only(left: 0),
            leading: SizedBox(
              height: 30.0,
              width: 30.0,
              child: Image.network(
                team.imageUrl,
              ),
            ),
            title: Text(
              team.name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.white54,
        ),
      ],
    );
  }
}
