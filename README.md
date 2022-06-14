### Lets containerize the application

#### Dockerfile

First of all, we need to create a file named `Dockerfile` in the project root directory. It is an extension less file which contain text based scripts. It is mainly used to build or create a container image.

![Dockerfile](https://www-goglides-dev.s3.amazonaws.com/uploads/articles/2qfvu64c7x74conmdn5g.png)

Lets build our first container image with command:

```
~ docker build -t react-app .
```

Then we will see in our terminal that the scripts are executed one by one.

```bash
Sending build context to Docker daemon  1.622MB
Step 1/7 : FROM node:16-alpine
 ---> 97c7a05048e1
Step 2/7 : WORKDIR /app
 ---> Running in 2832d158ca49
Removing intermediate container 2832d158ca49
 ---> 33ade59f6284
Step 3/7 : ENV PATH = "/app/node_modules/.bin:$PATH"
 ---> Running in e5e7e9045da0
Removing intermediate container e5e7e9045da0
 ---> eb050a83b5f5
Step 4/7 : COPY . .
 ---> 135c29f9e54d
Step 5/7 : RUN npm install
 ---> Running in 557411353bd1
npm WARN deprecated svgo@1.3.2: This SVGO version is no longer supported. Upgrade to v2.x.x.
npm WARN deprecated source-map-resolve@0.6.0: See https://github.com/lydell/source-map-resolve#deprecated

added 1418 packages, and audited 1419 packages in 41s

190 packages are looking for funding
  run `npm fund` for details

6 high severity vulnerabilities

Removing intermediate container 557411353bd1
 ---> 00c1f9fa2dbb
Step 6/7 : RUN npm run build
 ---> Running in c1defd1c15b8

> containerizing-react@0.1.0 build
> react-scripts build

Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  46.37 kB  build/static/js/main.226971af.js
  1.79 kB   build/static/js/787.af11c2dd.chunk.js
  541 B     build/static/css/main.073c9b0a.css

The project was built assuming it is hosted at /.
You can control this with the homepage field in your package.json.

The build folder is ready to be deployed.
You may serve it with a static server:

  npm install -g serve
  serve -s build

Find out more about deployment here:

  https://cra.link/deployment

Removing intermediate container c1defd1c15b8
 ---> 616ac7e40e6a
Step 7/7 : CMD ["npm","start"]
 ---> Running in 7f2dd4af9523
Removing intermediate container 7f2dd4af9523
 ---> f8a7e190bb57
Successfully built f8a7e190bb57
Successfully tagged react-app:latest

```

So container image named `react-app` is created successfully. Now we can check the docker images in our system with command:

```bash
docker images
```

![Docker Images](https://www-goglides-dev.s3.amazonaws.com/uploads/articles/joyaphbss88a2wdg0o57.png)

Now we can run container with command:

```bash
~ docker run react-app
```

```bash
> containerizing-react@0.1.0 start
> react-scripts start

Starting the development server...

Compiled successfully!

You can now view containerizing-react in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://172.17.0.2:3000

Note that the development build is not optimized.
To create a production build, use npm run build.

webpack compiled successfully
```

Development server is starting in two host i.e in Local and in Network. Lets open the above link in browser.
Lets open in the network: `http://172.17.0.2:3000`
![Newtork Server](https://www-goglides-dev.s3.amazonaws.com/uploads/articles/zpwvnkatyrs11zq7ies1.png)

Lets open in the local server: `http://localhost:3000`
![Local Server](https://www-goglides-dev.s3.amazonaws.com/uploads/articles/eynhlrhyu7i5v3doam1v.png)

We are getting issue with local server because react uses port: 3000 and we haven't expose port in the container so we have to expose or map port across the container to our machine.

```
~ docker run -p 3000:3000 react-app
```

Lets check again the local server in browser
![Local Server Running](https://www-goglides-dev.s3.amazonaws.com/uploads/articles/b9mboe7gbgxt3dk6mtme.png)
:tada: Finally our containerized react application in running successfully in port 3000 in both network and local server.

Now we can check the process that handle all the activities to run the react application in docker container.

```bash
~ docker ps
```

![Process list](https://www-goglides-dev.s3.amazonaws.com/uploads/articles/62tb20xfe4872a5aue3e.png)
Finally we have successfully containerized the react application with docker.
