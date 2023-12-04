# App Building phase --------
FROM openjdk:11 AS build

RUN mkdir /appbuild
COPY . /appbuild

WORKDIR /appbuild
RUN bash gradlew clean build
# End App Building phase --------

# Container setup --------
FROM openjdk:11-jre-slim-buster

# Creating user
ENV APPLICATION_USER 1033
# RUN adduser --force-badname $APPLICATION_USER
RUN useradd $APPLICATION_USER

# Giving permissions
RUN mkdir /app
RUN mkdir /app/resources
RUN chown -R $APPLICATION_USER /app
RUN chmod -R 755 /app

# Setting user to use when running the image 
USER $APPLICATION_USER

# Copying needed files
COPY --from=build /appbuild/build/libs/*-all.jar /app/app.jar
COPY --from=build /appbuild/resources /app/resources
COPY scripts /app/scripts
WORKDIR /app

# Entrypoint definition
CMD ["sh", "scripts/start.sh"]
# End Container setup --------
