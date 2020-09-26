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
                dir('/home/aman/PycharmProjects/babairon') {
                    sh 'source venv/bin/activate'
                    sh 'pip3 install -r requirements.txt'
                }
                sh "echo Installed Requirements"
            }
        }

        stage ("Deploy code"){
            steps {
                sh "echo code deployed"
                 dir('/home/aman/PycharmProjects/babairon') {
                    sh 'python3 manage.py runserver'
                }
            }
        }
    }
}