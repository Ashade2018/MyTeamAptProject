import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:league_app/src/data/app_assets.dart';
import 'package:league_app/src/data/app_colors.dart';
import 'package:league_app/src/data/app_strings.dart';
import 'package:league_app/src/ui/widgets/news_card_widget.dart';
import 'package:league_app/src/ui/widgets/tab_background_wrapper.dart';

class HomeScreen extends StatelessWidget {
  final _listOfNewsCards = List.generate(
    3,
    (_) => NewsCard(
        imageUrl: AppAssets.newsCardImageBackground,
        title: AppStrings.homeScreenNewsTitle),
  );

  @override
  Widget build(BuildContext context) {
    return TabBackgroundWrapper(
        title: AppStrings.appTitle,
        body: Column(children: <Widget>[
          _buildNewsTopRow(),
          ..._listOfNewsCards,
          _buildLeagueTableContainer()
        ]));
  }

  Widget _buildNewsTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          AppStrings.latestNews,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            AppStrings.showAll,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.accentColor,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLeagueTableContainer() {
    return Container(
        color: Colors.grey.shade800,
        child: AspectRatio(
          aspectRatio: 5 / 3,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.leagueTableTitle,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                DataTable(
                  dataRowHeight: 50.0,
                  headingRowHeight: 24,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        AppStrings.leagueTableTitlePos,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        AppStrings.leagueTableTitleClub,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        AppStrings.leagueTableTitleP,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        AppStrings.leagueTableTitleGD,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        AppStrings.leagueTableTitlePts,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text('1',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                      DataCell(_buildTableClubCell(
                          AppAssets.liverpoolClubIconImage,
                          AppStrings.liverpoolClub)),
                      DataCell(Text('82',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('82',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('82',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('2',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                      DataCell(_buildTableClubCell(
                          AppAssets.manCityClubIconImage,
                          AppStrings.manCityClub)),
                      DataCell(Text('57',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('57',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('57',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('3',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                      DataCell(_buildTableClubCell(
                          AppAssets.leicesterClubIconImage,
                          AppStrings.leicesterClub)),
                      DataCell(Text('53',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('53',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('53',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('4',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                      DataCell(_buildTableClubCell(
                          AppAssets.chelseaClubIconImage,
                          AppStrings.chelseaClub)),
                      DataCell(Text('48',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('48',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('48',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('5',
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                      DataCell(_buildTableClubCell(
                          AppAssets.manUtdClubIconImage,
                          AppStrings.manUtdClub)),
                      DataCell(Text('45',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('45',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                      DataCell(Text('45',
                          style: TextStyle(color: Colors.white, fontSize: 12))),
                    ])
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: _fullTableSection(
                        Icons.arrow_forward, AppStrings.fullTable))
              ],
            ),
          ),
        ));
  }

  Widget _buildTableClubCell(String imageUrl, String clubName) {
    return Row(
      children: <Widget>[
        Image.asset(imageUrl),
        SizedBox(
          width: 12.0,
        ),
        Text(
          clubName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }

  Widget _fullTableSection(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
        SizedBox(
          width: 11,
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        )
      ],
    );
  }
}
