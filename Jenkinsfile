pipeline {
    agent any
    stages{
        stage('Git clone'){
            steps {
                git branch: 'main', url: 'https://github.com/gowtham4s/docker-nginx-app'
        }
        }
        stage('Build Image'){
        steps {
                sh 'docker build -t kritheshgow4/gowtham:docker .'
            }
        }
        stage('Login'){
        steps {
                withCredentials([string(credentialsId: 'docker_hub', variable: 'TOKEN')]) {
                    sh 'echo "$TOKEN" | docker login -u "kritheshgow4" --password-stdin'
                }
            }
        }
        stage('Push Image'){
        steps{
                sh 'docker push kritheshgow4/gowtham:docker'
            }
        }
        stage('Deploy'){
    steps {
        sh '''
            docker stop gowtham_app || true
            docker rm gowtham_app || true
            docker run -d -p 80:80 --name gowtham_app kritheshgow4/gowtham:docker
        '''
    }
}
    }
}
