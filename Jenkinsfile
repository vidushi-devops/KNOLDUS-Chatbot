pipeline {
  // Declaring environment variables for docker credentials.
  environment{
    registry = "vidushi0808/chatbot"
    registryCredential = 'docker-hub'
    dockerImage = ''
     PROJECT_ID = 'k8pro-292409'
     CLUSTER_NAME = 'cluster-1'
     LOCATION = 'us-central1-c'
     CREDENTIALS_ID = 'k8pro'
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
      // sh "kubectl apply -f php-deployment.yaml"
      // sh "kubectl apply -f mandatory.yaml"
     //  sh "kubectl apply -f cloud-generic.yaml"
     //  sh "kubectl apply -f ingress.yaml"
     //  sh "kubectl apply -f storageclass.yaml"
     //  sh "kubectl apply -f mysql-config-map.yaml"
     //  sh "kubectl apply -f mysql-service.yaml"
     //  sh "kubectl apply -f mysql-statefulset.yaml"
       step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'php-deployment.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
        step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'storageclass.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
        step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'mysql-config-map.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
        step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'storageclass.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
        step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'mysql-service.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
        step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'mysql-statefulset.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
       
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
