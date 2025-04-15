pipeline {
    agent any
    
    environment {
        SONAR_SCANNER_HOME = tool 'SonarScanner'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/roger9090/jenkins-project.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('MySonar') {
                    sh "${tool 'SonarScanner'}/bin/sonar-scanner -Dsonar.projectKey=dev-1 -Dsonar.sources=src -Dsonar.java.binaries=target"
                }
            }
        }

        stage('Docker Build') {
            steps {
                 script {
            withDockerRegistry(credentialsId: 'dockerhub-credentials') {
                sh '''
                    cd /var/lib/jenkins/workspace/jenkins-project
                    docker build -t jenkins-project:latest -f Dockerfile .
                   '''
                sh "docker tag jenkins-project:latest roger44/jenkins-project:latest"
             }
            }
          }
        }
          stage('Docker Push') {
            steps {
               script{
                   withDockerRegistry(credentialsId: 'dockerhub-credentials') {
                    sh "docker push  roger44/jenkins-project:latest "
                 }
               }
            }
        }
        stage ('Deploying Docker Container') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub-credentials') {
                        sh "docker run -d --name jenkins-project -p 8081:8080 roger44/jenkins-project"
                    }
                }
            }
        }
    }
}
