#For Master-Slave Architecture, you need SSH Agent and SSH Publisher Plugins. Then configure their ssh server settings in Configure Systems.

#To configure Ansible and Docker Nodes, you need to go to Manage Clouds and Nodes to input the details of your servers.


#Use SSH Publisher syntax to transfer war files and Dockerfile to your Docker server. Then in exec command, input " docker build -t <imagename:version>" and docker push
but used the "variable"/withcredentials beforehand to setup docker credentials and then refer to the variable when inputting the exec command for better security. 
Fill out ssh publisher with the following credentials:
    
SSH Server
Name: Docker
Advanced > Transfers > Transfer Set

Source files= target/*war
Remove prefix
#Do not remove prefix unless you change Dockerfile to just copy /*war instead of target/*war
Remote directory: //home//ubuntu// # "//" is crucial or the file won't be copied into the right location/be found when executing your commands.
Exec command
?
All of the transfer fields (except for Exec timeout) support substitution of Jenkins environment variables
Advanced

Transfer Set
Source files: Dockerfile
Remove prefix
?
Remote directory: //home//ubuntu
Exec command: docker build -t princebabs/tesla .


pipeline{
    agent{
        label 'Ansible'
    }
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
        
        stage ('Transfer to Docker and Build Image'){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'Docker', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ubuntu//', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'target/*war'), sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker build -t princebabs/tesla .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//home//ubuntu', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
            }
        }
        
        stage ('Deploy wfapp'){
            steps{
                sh "ansible-playbook princebabs-deploy.yml -i tesla-host"
        }
        }
    }
}
