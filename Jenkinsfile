pipeline {
  agent any
  options {
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
  }
  stages {
    stage('Deploy') {
      when {
          branch 'master'
      }
      environment {
        github_branch = "master"
        dockerimagename = "devteambflows/test-antonio"
        dockerImage = ""
        registryCredential = 'dockerhublogin'
        datetime = sh(script: """ date +%d%b%Y%H%M """, returnStdout: true)
      }
      steps {
        script {
          sh "echo ${datetime}_test_spring_boot-0.0.1-SNAPSHOT.jar"
        }
      }
    }
  }
}