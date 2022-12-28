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
            slackSend (
                channel: "#jenkins-notification", 
                color: "good", 
                message: 
                "Message from Jenkins Pipeline  \
                *${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${env.GIT_COMMITTER_NAME} \
                \nMore info at: ${env.BUILD_URL}"
            )
                        
            // script {
            //     BUILD_USER = getBuildUser()
            // }
            // slackSend channel: '#jenkins-notification',
            // color: COLOR_MAP[currentBuild.currentResult],
            // message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${BUILD_USER} \
            // \nMore info at: ${env.BUILD_URL}"   
        }
        failure{
            echo "Building failed"
            slackSend (channel: "#jenkins-notification", color: "danger", message: "Message from Jenkins Pipeline")

        }
    }
}