pipeline {
    agent {
       node {
            label "cicd"
       }
    }
    environment{
        AUTHOR = "Ryan Firmansyah"
    }
    
    stages{
        stage("Testing-pipelines") {
            steps {
                echo "Testing pipelines"
                script{
                    sh "Nama Build: ${env.JOB_NAME} "
                    sh "Job Number: ${env.BUILD_NUMBER}"
                    sh "author: ${AUTHOR}"
                } 
            }           
        }
    
        stage("Testing scripting") {
            steps {
                echo "Testing scripting"
                script{
                    def data = [
                        "firstName" : "Muhammad",
                        "lastName" : "Ryan"
                    ]
                    writeJSON(file: "data.json", json: data)
                }
            }           
        }
    }
    post{
        always {
            echo "Publish Notification build on Slack"
            script {
				if (currentBuild.currentResult == 'SUCCESS') {
                    echo "Building Success"
                    slackSend (
                        channel: "#jenkins-notification", 
                        color: "good", 
                        message: 
                        "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}'\
                        \n${env.BUILD_URL}"
                    )
				} else if (currentBuild.currentResult == 'FAILURE') {
                    echo "Building Failed"
                    slackSend (
                        channel: "#jenkins-notification", 
                        color: "danger", 
                        message: 
                        "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}'\
                        \n${env.BUILD_URL}"
                    )
                }
            }
        }
    }
}
