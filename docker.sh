docker build . -t docker-stack.j.cinglevue.com/tech-radar:latest
docker push docker-stack.j.cinglevue.com/tech-radar:latest
docker pull docker-stack.j.cinglevue.com/tech-radar:latest
docker run -p 8080:80 docker-stack.j.cinglevue.com/tech-radar:latest
open http://localhost:8080