# High Availability Project with Auto Scaling and External Load Balancer using Terraform

## Description:
This project aims to implement a high-availability infrastructure using Terraform, incorporating auto-scaling and an external load balancer to ensure resilience and scalability of the application. The infrastructure will be deployed on a cloud provider such as AWS or Azure.

## Features:

    Auto Scaling: The infrastructure will automatically scale based on predefined metrics such as CPU utilization or incoming traffic. This ensures that the application can handle varying workloads efficiently without manual intervention.

    External Load Balancer: An external load balancer will distribute incoming traffic across multiple instances to improve availability and performance. It ensures that no single instance becomes a bottleneck and provides fault tolerance by redirecting traffic in case of instance failure.

    High Availability: By leveraging auto-scaling and load balancing, the infrastructure ensures high availability of the application. Even if one instance fails, the load balancer redirects traffic to healthy instances, minimizing downtime and ensuring uninterrupted service.

## Components:

    Auto Scaling Group: Defines the group of instances that will scale based on predefined policies.
    Launch Configuration: Specifies the configuration of instances launched by the auto-scaling group.
    External Load Balancer: Distributes incoming traffic across instances in the auto-scaling group.
    Security Groups: Define the network access rules for instances and the load balancer.
