import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praetorium/bloc/teams_list_bloc.dart';
import 'package:praetorium/config/locator_config.dart';
import 'package:praetorium/i18n/locale_bundle.dart';
import 'package:praetorium/i18n/localization.dart';
import 'package:praetorium/model/team.dart';
import 'package:praetorium/services/navigator_service.dart';
import 'package:praetorium/ui/pages/rooster_page.dart';
import 'package:praetorium/ui/widgets/bloc_widget.dart';

class TeamsListPage extends BlocWidget<TeamsListBloc> {
  final NavigatorService _navigatorService = locator.get<NavigatorService>();

  TeamsListPage({super.key}) : super(TeamsListBloc()..add(TeamsListEvent()));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamsListBloc, TeamsListState>(
      builder: (_, state) => Scaffold(
        body: state.teams != null
            ? ListView.builder(
                itemCount: state.teams?.length,
                itemBuilder: (context, index) => _buildListTile(context, state.teams![index]))
            : const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Team team) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final LocaleBundle localeBundle = Localization.of(context).bundle;

    return ListTile(
      leading: const CircleAvatar(
        radius: 16.0,
        backgroundColor: Colors.amber,
        child: SizedBox.shrink(),
      ),
      title: Text(
        team.teamName,
        style: textTheme.headline6,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        team.allegiance,
        style: textTheme.caption,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '150',
            style: textTheme.headline5,
          ),
          Text(
            localeBundle.pointsShortcut,
            style: textTheme.caption,
          ),
        ],
      ),
      onTap: () => _navigatorService.push((_) => const RoosterPage()),
    );
  }
}
