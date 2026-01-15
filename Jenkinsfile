// pipeline {
//     agent any
//
//     environment {
//         // Replace with your Docker Hub username and image name
//         DOCKERHUB_CREDENTIALS = credentials('docker-hub-creds')
//         REPO_NAME = 'learn1988/Spring-Boot-Jenkins-Docker-Intg'
//     }
//
//     stages {
//         stage('Clone Source Code') {
//             steps {
//                 // Adjust this to clone your application's source code
//                 git 'https://github.com/umi1988/Spring-Boot-Jenkins-Docker-Intg.git'
//             }
//         }
//
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     // Build the image using the Dockerfile in the current directory
//                     // The t flag is for tagging the image locally
//                     sh "docker build -t ${REPO_NAME}:latest ."
//                 }
//             }
//         }
//
//         stage('Login to Docker Hub') {
//             steps {
//                 script {
//                     sh "docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}"
//                 }
//             }
//         }
//
//         stage('Publish Image') {
//             steps {
//                 script {
//                     // Push the 'latest' tag to Docker Hub
//                     sh "docker push ${REPO_NAME}:latest"
//                 }
//             }
//         }
//
//         stage('Cleanup') {
//             steps {
//                 script {
//                     // Optional: remove local images after pushing to save space
//                     sh "docker logout"
//                     sh "docker rmi ${REPO_NAME}:latest"
//                 }
//             }
//         }
//     }
// }



pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'learn1988/Spring-Boot-Jenkins-Docker-Intg'
    }
    stages
    {
        stage('Clone Source Code') {
                steps {
                     // Adjust this to clone your application's source code
                     git 'https://github.com/umi1988/Spring-Boot-Jenkins-Docker-Intg.git'
                 }
        }

        stage('Build Image') {
            steps {
                script {
                    // Builds image from Dockerfile in root directory
                    app = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Uses the Credential ID created in Step 2
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-creds') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}
