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

				
                stage('Login') {

                        steps {
                            sh 'docker login -p $DOCKERHUB_CREDENTIALS_PSW -u $DOCKERHUB_CREDENTIALS_USR'
                        }
                }

		stage('Push') {

			steps {
				sh 'docker push 0301199913579/zhazh:latest'
			}
		}
	}
}
