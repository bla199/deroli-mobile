import 'package:deroli_mobile/models/project_modal.dart';
import 'package:flutter/material.dart';

class ProjectsController extends ChangeNotifier {
  // list of local variables

  late List<Project> _projects = [];
  late bool _getProjectsLoading = false;
  String? _selectedProjectId; // null means "All Projects"

  // getter
  List<Project> get getProjects => _projects;
  bool get getProjectsLoading => _getProjectsLoading;
  String? get selectedProjectId => _selectedProjectId;
  
  // Get selected project or null for "All Projects"
  Project? get selectedProject {
    if (_selectedProjectId == null) return null;
    try {
      return _projects.firstWhere(
        (project) => project.projectId == _selectedProjectId,
      );
    } catch (e) {
      return null;
    }
  }

  // setter
  void setProjects(List<Project> projects) {
    _projects = projects;
    notifyListeners();
  }

  void setGetProjectsLoading(bool loading) {
    _getProjectsLoading = loading;
    notifyListeners();
  }

  void setSelectedProject(String? projectId) {
    _selectedProjectId = projectId;
    notifyListeners();
  }
}
