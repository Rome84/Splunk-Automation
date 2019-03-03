Splunk:
******************************************************

---
Steps to perfrom:
1) Clone the repo
2) cd splunk-terraform
3) ssh-keygen -f mykey
	<------ HIT ENTER
4) cd splunk-playbook/roles/splunk/files/
5) wget -O splunk-7.2.4-8a94541dcfac-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.4&product=splunk&filename=splunk-7.2.4-8a94541dcfac-Linux-x86_64.tgz&wget=true'
6) cd -
7) Manually create your own S3 bucket and update backend.tf
8) terraform init
9) terrafrom plan
10) terrafrom apply
---
