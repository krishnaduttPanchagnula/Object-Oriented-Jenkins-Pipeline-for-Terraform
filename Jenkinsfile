pipeline{
    agent any
    environment {
                    AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
                    AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
                    AWS_DEFAULT_REGION = credentials('AWS_DEFAULT_REGION')
                }
        parameters{
            choice(
                choices:['plan','apply','destroy'],
                name:'Actions',
                description: 'Describes the Actions')
            booleanParam(
                defaultValue: false,
                description: 'network',
                name: 'Networking'
                )
            booleanParam(
                defaultValue: false,
                description: 'compute',
                name: 'Compute')
            booleanParam(
                defaultValue: false,
                description: 'Notify',
                name: 'Notification')
        }
        
        stages{

            stage('build'){
                steps{
            checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/krishnaduttPanchagnula/Multifunctional-terraform-Jenkins-pipeline']]])
                }
            }
            stage('init'){
                steps{
                    sh"terraform init"
                }
            }

            stage('action'){

                stages{
                    stage('Networking'){
                         when {
                       expression{params.Networking == true
                       }
                }
                steps{
                    
                    sh"terraform ${params.Actions} -target=module.Netwoking"
                    
                    }

                }
                stage('Compute'){
                         when {
                       expression{params.Compute == true
                       }
                }
                steps{
                    
                    sh"terraform ${params.Actions} -target=module.Compute"
                    
                    }

                }
                stage('Notification'){
                         when {
                       expression{params.Notification == true
                       }
                }
                steps{
                    
                    sh"terraform ${params.Actions} -target=module.Notification"
                    
                    }

                  }              
              }
               
            }
            stage('Terraform Completed'){
                steps{
                    echo "Terraform Done..!"
                    
            }
        }
    }
}

