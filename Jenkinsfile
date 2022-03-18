pipeline {
	agent any
	environment {
		//ECR_URI = "144273344769.dkr.ecr.ap-south-1.amazonaws.com/python-flask-docker-hello-world"
		//REPOSITORY_TAG ="${ECR_URI}:${BUILD_ID}"
		YOUR_DOCKERHUB_USERNAME = "hvny"
		REPOSITORY_NAME = "python-flask-docker-hello-world"
		SERVICE_NAME = "python-flask-docker-hello-world"
		REPOSITORY_TAG = "${YOUR_DOCKERHUB_USERNAME}/${REPOSITORY_NAME}-${SERVICE_NAME}:latest"
		//DOCKER_USER = "hvny"
		//DOCKER_PASSWORD = "7702305501@Dhub"
	
	
	}
	stages {
	  stage('Get Code') {
	    steps {
			echo "Build not required"
		   
	    }  
	  
	  }
	  stage('Build and Push Image') {
	    steps {
		  //sh 'docker login -u AWS -p $(aws ecr get-login-password --region ap-south-1) 144273344769.dkr.ecr.ap-south-1.amazonaws.com'
		  sh 'docker login -u "hvny" -p "7702305501@Dhub" docker.io'
		  sh 'docker image build -t ${REPOSITORY_TAG} .'
		  sh 'docker push ${REPOSITORY_TAG}'
	    }
	  }
	  stage('Depoly To Cluster') {
	    steps {
		  sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl --kubeconfig ${WORKSPACE}/jenkins-cluster-admin-config apply -f -'
		  //sh 'envsubst < ${WORKSPACE}/nginx-ingress.yaml | kubectl --kubeconfig ${WORKSPACE}/jenkins-cluster-admin-config apply -f -'
		   
	    }
	  }
	  
	}
}
