node{
    stage("git clone"){
       git 'https://github.com/akhilesh9014/project_2.git'
    }
    stage("mave build"){
        
      def mavenHOME = tool name: "Maven3.6.3", type: "maven"
      def mavenCMD = "${mavenHOME}/bin/mvn "
      sh "${mavenCMD} clean package"
    }
    stage("build image"){
        sh "docker build -t akhilesh9014/jenkinsbuild:v1 ."
    }
    stage("push image in dockerhub"){
        withCredentials([string(credentialsId: 'DOCKER_CRED', variable: 'DOCKER_CRED')]) {
            sh "docker login -u akhilesh9014 -p ${DOCKER_CRED}"
        }
          sh "docker push akhilesh9014/jenkinsbuild"
    }
    stage("deploy app in kubernetes cluster"){
        kubernetesDeploy(
            configs: "Deployment.yml", kubeconfigId: "KUBERNETES_CONFIG", enableConfigSubstitution: true       
        )
    }
} 
