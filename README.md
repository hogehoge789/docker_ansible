AnsibleのDockerFile  
  
docker build -t cent-ansible-img .  
docker run --rm --network host --name cent-ansible cent-ansible-img 
