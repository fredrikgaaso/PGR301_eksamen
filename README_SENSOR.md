<strong>Explanation for Docker tag:<strong/><br/>
I chose to use the date as the tag for the Docker containers because it provides a good overview of when things are pushed. 
At the same time, a "latest" tag is also pushed so that other developers always know which version is the most recent.<br/>

<strong>Docker image and SQS que:<strong/><br/>
fredrikgaaso/imagegenerator-75 
https://sqs.eu-west-1.amazonaws.com/244530008913/terraform-75-SimpleQueue-ITrY5qV4c0gZ <br/>

<strong>Github workflow Docker push:<strong/><br/>
https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11857542929


Oppgave 1:
 - A) HTTP endepunkt: https://fm5ds1cg1h.execute-api.eu-west-1.amazonaws.com/Prod/generate-image
 - Paste {"prompt": "Prompt for image generator here"}
<br>
- B) GitHub workflow: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11822299007

Oppgave 2:
- Lenke til main branch workflow: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11878937718
- Lenke til lambda branch worklfow: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11879037325/job/33100444545
- Leke til sqs kø: https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75 

Oppgave 3:
- Tagge strategi: Jeg valgte å bruke dato som tag for Docker-containere fordi det gir en god oversikt over når ting blir pushet. Samtidig pushet jeg også en "latest"-tag, slik at andre utviklere alltid vet hvilken versjon som er den nyeste.
- Container-image: fredrikgaaso/imagegenerator-75
- SQS URL: https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75
- Min mac kjører på arm64 så får å få runnet docker run må jeg spesifisere hvilken platform det skal runne på med: docker run --platform linux/amd64 -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=yyy -e SQS_QUEUE_URL=<SQS_QUEUE_URL> _dockerhub_user/repo_ "me on top of a pyramid"

Oppgave 4:
- Kan endre på mailen på "variables.tf" for å se at det funker, kan også være lurt å endre threshold i "sqs.tf" til noe lavere for enklere testing.

Oppgave 5:
- Automatisering og kontinuerlig levering (CI/CD)
  - Styrker:
    1. 
  - Svakheter
    - E
- Observability (overvåkning)
  - Styrker:
    - e
  - Svakheter:
    - e
- Skalerbarhet og kostnadskontroll:
  - Styrker:
    - e
  - Svakheter:
    - e
- Eierskap og ansvar:
  - Styrker:
    - e
  - Svakheter:
    - e