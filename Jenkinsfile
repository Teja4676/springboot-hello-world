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
        }
        stage('Docker Build') {
            steps {
                echo 'Docker image building'
                sh 'docker build -t teja4676/spring-boot-hello-world .'
            }
        }
        stage('Docker Image Push') {
            steps {
                echo 'Docker image push'
                sh 'docker push teja4676/spring-boot-hello-world'
            }
        }
        stage('Deploying the Docker Image') {
            steps {
                echo "Deploying on Dev - Ubuntu machine"
		            sshagent(['Ubuntuserver']) {
		     	          sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.93.102 docker run -d teja4676/spring-boot-hello-world "
                }
            }
	      }
    }
}
