# Create a Docker container and push it to dockerhub

If you haven't already, create an account on [https://hub.docker.com](Dockerhub).

~~~
docker login #logs you into docker hub
git clone https://github.com/colinsauze/5minute-docker-cloud-intro
docker build -t username/5min-cloud-docker .  #(replace username with your dockerhub username)
docker push username/5min-cloud-docker
~~~


## Test Locally

docker run --name webserver -d -p 8080:80 username/5min-cloud-docker

Visit http://localhost:8080


## Deploy on Google Cloud

(Google cloud has an option to deploy a container directly but it doesn't allow any network services like web servers running in that container to be accessed from the internet)


* Create a new VM in Google Cloud
* For this demo we won't need much processing power, choose f1-micro as the Machine type, especially if you don't want to spend much of your credit.
* Click "Change" on the Boot disk and choose "Container Optimized OS"
* Tick "Allow HTTP traffic" at the bottom of the page under Firewall
* Click create
* Once created SSH into the VM by clicking the SSH option in the Connect column of the VM list.

* In the SSH session run "docker pull username/5min-docker-cloud"
docker run --name webserver -d -p 80:80 username/5min-docker-cloud

* Note down the external IP addres in the VM instances list on the google cloud page.
* Enter http://<ip address> into your web browser
* You should see the same page that was shown in the local test

* If you want a more friendly name and own an internet domain already, create a new "A record" for this IP address using your internet domain registrar's control panel page.

* Don't forget to delete the instance when you are done with it.


## Deploy on Azure

Go to https://portal.azure.com/

Click on "Contaienrs" on the Azure Marketplace menu on the left hand side and then click on "Container Instances"

Choose a resource group

Enter a name for the container

Put the username/containername from Dockerhub in the "Image" box.

Change the amount of memory down to 0.5 GiB if you want to minimise your spending.

Click next, leave everything as default on the Networking page.
Click next, leave everytihng as default on the Advanced page.
Click next, leave everything as default on the Tags page.
Go to reivew and create page and click Create.

It will take a minute or so to deploy the container.

Once this is done, click "Go to resource"
This will report an IP address, on the right side of the second line of the main table of text. 
Visit this IP in your web browser.



### Things to remember

* Your VM will keep running (and using credit) until you delete it.
* This is running on the public internet. Every web crawler, bot, script kiddie, hacker etc will have access to it.
* The content your serving isn't encrypted in transit. If you want to encrypt it look at using LetsEncrypt, but you'll need a domain name first.





