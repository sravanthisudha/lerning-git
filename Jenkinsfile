pipeline {
  environment {
    imagename = "sravanthi12anddockerhub/mynginxapp"
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
        
    }
}
