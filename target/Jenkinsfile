pipeline {

    tools {

        maven 'Maven 3.9.4'
        jdk 'jdk 17'
    }

    agent any 

    stages {

        stage ('Checkout') {
            steps {
                  git 'https://github.com/neerajddun/sample-springboot-project.git'
            }
        }
        stage ('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage ('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('Deploy') {
            steps {
                sh 'echo "Deploy"'
            }
        }
    }
}