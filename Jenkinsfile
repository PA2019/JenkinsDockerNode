node('centos'){
    def app

    stage('CLEANUP Containers') {
        /* Stop and delete all running
         * docker containers */
        sh '''
        if [[ `/usr/bin/docker ps -a -q | wc -l` -gt 0 ]]; 
            then
                /usr/bin/docker stop $(/usr/bin/docker ps -a -q);
                /usr/bin/docker rm $(/usr/bin/docker ps -a -q);
        else
            echo NO;
        fi
        
        if [[ `/usr/bin/docker images | grep -i "none" | wc -l` -gt 0 ]]; 
            then
             echo YES;
             /usr/bin/docker rmi $(/usr/bin/docker images -a | grep -i "none" | awk '{print $3}');
        else
            echo NO;
        fi
        '''
    }
    
    stage('CLONE repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('BUILD PHP-FPM-NGINX Container') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("4wd-php-fpm-nginx")
    }

    stage('TEST PHP-FPM-NGINX Container') { 
        
         sh '/usr/bin/docker run -d -p 8123:80 --name 4wd-php-fpm-nginx-BY-JENKINS 4wd-php-fpm-nginx'
        
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

         /* app.inside {
             sh 'echo "Tests passed for PA2019-JenkinsDockerNode"'  
         } 
        
         docker.image('pa-test').withRun('-p 8000:8000') {
         sh "cd back-end && bin/ci"     
       sh '/usr/bin/docker run -it -p 8000:8000 pa-test
        } */
      
    } 

}
