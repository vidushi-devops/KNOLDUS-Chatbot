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
    steps{
      echo "Development Stage"
    }
    }
   
   stage("Docker"){
      when{
        branch 'master' 
          }
     stages{
       stage('Building Image')
       {
        steps{
          script{
            echo "Building Docker image"
            dockerImage = docker.build registry + ":$BUILD_NUMBER" 
          }
           }
          }
     stage('Push Docker Image'){
       steps{
         script{
          echo "Pushing Docker image"
          docker.withRegistry( '',registryCredential ){
          dockerImage.push()
          }
        } 
      }
     }
    stage ("Removing local image"){
      steps{
        sh 'docker rmi $registry:$BUILD_NUMBER'
      }
    }
    stage('Deploying to kubernetes') {
      when {
       anyOf { branch 'master'; branch 'feature' }
      }
      steps {
       echo "Deployment Stage"
        kubectl apply -f php-deployment.yaml
        kubectl apply -f mandatory.yaml
        kubectl apply -f cloud-generic.yaml
        kubectl apply -f ingress.yaml
        kubectl apply -f storageclass.yaml
        kubectl apply -f mysql-config-map.yaml
        kubectl apply -f mysql-service.yaml
        kubectl apply -f mysql-statefulset.yaml
      }
     }
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
