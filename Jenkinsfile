pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'SonarQubeServer'
        DOCKER_IMAGE = 'schooldashboard:latest'
    }

    stages {
        stage('Cloner projet GitHub') {
            steps {
                git branch: 'main', url: 'https://github.com/YoussefHaddad1/StudentDashboard.git'
            }
        }

        stage('Compiler et Builder avec Maven') {
            steps {
                dir('StudentDashboard') {
                    sh 'mvn clean install'
                }
            }
        }

        stage('Analyse SonarQube') {
            steps {
                dir('StudentDashboard') {
                    withSonarQubeEnv("${SONARQUBE_SERVER}") {
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }

        stage('Construire image Docker') {
            steps {
                dir('StudentDashboard') {
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }
    }
}
