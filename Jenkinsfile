pipeline {
    agent any

    stages {
        stage("Build Docker Image") {
            steps {
                sh "./gradlew buildDockerImage"
            }
        }

        stage("Test Docker Image") {
            steps {
                sh "./gradlew testDockerImage"
            }
        }


        stage("Push Docker Image") {
            when { 
                branch 'master'
            }
            environment {
                DOCKER_HUB_CREDENTIALS = credentials('docker-hub')
            }
            steps {
                sh "./gradlew pushDockerImage -PDOCKER_USER=${DOCKER_HUB_CREDENTIALS_USR} -PDOCKER_PASSWORD=${DOCKER_HUB_CREDENTIALS_PSW}"
            }
        }
    }

    post {
        always {
            junit '**/build/goss/*.xml'
        }
    }
}