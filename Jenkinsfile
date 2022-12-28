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
        success{
            echo "Building Success"
            slackSend (
                channel: "#jenkins-notification", 
                color: "good", 
                message: 
                "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}' \
                \n${env.BUILD_URL}"
            )
        }
        failure{
            echo "Building Failed"
            slackSend (
                channel: "#jenkins-notification", 
                color: "danger", 
                message: 
                "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}' \
                \n${env.BUILD_URL}"
            )
        }
    }
}