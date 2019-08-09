FROM openjdk:8-alpine
ADD build/libs/BucketQuestions-0.5.war BucketQuestions.war
ENTRYPOINT ["java", "-Dgrails.env=prod","-jar","/BucketQuestions.war"]
