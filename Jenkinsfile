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
                    sh 'docker image tag pipeline1.v1:$BUILD_ID neeraj91/pipeline1.v1:$BUILD_ID'
                    sh 'docker image tag pipeline1.v1:$BUILD_ID neeraj91/pipeline1.v1:latest'
                }
            }
        }

       stage('Docker Push') {
    steps {
        script {
            withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                // Secure Docker login
                sh """
                    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                """
                
                // Push the Docker image with both tags
                sh 'docker push neeraj91/pipeline1.v1:$BUILD_ID'
                sh 'docker push neeraj91/pipeline1.v1:latest'
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
