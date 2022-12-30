pipeline {
    agent {
       node {
            label "cicd"
       }
    }
    
    stages{
        stage("Testing-pipelines") {
            steps {
                echo "Testing pipelines"
                // script{
                    // for (int i = 0; i <5; i++){
                    //     echo "script ${i}"
                    //     sleep(2)
                    // }
                // }
            }           
        }
    
        stage("Testing scripting") {
            steps {
                echo "Testing pipelines"
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
