import 'package:flutter/material.dart';

// Data Models
class UserInfo {
  final String name;
  final String position;
  final String email;
  final String phone;
  final String address;
  final String aboutMe;
  final List<String> skills;
  final List<ProjectInfo> projects;
  final List<EducationInfo> education;

  UserInfo({
    required this.name,
    required this.position,
    required this.email,
    required this.phone,
    required this.address,
    required this.aboutMe,
    required this.skills,
    required this.projects,
    required this.education,
  });
}

class ProjectInfo {
  final String title;
  final String description;

  ProjectInfo({required this.title, required this.description});
}

class EducationInfo {
  final String degree;
  final String university;
  final String graduationYear;

  EducationInfo({
    required this.degree,
    required this.university,
    required this.graduationYear,
  });
}

void main() {
  UserInfo userInfo = UserInfo(
    name: "Suraj Godse",
    position: "Software Engineer",
    email: "sgodse@hawk.iit.edu",
    phone: "+1 (312) 536-0824",
    address: "3445 S Rhodes Ave, Chicago, 60616",
    aboutMe: "A Master's candidate in Computer Science with hands-on experience in software development, gained through a software engineering internship. Proven ability to enhance user engagement and optimize backend performance through innovative solutions.",
    skills: ["react","nextjs", "javascript", "nodejs", "C++","python", "flutter",  "android", "androidstudios", "vscode", "github"],
    projects: [
      ProjectInfo(
        title: "Expense Tracker",
        description: "Developed a feature-rich Expense Tracker with React and Firebase, optimizing data visualization and reducing expense entry time by 40%.",
      ),
      ProjectInfo(
        title: "Food Delivery Platform",
        description: "Developed, tested, and maintained a robust full-stack web application using React, Express.js, and MongoDB, ensuring seamless user authentication, secure token management, and advanced cart functionality.",
      ),
      ProjectInfo(
        title: "Inventory Management System: A Full-Stack Web Application",
        description: "Developed a comprehensive inventory management system using React for the frontend and Express.js with MySQL for the backend.",
      ),
      ProjectInfo(
        title: "Thought Canvas: Blog Platform",
        description: "Developed an interactive blog platform that empowers users to share their thoughts and ideas.",
      ),
      ProjectInfo(
        title: "MathMagician",
        description: "A simple number processing app showcasing the interaction between a React.js frontend and a Node.js backend server.",
      ),
    ],
    education: [
      EducationInfo(
        degree: "MS in Computer Science",
        university: "Illinois Institute of Technology",
        graduationYear: "Graduating in 2025",
      ),
      EducationInfo(
        degree: "Bachelor's in Computer Engineering",
        university: "Mumbai University",
        graduationYear: "Graduated in 2023",
      ),
      EducationInfo(
        degree: "Higher Secondary Education",
        university: "Mumbai University",
        graduationYear: "Completed in 2019",
      ),
    ],
  );

  runApp(ProfileViewer(userInfo: userInfo));
}

class ProfileViewer extends StatelessWidget {
  final UserInfo userInfo;

  ProfileViewer({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Information",
      home: InfoDisplay(userInfo: userInfo),
    );
  }
}

class InfoDisplay extends StatelessWidget {
  final UserInfo userInfo;

  InfoDisplay({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Information"),
        backgroundColor: Color.fromARGB(255, 198, 132, 92),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSection(userInfo: userInfo),
              SizedBox(height: 16.0),
              SelfIntro(aboutMe: userInfo.aboutMe),
              SizedBox(height: 16.0),
              SkillsSection(skills: userInfo.skills),
              SizedBox(height: 16.0),
              MyProjects(projects: userInfo.projects),
              SizedBox(height: 16.0),
              EduSection(education: userInfo.education),
            ],
          ),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final UserInfo userInfo;

  TopSection({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/Suraj_profile.jpg'),
        ),
        SizedBox(height: 16.0),
        Text(
          userInfo.name,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          userInfo.position,
          style: TextStyle(fontSize: 18.0, color: const Color.fromARGB(255, 12, 12, 12)),
        ),
        SizedBox(height: 16.0),
        InfoItem(icon: Icons.email, text: userInfo.email),
        InfoItem(icon: Icons.phone, text: userInfo.phone),
        InfoItem(icon: Icons.location_on, text: userInfo.address),
      ],
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(177, 45, 4, 126)),
      title: Text(text, style: TextStyle(color: const Color.fromARGB(255, 4, 126, 53))),
    );
  }
}

class SelfIntro extends StatelessWidget {
  final String aboutMe;

  SelfIntro({required this.aboutMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 4, 126, 53)),
          ),
          SizedBox(height: 8.0),
          Text(aboutMe, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final List<String> skills;

  SkillsSection({required this.skills});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Skills",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 4, 126, 53)),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 80.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return SkillIcon(imageAsset: 'assets/images/${skills[index]}.png');
              },
            ),
          )
        ],
      ),
    );
  }
}

class SkillIcon extends StatelessWidget {
  final String imageAsset;

  SkillIcon({required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Image.asset(imageAsset, height: 40.0),
      ),
    );
  }
}

class MyProjects extends StatelessWidget {
  final List<ProjectInfo> projects;

  MyProjects({required this.projects});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Projects",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 4, 126, 53)),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectsEntry(project: projects[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsEntry extends StatelessWidget {
  final ProjectInfo project;

  ProjectsEntry({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      margin: EdgeInsets.only(right: 16.0),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                project.title,
                style: TextStyle(fontSize: 16.0, color: const Color.fromARGB(255, 4, 126, 53)),
              ),
              SizedBox(height: 4.0),
              Container(
                height: 60.0,
                child: Text(
                  project.description,
                  style: TextStyle(fontSize: 14.0),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EduSection extends StatelessWidget {
  final List<EducationInfo> education;

  EduSection({required this.education});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Education",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 4, 126, 53)),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: education.length,
              itemBuilder: (context, index) {
                return EduEntry(educationInfo: education[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class EduEntry extends StatelessWidget {
  final EducationInfo educationInfo;

  EduEntry({required this.educationInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      margin: EdgeInsets.only(right: 16.0),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                educationInfo.degree,
                style: TextStyle(fontSize: 16.0, color: const Color.fromARGB(255, 4, 126, 53)),
              ),
              SizedBox(height: 8.0),
              Text(
                educationInfo.university,
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                educationInfo.graduationYear,
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}