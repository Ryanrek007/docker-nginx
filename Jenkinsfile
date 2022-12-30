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
                BUILD_STATUS = currentBuild.currentResult
                echo "$BUILD_STATUS"
                echo "${BUILD_STATUS}"
                echo "currentBuild.currentResult"

				if ($BUILD_STATUS == 'SUCCESS') {
                    echo "Building Success"
                    slackSend (
                        channel: "#jenkins-notification", 
                        color: "good", 
                        message: 
                        "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}'\
                        \n${env.BUILD_URL}"
                    )
				} else if ($BUILD_STATUS == 'FAILURE') {
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
        // success{
        //     echo "Building Success"
        //     slackSend (
        //         channel: "#jenkins-notification", 
        //         color: "good", 
        //         message: 
        //         "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}'\
        //         \n${env.BUILD_URL}"
        //     )
        // }
        // failure{
        //     echo "Building Failed"
        //     slackSend (
        //         channel: "#jenkins-notification", 
        //         color: "danger", 
        //         message: 
        //         "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}'\
        //         \n${env.BUILD_URL}"
        //     )
        // }
    }
}
// def sendSlackNotifcation(){
//     if ( currentBuild.currentResult == "SUCCESS" ) {
//         buildSummary = "Job: ${env.JOB_NAME}\n Status: *SUCCESS*\n Build Report: ${env.BUILD_URL}CI-Build-HTML-Report"
//         slackSend color : "good", message: "${buildSummary}", channel: '#test-ci-alerts'
//     } else {
//         buildSummary = "Job: ${env.JOB_NAME}\n Status: *FAILURE*\n Error description: *${CI_ERROR}* \nBuild Report :${env.BUILD_URL}CI-Build-HTML-Report"
//         slackSend color : "danger", message: "${buildSummary}", channel: '#test-ci-alerts'
//     }
// }