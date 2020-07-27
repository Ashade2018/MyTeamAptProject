import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/models/player.dart';
import 'package:league_app/src/services/players_service.dart';
import 'package:league_app/src/ui/pages/main/tabs/league/players/player_details_screen.dart';

class PlayersScreen extends StatefulWidget {
  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;
  List<Player> _playerList = [];

  @override
  void initState() {
    super.initState();
    _fetchPlayers();
  }

  void _fetchPlayers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Client client = Client();
      PlayersService playersService = PlayersService(client);
      _playerList = await playersService.getPlayer();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      final SnackBar snackBar = SnackBar(
          content: Text(
            'Could not get players.',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white);
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  void _navigateToPlayerDetailsScreen(BuildContext context, Player player) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlayerDetailsScreen(
                  player: player,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title:
              Text(AppStrings.players, style: TextStyle(color: Colors.white))),
      body: Stack(
        children: <Widget>[
          _isLoading
              ? Center(
                  child: _buildLoadingIndicator(),
                )
              : _playerList.isEmpty
                  ? Center(
                      child: Text('No players available',
                          style: TextStyle(color: Colors.white)),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      itemCount: _playerList.length,
                      itemBuilder: (context, index) {
                        Player player = _playerList.elementAt(index);

                        return Column(
                          children: <Widget>[
                            _buildPlayersListTile(player),
                            Divider(
                              color: Colors.white54,
                              height: 0.0,
                            ),
                          ],
                        );
                      },
                    ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );

  Widget _buildPlayersListTile(Player player) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        onTap: () => _navigateToPlayerDetailsScreen(context, player),
        contentPadding: EdgeInsets.only(left: 0, bottom: 0.0),
        leading: SizedBox(
          height: 50.0,
          width: 50.0,
          child: Image.network(player.imageUrl),
        ),
        title: Text(
          player.name,
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          player.nationality,
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
