echo "Upgrading awscli"
sudo pip install --upgrade awscli
echo "awscli version: "
echo $(aws --version)
echo "---------------------------"
echo "Installing kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo "kubectl version: "
echo $(kubectl version --client=true)
echo "---------------------------"
echo "Installing cdk"
npm install -g aws-cdk --force
echo "cdk version: "
echo $(cdk --version)
echo "---------------------------"
echo "Installing jq"
sudo yum -y install jq gettext bash-completion moreutils
echo "---------------------------"
echo "Installation Check"
which aws kubectl cdk jq
if [ $? -eq 0 ]; then
    echo "You successfully installed all the required tools to your workspace"
else
    echo "Failed to install tools."
fi