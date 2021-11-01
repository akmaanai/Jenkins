pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker_hub_login')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t 0301199913579/zhazh:latest .'
            }
        }

		stage('Push') {

			steps {
                withDockerRegistry([ credentialsId: "docker_hub_login", url: "" ]){
				sh 'docker push 0301199913579/zhazh:latest'
                }
			}
		}
		
    }
