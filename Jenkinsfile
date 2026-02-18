pipeline {
    agent any
    
    parameters { choice(name: 'Environment', choices:['staging', 'preprod', 'prod'], description: 'Profile needs to be used while executing test') }
    
    stages {
        stage ('Clean WorkSpace Directory'){
            steps {
                bat 'echo Cleanup Stage'
                cleanWs notFailBuild: true
            }
        }
        stage ('Git Checkout'){
            steps {
                bat 'echo Git Checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/carlopolancos/KRT05-jobportal.git']])
            }
        }
        stage ('Restore Packages'){
            steps {
                bat 'echo Restore Package'
            }
        }
        stage ('Build'){
            steps {
                bat 'echo Build'
                bat 'mvn clean compile'
            }
        }
        stage ('Deploy'){
            steps {
                bat 'echo Deploying the application..'
            }
        }
        stage ('Run the Test'){
            steps {
                bat 'echo Test Execution Started'
                bat 'mvn -P %Environment% test'
                bat 'echo Test Execution Completed'
            }
        }
    }
    post {
      always {
        junit 'target/surefire-reports/*.xml'
        cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/karate-reports/', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
      }
    }

}