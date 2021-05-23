pipeline {
    environment {
        registry = 'dimakhomchenko/jenkins_test'
        registryCredential = 'dockerhub'
    }
    agent { dockerfile true }

    stages {
        stage('git'){
            steps {
                git 'https://github.com/DimaKhomchenko/boxfuse.git'
            }
        }

        stage('build webApp'){
            steps {
                sh 'mvn package'
            }
        }

        stage('build dockerImage'){
            steps {
                sh 'cp /home/user/deploy/Dockerfile .'
                script{
                    docker.build registry + ":$BUILD_NUMBER"
                }
                
            }
        }
    }
}