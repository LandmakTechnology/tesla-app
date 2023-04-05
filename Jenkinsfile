pipeline{
    agent any
    tools{
        maven 'maven3.9.0'
    }
    
    stages{
        
        stage ('Clone Git Repo'){
           steps{
              sh "echo 'Cloning Git Repo'"
              git 'https://github.com/Ohubabs/tesla-app.git'
            }
        }
        
        stage ('Build Webapp'){
            steps{
                sh "echo 'Clean Source Code and Build Webapp'"
                sh "mvn clean package"
            }
        }
        
        stage ('Quality Testing'){
            steps{
                sh "echo 'Clean Source Code and Build Webapp'"
                sh "mvn sonar:sonar"
            }
        }
        
        stage ('Transfer to Docker'){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'Docker', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ubuntu//', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'target/*war'), sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker build -t princebabs/tesla .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ubuntu', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
            }
        }
        
        //stage ('Deploy wfapp'){
            //steps{
                //sh "ansible-playbook princebabs-deploy.yml -i tesla-host"
        //}
        //}
    }
}
