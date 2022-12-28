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
            }
            
        }
    }

    post{
        success{
            echo "Building success"
        }

        failure{
            echo "Building failed"
        }
    }

    
}