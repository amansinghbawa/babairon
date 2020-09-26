// This shows a simple example of how to archive the build output artifacts.
def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]
pipeline {
    agent {label 'master'}
    environment{
        IMAGE_TAG = 'dev'
    }
    stages {

        stage ("Pull code"){
            steps {
                checkout scm
                 sh "echo code pulled"
            }
        }

        stage ("install Requirements"){
            steps {
                dir('/home/ubuntu/') {
                    sh 'pip3 install -r requirements.txt'
                }
                sh "echo Installed Requirements"
            }
        }

        stage ("Deploy code"){
            steps {
                sh "echo code deployed"
                sh "gunicorn babarion:wsgi"
            }
        }
    }
}