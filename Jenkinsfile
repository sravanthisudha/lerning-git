pipeline {
  environment {
    imagename = "sravanthi12/mynginxapp"
    registryCredential = 'sravanthi12anddockerhub'
    dockerImage = ''
    }
    agent any
    stages {
        stage('Git Clone') {
            steps {
                git([url: 'https://github.com/sravanthisudha/lerning-git.git', branch: 'master', credentialsId: 'sravanthisudha-github'])
            }
        }
        stage('Build Image') {
            steps {
               script {
                 dockerImage = docker.build imagename
               }
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                  docker.withRegistry( '', registryCredential ) {
                    dockerImage.push("$BUILD_NUMBER")
                  }
                }
            }
        }
        stage('Remove Unused docker image') {
            steps {
              sh "docker rmi $imagename:$BUILD_NUMBER"
             }
        }
    }
}
