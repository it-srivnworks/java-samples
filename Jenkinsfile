pipeline {
    
    agent any

    enviroment {
        dockerHome = tool 'mydocker'
        mavenHome = tool 'mymaven'
        PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
    }

    stages{
        stage('Build'){
            steps{
                sh 'mvn --version'
                sh 'docker version'
                echo "Build"
                echo "PATH - $PATH"
            }
        }
    }
}