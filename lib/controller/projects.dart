import 'package:deroli_mobile/models/project_modal.dart';
import 'package:flutter/material.dart';

class ProjectsController extends ChangeNotifier {
  // list of local variables

  late List<Project> _projects = [];
  late List<Vendor> _vendors = [];
  late bool _getProjectsLoading = false;
  String? _selectedProjectId; // null means "All Projects"

  // for requesting money
  late Project _selectedRequestingProject = Project();
  late Category _selectedCategory = Category();
  late Vendor _selectedVendor = Vendor();

  // getter
  List<Project> get getProjects => _projects;
  bool get getProjectsLoading => _getProjectsLoading;
  String? get selectedProjectId => _selectedProjectId;
  List<Vendor> get getVendors => _vendors;
  //
  Project get selectedRequestingProject => _selectedRequestingProject;
  Category get selectedCategory => _selectedCategory;
  Vendor get selectedVendor => _selectedVendor;

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

  // for requesting money
  void setSelectedRequestingProject(Project project) {
    _selectedRequestingProject = project;
    notifyListeners();
  }

  void setSelectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSelectedVendor(Vendor vendor) {
    _selectedVendor = vendor;
    notifyListeners();
  }

  void setVendors(List<Vendor> vendors) {
    _vendors = vendors;
    notifyListeners();
  }
}
