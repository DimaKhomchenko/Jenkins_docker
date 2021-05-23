pipeline {
    environment {
        registry = 'dimakhomchenko/jenkins_test'
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent { 
        dockerfile { args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock' }   
    }

    stages {
        stage('git'){
            steps {                git 'https://github.com/DimaKhomchenko/boxfuse.git'
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
                    dockerImage = docker.build registry + ":deploy"
                }
                
            }
        }
        stage('push image to dockerhub'){
            steps {
                script {
                    docker.withRegistry( '', registryCredential ){
                        dockerImage.push()
                    }
                }
            }
        }
        stage('run image on remote host'){
            steps {
                sh '''ssh dima@192.168.64.134 << EOF
                        docker run -d -p 8081:8080 dimakhomchenko/jenkins_test:deploy'''
            }
        }
    }
}