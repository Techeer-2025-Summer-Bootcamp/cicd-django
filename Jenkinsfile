pipeline {
    agent any

    environment {
        repository = "teami2022/session-fastapi"
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub')
        IMAGE_TAG = "1.0.${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'docker ps'
                }
            }
        }
        // stage('Set Image Tag') {
        //     steps {
        //         script {
        //             IMAGE_TAG = "1.0.${BUILD_NUMBER}"
        //         }
        //     }
        // }
        stage('Build') {
            steps {
                echo 'Building...'
                docker build -t $repository:$IMAGE_TAG .
            }
        }
        stage('Login to Docker Hub') {
            steps {
                echo 'Logging in to Docker Hub...'
                docker login -u $DOCKER_HUB_CREDENTIALS_USR -p $DOCKER_HUB_CREDENTIALS_PSW
            }
        }
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing to Docker Hub...'
                docker push $repository:$IMAGE_TAG
            }
        }
        stage('Clean Up') {
            steps {
                echo 'Cleaning up...'
                docker system prune -f
                docker volume prune -f
            }
        }
    }
}