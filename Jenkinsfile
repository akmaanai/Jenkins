pipeline {
    agent any
    stages {
        stage('Build image') {
  
         app = docker.build("0301199913579/web-aku-pipe")
      }

         stage('Test image') {
  

           app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
}
