pipeline {
  // Declaring environment variables for docker credentials.
  environment{
    registry = "vidushi0808/chatbot"
    registryCredential = 'docker-hub'
    dockerImage = ''
  }
  agent any
  stages {
  stage ('Development'){
    when{
       branch 'feature'
      }
      echo "Development Stage"
    }
    stages{
     stage('Building Image')
       steps{
         script{
           echo "Building Docker image"
           dockerImage = docker.build registry + ":$BUILD_NUMBER" 
          }
          }
     stage('Push Docker Image'){
       steps{
         script{
          echo "Pushing Docker image"
          docker.withRegistry( '',registryCredential ){
          dockerImage.push()
          sh 'docker rmi $registry:$BUILD_NUMBER'
          }
        } 
      }
     }
   }
    stages ("Deployment Stage"){
    stage('Deploying to kubernetes') {
      when {
       anyOf { branch 'master'; branch 'feature' }
      }
     }
    }
  
post {
     always {
         echo "Completed"
             }
     success {
         echo "Successful completion!"
         cleanWs()
             }
      failure{
          echo "Failed!"
          mail to: "vidushi.bansal@knoldus.com",
          subject: "Unsuccessful Completion of ${env.JOB_NAME}",
          body: "${env.JOB_NAME} has failed. Refer to: ${env.BUILD_URL}"

      }
   }
}
