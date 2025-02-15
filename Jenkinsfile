pipeline {

    tools {
        maven 'Maven 3.9.5'
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
                    sh 'docker image tag pipeline1.v1:$BUILD_ID neeraj91/pipeline1.v1:$BUILD_ID'
                    sh 'docker image tag pipeline1.v1:$BUILD_ID neeraj91/pipeline1.v1:latest'
                }
            }
        }
        stage('List Docker Images') {
    steps {
        sh 'docker images'
    }
}

       stage('Docker Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        
                        // Push the Docker image
                        sh "docker push neeraj91/pipeline1.v1:$BUILD_ID"
                        sh "docker push neeraj91/pipeline1.v1:latest"
                    }
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
