
import groovy.json.JsonOutput

def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]

def getBuildUser() {
    return currentBuild.rawBuild.getCause(Cause.UserIdCause).getUserId()
}

pipeline {
    agent {
       node {
            label "cicd"
       }
    }
    environment {
        BUILD_USER = ''
    }
    
    stages{
        stage("Testing-pipelines") {
            steps {
                echo "Testing pipelines"
            }
            
        }
    }

    post{
        always{
            echo "Building success"
            script {
                BUILD_USER = getBuildUser()
            }
            slackSend channel: '#jenkins-notification',
            color: COLOR_MAP[currentBuild.currentResult],
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${BUILD_USER} \
            \nMore info at: ${env.BUILD_URL}"   
        }
    }
}