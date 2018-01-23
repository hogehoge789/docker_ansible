AnsibleのDockerFile  
  
docker build -t cent-ansible-img .  
docker run --rm --network host -v %CD%:/usr/ansible/ -w /usr/ansible/ cent-ansible-img  
docker run --rm --network host --name cent-ansible cent-ansible-img 
