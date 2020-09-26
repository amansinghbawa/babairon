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
                sh """
                   cd /home/aman/PycharmProjects/babairon
                   source venv/bin/activate
                   pip3 install -r requirements.txt
                   """
            }
        }

        stage ("Deploy code"){
            steps {
                sh """
                   cd /home/aman/PycharmProjects/babairon
                   source venv/bin/activate
                   python3 manage.py runserver
                   """
            }
        }
    }
}