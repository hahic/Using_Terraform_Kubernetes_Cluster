# Using_Terraform_Kubernetes_Cluster

Github Action, Terraform Cloud, AWS EKS을 이용하여 Kubernetes Cluster 구축  

<img src="https://github.com/hashicorp/learn-terraform-provision-eks-cluster/assets/31979193/b6f33904-f39a-4b47-b6ec-cdf027669abf" width="90%" height="90%">

## 사전 준비
- [Terraform 설치](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [AWS CLI 설치 및 자격 증명](https://docs.aws.amazon.com/ko_kr/singlesignon/latest/userguide/howtogetcredentials.html)
- [Terraform Cloud 로컬 인증](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-login)
- [Terraform Cloud - API 기반 워크플로우 생성](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions#set-up-terraform-cloud)
- Terraform Cloud 토큰 생성    
( Terrform Cloud > User Profil > User Setting > Tokens > 'Create an API token' )

## 실행 방법
> [hashicorp/learn-terraform-provision-eks-cluster](https://github.com/hashicorp/learn-terraform-provision-eks-cluster) 기반으로 작성

### 1. Repository 설정
Github Secrets에 생성한 Terraform Cloud 토큰 값 저장   
참고 자료: https://docs.github.com/ko/actions/security-guides/encrypted-secrets

### 2. 코드 수정   
'Terraform Cloud - API 기반 워크플로우 생성' 시 설정한 조직 이름과 워크플로우 이름으로 수정   
(해당 파일 위치: scripts/terraform.tf)
<img src="https://github.com/hashicorp/learn-terraform-provision-eks-cluster/assets/31979193/decfcbe1-7e4b-4cc0-8898-72712bdc30f8" width="90%" height="90%">
<img src="https://github.com/hashicorp/learn-terraform-provision-eks-cluster/assets/31979193/5883a0ce-73ae-4f88-b4f4-bef9261dd8ef" width="90%" height="90%">

### 3. main branch에 코드 커밋

### 4. kubernetes cluster 엑세스 자격 증명 구성   
(생성 완료된 후) Terraform Cloud에서 region, cluster_name 값 확인 가능
```
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)
```
```
kubectl get pods --all-namespaces
```

<img src="https://github.com/hashicorp/learn-terraform-provision-eks-cluster/assets/31979193/b158c5b3-2218-4e24-b742-550d3c2119cd" width="90%" height="90%">
<img src="https://github.com/hahic/Kubernetes_Cluster/assets/31979193/08a6be2d-1e2d-4e44-8efa-61f334e770df" width="90%" height="90%">

## 참고 자료
- [Terraform - AWS DOCUMENTATION](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks#optional-configure-terraform-kubernetes-provider
- https://developer.hashicorp.com/terraform/tutorials/automation/github-actions
- https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-destroy
