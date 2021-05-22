pipeline {
    agent { dockerfile true }

    stages {
        stage('git'){
            steps {
                git 'https://github.com/DimaKhomchenko/boxfuse.git'
            }
        }
        stage('build'){
            steps {
                sh 'mvn package'
            }
        }
    }
}