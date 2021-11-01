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
		stage ('Deploy to staging') {
                       steps {
                        withCredentials ([usernamePassword(credentialsId: 'devserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                        script {
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.dev_ip} \"docker pull 0301199913579/zhazh\""
                        try {
                            sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.dev_ip} \"docker stop zhazh\""
                            sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.dev_ip} \"docker rm zhazh\""
                        } catch (err) {
                            echo: 'caught error: $err'
                        }
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.dev_ip} \"docker run --name zhazh -p 8080:80 -d 0301199913579/zhazh\""
                    }
                  }
        	}  
             }
		stage ('Deploy to production') {
            steps {
                input 'Deploy to Production'
                milestone(1)
                withCredentials ([usernamePassword(credentialsId: 'webserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    script {
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.prod_ip} \"docker pull 0301199913579/zhazh\""
                        try {
                            sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.prod_ip} \"docker stop zhazh\""
                            sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.prod_ip} \"docker rm zhazh\""
                        } catch (err) {
                            echo: 'caught error: $err'
                        }
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@${env.prod_ip} \"docker run --name zhazh -p 8080:80 -d 0301199913579/zhazh\""
                    }
                }
            }
        }	
		
	}
	}
    }
