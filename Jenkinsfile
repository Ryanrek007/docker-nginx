pipeline {
    agent {
       node {
            label "cicd"
       }
    }
    environment{
        AUTHOR = "Ryan Firmansyah"
    }
    
    options{
        disableConcurrentBuilds()
        timeout (time: 5, unit: 'MINUTES')
    }

    triggers{
        pollSCM ("* * * * *")
    }
    
    stages{
        // //using Matrix
        // stage("Setup OS"){
        //     matrix{
        //         axes{
        //             axis{
        //                 name "OS"
        //                 values "linux", "windows"
        //             }
        //             axis{
        //                 name "ARC"
        //                 values "32", "64"
        //             }
        //         }
        //         //using stages to print result from matrix stages
        //         stages{
        //             stage("OS Setup"){
        //                 steps{
        //                     echo "Setup ${OS}:${ARC}"
        //                 }
        //             }
        //         }
        //     }
        // }

        //using pararel stage
        stage ("Preparation"){
            parallel{
                stage ("Prepare Test"){
                    steps{  
                        echo "Prepare test 1"
                        sleep (3)
                    }
                }
                stage ("Prepare Test2"){
                    steps{
                        echo "Prepate test 2"
                        sleep (3)

                    }
                }
            }
        }
        stage("Testing-pipelines") {
            steps {
                echo "Testing pipelines"
                echo "Nama Build: ${env.JOB_NAME}"
                echo "Job Number: ${env.BUILD_NUMBER}"
                echo "author: ${AUTHOR}"
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

        stage("Testing Environment") {
            environment{
                APP = credentials("testing_rahasia")
            }
            steps {
                echo "Merupakan contoh pengambilan dari Environment Jenkins username:password"
                echo "App User: ${APP_USR}"
                echo "App Password: ${APP_PSW}"
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
                        "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}' on branch ${env.BRANCH_NAME}\
                        \n${env.BUILD_URL}"
                    )
				} else if (currentBuild.currentResult == 'FAILURE') {
                    echo "Building Failed"
                    slackSend (
                        channel: "#jenkins-notification", 
                        color: "danger", 
                        message: 
                        "*${currentBuild.currentResult}:* Job #${env.BUILD_NUMBER} '${env.JOB_NAME}' on branch ${env.BRANCH_NAME}\
                        \n${env.BUILD_URL}"
                    )
                }
            }
        }
    }
}
