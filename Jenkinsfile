pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                echo 'code updated'
                git 'https://github.com/Teja4676/springboot-hello-world.git'
                
            }
        }
        stage('Build') {
            steps {
                echo 'Building'
                sh 'mvn package'
            }
	    post { 
        	always { 
          		junit 'target/surefire-reports/*.xml'   
        	}
    	   }
     }
        stage('Docker Build') {
            steps {
                echo 'Docker image building'
                sh 'docker build -t teja4676/spring-boot-hello-world:dev .'
            }
        }
        stage('Docker Image Push') {
            steps {
                echo 'Docker image push'
                sh 'docker push teja4676/spring-boot-hello-world:dev'
            }
        }
        stage('Deploying the Docker Image') {
		when {
			branch 'Dev'
		}
            steps {
                echo "Deploying on Ubuntu machine"
		        sshagent(['Ubuntuserver']) {
		     	sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.29.189 docker run -d teja4676/spring-boot-hello-world:dev "
                }
            }
	}
    }
}
