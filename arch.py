from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import EC2, AutoScaling
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB, Route53
from diagrams.aws.storage import S3
from diagrams.aws.network import VPC
from diagrams.aws.network import CloudFront

# Cria o diagrama e salva como 'complex_aws_architecture.png'
with Diagram("Complex AWS Architecture", show=False, filename="complex_aws_architecture", outformat="png"):
    
    # Route 53 DNS Management
    dns = Route53("DNS")
    
    # CloudFront CDN
    cdn = CloudFront("CDN")

    with Cluster("VPC"):
        # Load Balancer
        lb = ELB("Load Balancer")

        # Auto Scaling Group com múltiplas EC2
        with Cluster("Auto Scaling Group"):
            web_servers = [EC2("Web Server 1"),
                           EC2("Web Server 2"),
                           EC2("Web Server 3")]
        
        # Banco de dados RDS
        db = RDS("Database")
        
        # S3 Bucket para arquivos estáticos
        storage = S3("S3 Bucket")
    
    # Conexões
    dns >> cdn >> lb
    lb >> web_servers
    web_servers >> db
    cdn >> storage
