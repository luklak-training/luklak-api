pipeline {
    agent any
    stages {

     stage('Kiểm tra thay đổi trong thư mục') {
                steps {
                    script {
                        sh 'echo thanh-test'
                    }
                }
            }

        stage('Kiểm tra thay đổi trong thư mục') {
            steps {
                script {
                    // Kiểm tra sự thay đổi trong thư mục 'my-folder'
                    def changes = sh(
                        script: "git diff --name-only HEAD~1 HEAD | grep '^helm/' || true",
                        returnStdout: true
                    ).trim()

                    if (changes) {
                        echo "Có thay đổi trong thư mục 'my-folder':"
                        echo changes
                        currentBuild.description = "Thư mục 'my-folder' đã thay đổi"
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
