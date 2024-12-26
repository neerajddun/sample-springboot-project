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

        stage('Docker Build') {
    steps {
        script {
            // Build and tag the Docker image
            sh 'docker build -t $JOB_NAME:v1.$BUILD_ID .'
            sh 'docker image tag $JOB_NAME:v1.$BUILD_ID neeraj91/$JOB_NAME:v1.$BUILD_ID'
            sh 'docker image tag $JOB_NAME:v1.$BUILD_ID neeraj91/$JOB_NAME:latest'
        }
    }
}


        stage('Docker Login and Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Use the credentials for Docker login
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'

                        // Push the Docker images
                        sh 'docker push neeraj91/$JOB_NAME:v1.$BUILD_ID'
                        sh 'docker push neeraj91/$JOB_NAME:latest'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Deploy"'
            }
        }
    }
}
