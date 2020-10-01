pipeline {
  agent {
    node {
      label 'vps-master'
    }
  }

  triggers {
    pollSCM('*/2 * * * *')
  }

  stages {
    stage('Build docker image') {
      steps {
        sh "docker-compose build"
      }
    }

    stage('Stop service') {
      steps {
        sh 'docker-compose down'
      }
    }

    stage('Run service') {
      steps {
        sh 'docker-compose up -d'
      }
    }
  }
}
