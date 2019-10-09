node('centos'){
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("pa-test")
    }

     /* stage('Test image') { */
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        /*  app.inside { */
            /* sh 'echo "Tests passed for PA2019-JenkinsDockerNode"' */
            
            
       /*  } */
        steps {
             /* sh 'echo "Tests passed for PA2019-JenkinsDockerNode"' */
             /* sh "cd back-end && bin/ci" */       
            sh '/usr/bin/docker run -it -p 8000:8000 pa-test'
        }
    } 

}
