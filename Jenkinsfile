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
            stage('init'){

            }

            when {
                       expression{params.Networking == true}
            stage('action'){
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

