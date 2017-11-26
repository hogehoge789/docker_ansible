AnsibleのDockerFile  
  
docker build -t cent-ansible-img .  
docker run -d -it --network host --name cent-ansible cent-ansible-img /bin/bash  
docker exec -it cent-ansible /bin/bash