pipeline{
    agent any
        parameters{
            choice(
                choices:['Plan','Apply','Destroy'],
                name:'Actions',
                description: 'Describes the Actions')
            booleanParam(
                defaultValue: false,
                description: 'ALL',
                name: 'Networking'
                )
            booleanParam(
                defaultValue: false,
                description: 'TEST',
                name: 'Compute')
            booleanParam(
                defaultValue: false,
                description: 'TEST',
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
                when {
                       expression{params.Networking == true
                       }
                }
                steps{
                    
                    sh"terraform ${params.Actions} -target=module.Netwoking"
                    
                }
            }
            stage('action21'){
                steps{
                    echo "${params.BOOL}"
                    
            }
        }
    }
}

