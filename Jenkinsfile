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
		stage('Docker Build')
		{
			steps
			{
			sh 'docker build -t mrnithinthomas/projectx:${BUILD_NUMBER} .'
			}
		}
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
		stage('Check Port Avaliability and Launch Container')
		{
			steps
			{
				script 
				{
                    			try 
                    			{
                        		sh 'echo lsof -i :${Host_Port}'
                        		sh 'echo Port ${Host_Port} is available'
					sh 'docker run -d -p ${Host_Port}:8080 --name projectx_${BUILD_NUMBER} mrnithinthomas/projectx:${BUILD_NUMBER}'
                    			} 
                    			catch (Exception e) 
                    			{
                        		sh 'echo Port ${Host_Port} is not available'
					error "Port ${Host_Port} is not available. Terminating the pipeline."
					}
                		}
				
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
                           		def podName = 'projectx-pod'  // Replace with your pod name
                    
                    		// Check if the pod exists
                    			def podExists = sh(returnStdout: true, script: "kubectl get pod ${podName} --ignore-not-found=true").trim()
                    
                    			if (podExists) 
						{
                        	// Delete the pod if it exists and then create a new pod
                        			sh "kubectl delete pod ${podName}"
						//sh "kubectl apply -f manifest.yaml"
                       				sh "kubectl apply -f projectx-pod.yaml"
						sh "kubectl apply -f projectx-service.yaml"
					
                    				} 
					else 
						{
                       		// Create a new pod if it doesn't exist
                        			 // Replace with your pod creation command
						//sh "kubectl apply -f manifest.yml"
						sh "kubectl apply -f projectx-pod.yaml"
						sh "kubectl apply -f projectx-service.yaml"	
					
                    				}
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
