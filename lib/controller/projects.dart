import 'package:deroli_mobile/models/project_modal.dart';
import 'package:flutter/material.dart';

class ProjectsController extends ChangeNotifier {
  // list of local variables

  late List<Project> _projects = [];
  late bool _getProjectsLoading = false;

  // getter
  List<Project> get getProjects => _projects;
  bool get getProjectsLoading => _getProjectsLoading;

  // setter
  void setProjects(List<Project> projects) {
    _projects = projects;
    notifyListeners();
  }

  void setGetProjectsLoading(bool loading) {
    _getProjectsLoading = loading;
    notifyListeners();
  }
}
