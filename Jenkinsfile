node('centos'){
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build HTTP Server') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("pa-test")
    }

    stage('Cleanup Containers') {
        /* Stop and delete all running
         * docker containers */
        try {
            sh '/usr/bin/docker stop $(docker ps -a -q)'
            sh '/usr/bin/docker rm $(docker ps -a -q)'
             /* sh 'exit 1' */
        }
        catch (exc) {
            echo 'Something failed, I should sound the klaxons!'
            throw exc
        }
        
    }
    
    stage('Run HTTP Server') { 
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

         /* app.inside {
             sh 'echo "Tests passed for PA2019-JenkinsDockerNode"'  
         } 
        
         docker.image('pa-test').withRun('-p 8000:8000') {
            
        }*/
        
        sh '/usr/bin/docker run -d -p 8000:8000 pa-test'
        /* sh "cd back-end && bin/ci" */       
       /* sh '/usr/bin/docker run -it -p 8000:8000 pa-test' */
      
    } 

}
