pipeline {
    agent any
    
    stages{

     stage('Checkout') {
         steps{
             checkout scm
         }
     }
     stage('Clean') {
         steps{
                 sh "mvn clean"
         }
     }
     stage('Packaging Dev') {
         when {
             branch 'develop'
         }
         steps{
             sh "mvn package -PbuildNumber=${currentBuild.number} -PgitCommit=${env.GIT_COMMIT[0..6]} "
             archiveArtifacts artifacts: 'gameoflife-web//target/*.war', fingerprint: true
         }
     }
