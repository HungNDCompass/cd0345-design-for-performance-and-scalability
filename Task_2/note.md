## Increased Cost Estimate
- I increase the number of running-instance, choose stronger instance type EC2
- Backup retention, database capacity are also increased
- The Cost for Application Load Balancer, Network Load Balancer, Amazon CloudFront, Network Address Translation (NAT) Gateway depend on network traffic capacity so it remains just like in initial_cost_estimate.
- I also add AWS WAF to protect the application from attacks.


## Reduced_Cost_Estimate
- Initally, EC2 and RDS cost about 80% of the total cost so to reduce expenditure, I decided to decrease EC2 and RDS capacity and the number of EC2 instance. 
- I also removed AWS WAF to cut off about 150$ per month.