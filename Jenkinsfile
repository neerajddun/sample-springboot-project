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

       // stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t $JOB_NAME:v1.$BUILD_ID .'
                    sh 'docker image tag $JOB_NAME:v1.$BUILD_ID neeraj91/$JOB_NAME:v1.$BUILD_ID'
                    sh 'docker image tag $JOB_NAME:v1.$BUILD_ID neeraj91/$JOB_NAME:latest'
                }
            }
        } //

        stage('Deploy') {
            steps {
                sh 'echo "Deploy"'
            }
        }
    }
}
