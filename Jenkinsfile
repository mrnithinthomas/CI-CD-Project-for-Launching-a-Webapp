pipeline
{
agent any
	stages
	{
		stage('Git Clone')
		{
			steps
			{
            git branch: 'main', url: 'https://github.com/mrnithinthomas/CI-CD-Project-for-Launching-a-Webapp.git'
			}
		}
		stage('Maven Build')
		{
			steps
			{
			sh 'mvn clean package'
			}
		}
		//stage('Docker Build')
		//{
		//	steps
		//	{
		//	sh 'docker build -t mrnithinthomas/projectx:${BUILD_NUMBER} .'
		//	}
		//}
		stage('Docker Image Push')
		{
			steps
			{
				script
				{
                 			withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) 
					{
                   		sh 'docker login -u mrnithinthomas -p ${dockerhubpwd}'
					}
                   	sh 'docker push mrnithinthomas/projectx:${BUILD_NUMBER}'
				}
			}
		
		}
		stage('Pull Image and run from DockerHub')
		{
			steps
			{
				sh 'docker run -d -p ${Host_Port}:8080 --name projectx_${BUILD_NUMBER} mrnithinthomas/projectx:${BUILD_NUMBER}'
			}
		}
		stage('K8 Build')
		{
			steps
			{
				script
				{
                 		withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubesecretfile', namespace: '', serverUrl: '']])  
                 		{
                            sh 'kubectl apply -f manifest.yml'
                        }
				}
			}
		
		}
		stage('Link to Page')
		{
			steps
			{
			sh 'echo http://localhost:${Host_Port}/projectx/'
			}
		}
		
	}
}
