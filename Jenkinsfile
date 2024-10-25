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
      }
      steps {
        script {
           sh 'scp /var/lib/jenkins/workspace/Test_multibranch_Antonio_master/target/test_spring_boot-0.0.1-SNAPSHOT.jar ubuntu@79.137.88.15:deploy/produzione/target/.'
        }
        git branch: "${github_branch}", url: 'https://github.com/manca-kitzanos/test_spring_boot.git'
        script {
          sh '/usr/share/maven/bin/mvn clean install -Dmaven.test.skip=true'
        }
        script {
          dockerImage = docker.build dockerimagename
        }
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push("latest")
          }
        }
      }
    }
  }
}