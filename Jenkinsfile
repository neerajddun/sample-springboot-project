pipeline {

    tools {
        maven 'Maven 3.9.4'
        jdk 'jdk 17'
    }

    agent any 

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/neerajddun/sample-springboot-project.git'
            }
        }

        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Integrated Test') {
            steps {
                sh 'mvn verify'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Docker-Build') {
    steps {
        script {
            // Run docker build with correct context and variable substitution
              sh 'docker build -t pipeline1.v1:$BUILD_ID .'
        }
    }
}
        
        stage('Deploy') {
            steps {
                sh 'echo "Deploy"'
            }
        }
        stage('Debug Directory') {
    steps {
        sh 'pwd'
        sh 'ls -l'
    }
}
    }
}
