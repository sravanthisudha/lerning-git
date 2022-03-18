pipeline {
  environment {
    imagename = "wo7and/mynginxapp"
    registryCredential = 'wo7and-dockerhub'
    dockerImage = ''
    build_user = "wo7and"
    }
 
    agent any
    stages {
        stage('Git Clone') {
            steps {
                git([url: 'https://github.com/wo7and/lerning-git.git', branch: 'master', credentialsId: 'wo7and-github-user-token'])
            }
        }
        stage('Build Image') {
            steps {
               script {
                 dockerImage = docker.build("--build-arg username=${build_user}") imagename
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
