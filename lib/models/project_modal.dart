export 'project_modal.dart';

class Project {
  final String projectId;
  final List<Payment> payments;
  final List<Category> categories;
  final List<ProjectTeam> projectTeam;
  final Client? client;

  Project({
    required this.projectId,
    required this.payments,
    required this.categories,
    required this.projectTeam,
    this.client,
  });

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'payments': payments.map((p) => p.toJson()).toList(),
      'categories': categories.map((c) => c.toJson()).toList(),
      'project_team': projectTeam.map((pt) => pt.toJson()).toList(),
      'client': client?.toJson(),
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['project_id']?.toString() ?? '',
      payments: (json['payments'] as List? ?? [])
          .map((p) => Payment.fromJson(p))
          .toList(),
      categories: (json['categories'] as List? ?? [])
          .map((c) => Category.fromJson(c))
          .toList(),
      projectTeam: (json['project_team'] as List? ?? [])
          .map((pt) => ProjectTeam.fromJson(pt))
          .toList(),
      client: json['client'] != null ? Client.fromJson(json['client']) : null,
    );
  }
}

class Payment {
  // Add payment fields when needed
  Payment();

  Map<String, dynamic> toJson() => {};

  factory Payment.fromJson(Map<String, dynamic> json) => Payment();
}

class Category {
  final String categoryId;
  final List<SubProject> subProjects;
  final String name;
  final String allocatedBudget;
  final String registered;
  final String balanceBudget;
  final String project;

  Category({
    required this.categoryId,
    required this.subProjects,
    required this.name,
    required this.allocatedBudget,
    required this.registered,
    required this.balanceBudget,
    required this.project,
  });

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'sub_projects': subProjects.map((sp) => sp.toJson()).toList(),
      'name': name,
      'allocated_budget': allocatedBudget,
      'registered': registered,
      'balance_budget': balanceBudget,
      'project': project,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id']?.toString() ?? '',
      subProjects: (json['sub_projects'] as List? ?? [])
          .map((sp) => SubProject.fromJson(sp))
          .toList(),
      name: json['name']?.toString() ?? '',
      allocatedBudget: json['allocated_budget']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
      balanceBudget: json['balance_budget']?.toString() ?? '',
      project: json['project']?.toString() ?? '',
    );
  }
}

class SubProject {
  // Add sub-project fields when needed
  SubProject();

  Map<String, dynamic> toJson() => {};

  factory SubProject.fromJson(Map<String, dynamic> json) => SubProject();
}

class ProjectTeam {
  final String projectTeamId;
  final String role;
  final String project;
  final String user;

  ProjectTeam({
    required this.projectTeamId,
    required this.role,
    required this.project,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'project_team_id': projectTeamId,
      'role': role,
      'project': project,
      'user': user,
    };
  }

  factory ProjectTeam.fromJson(Map<String, dynamic> json) {
    return ProjectTeam(
      projectTeamId: json['project_team_id']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      project: json['project']?.toString() ?? '',
      user: json['user']?.toString() ?? '',
    );
  }
}

class Client {
  final String clientId;

  Client({required this.clientId});

  Map<String, dynamic> toJson() {
    return {'client_id': clientId};
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(clientId: json['client_id']?.toString() ?? '');
  }
}
