pipeline {
    agent any
    stages {

     stage('Checkout') {
                 steps {
                     echo 'Checking out source code...'
                     checkout scm
                 }
             }

        stage('Kiểm tra thay đổi trong thư mục') {
            steps {
                script {
                    def changes = sh(
                        script: "git diff --name-only HEAD~1 HEAD | grep '^helm/'",
                        returnStdout: true
                    ).trim()

                    if (changes) {
                        echo "Có thay đổi trong thư mục 'my-folder':"
                        echo changes
                        currentBuild.description = "Thanh test"
                    } else {
                        echo "Không có thay đổi trong thư mục 'my-folder'."
                    }
                }
            }
        }

        stage('Hành động khi có thay đổi') {
            when {
                expression {
                    // Chỉ thực hiện stage này nếu có thay đổi
                    return currentBuild.description?.contains("Thư mục 'my-folder' đã thay đổi")
                }
            }
            steps {
                echo "Thực hiện hành động do thư mục 'my-folder' thay đổi."
                // Thực hiện các lệnh hoặc hành động mong muốn
            }
        }
    }
}
