node{
  def mavenHome = tool name: 'maven3.8.6'
  stage('1cloneCode'){
    git "https://github.com/Omenoga/tesla-app-1.git"
}
 stage('2Test&Build'){
    sh "${mavenHome}/bin/mvn clean package"
    //bat "${mavenHome}/bin/mvn clean package"
  }
 stage('3codeQuality'){
    sh "${mavenHome}/bin/mvn sonar:sonar"
  }
   stage('4uploadArtifacts'){
    sh "${mavenHome}/bin/mvn deploy"
   }
    stage('5deploy2UAT'){
    sh "echo 'deploy to UAT'  "
    deploy adapters: [tomcat9(credentialsId: '240ca690-1956-41c3-b1fb-ad3ca5480f5b', path: '', url: 'http://172.31.31.231:8080/')], contextPath: null, war: 'target/*war'
    }
  stage('6approvalGate'){
    sh "echo 'ready for review' "
    timeout(time:5, unit:'DAYS') {
    input message: 'Application ready for deployment, Please review and approve'
      }
  }
  stage('7deploy2Prod'){
    deploy adapters: [tomcat9(credentialsId: '240ca690-1956-41c3-b1fb-ad3ca5480f5b', path: '', url: 'http://172.31.31.231:8080/')], contextPath: null, war: 'target/*war'
  }
   stage('8emailNotification'){
  emailext body: '''Updates,
Check build status

Dominion Systems.''', recipientProviders: [buildUser(), developers(), upstreamDevelopers(), brokenBuildSuspects()], subject: 'Build status', to: 'rm.a.ogor@gmail.com'
}
}
