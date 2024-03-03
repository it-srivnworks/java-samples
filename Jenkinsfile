pipeline {
    
    agent any

    environment {
        dockerHome = tool 'mydocker'
        mavenHome = tool 'mymaven'
        PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
    }

    stages{
        stage('checkout'){
            steps{
                sh 'mvn --version'
                sh 'docker version'
                echo "Build"
				echo "PATH - $PATH"
				echo "BUILD_NUMBER - $env.BUILD_NUMBER"
				echo "BUILD_ID - $env.BUILD_ID"
				echo "JOB_NAME - $env.JOB_NAME"
				echo "BUILD_TAG - $env.BUILD_TAG"
				echo "BUILD_URL - $env.BUILD_URL"
            }
        }

        stage('Compile') {
			steps {
				sh "mvn clean compile"
			}
		}

        stage('Package') {
			steps {
				sh "mvn package -DskipTests"
			}
		}
        
        stage('Build Docker Image') {
			steps {
				script {
					dockerImage = docker.build("devops01srivnworks/java-samples:${env.BUILD_TAG}")
				}

			}
		}

        stage('Push Docker Image') {
			steps {
				script {
					docker.withRegistry('', 'devops01docker') {
						dockerImage.push();
						dockerImage.push('latest');
					}
				}
			}
		}

    }
}