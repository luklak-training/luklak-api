pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'
        DOCKER_IMAGE = 'luklak-api-app'
        VERSION = "${env.BUILD_NUMBER}"
        DOCKER_USERNAME = 'thanh5320'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Determine Version') {
        when { changeset "helm/*"}
            steps {
                script {
                    sh 'echo changed in helm'
                }
            }
        }
}
}
