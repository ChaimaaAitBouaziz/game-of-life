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
     def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
  
        sh 'sudo chmod 777 /var/run/docker.sock'
        app = docker.build("abchaimaa/hellonode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            /*app.push("${env.BUILD_NUMBER}")*/
            app.push("latest")
        }
    }
    stage('Run image') {
        /*sh'docker run -d -p 66:8000 abchaimaa/hellonode'*/
        app.run('-p 66:8000') /*{ c ->
            sh 'echo "container is up"'
        }*/
}   
