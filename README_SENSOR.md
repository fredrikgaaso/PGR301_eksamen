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
- Tagge strategi: Jeg valgte å bruke github.run_number som tag for Docker-containere fordi det gir en god oversikt over versions kontroll, det gir en tag på v0.0.(hvor mange ganger den workflower har kjørt) altså hver gang workflowen kjører kommer det en ny docker-image. 
<br> Samtidig pushet jeg også en "latest"-tag, slik at andre utviklere alltid vet hvilken versjon som er den nyeste.
- Container-image: fredrikgaaso/imagegenerator-75
- SQS URL: https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75
- Min mac kjører på arm64 så får å få runnet docker run må jeg spesifisere hvilken platform det skal runne på med: <br> docker run --platform linux/amd64 -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=yyy -e SQS_QUEUE_URL=<SQS_QUEUE_URL> _dockerhub_user/repo_ "me on top of a pyramid"
Oppgave 4:
- Kan endre på mailen på "variables.tf" for å se at det funker, kan også være lurt å endre threshold i "sqs.tf" til noe lavere for enklere testing.

Oppgave 5: <br>
I en serverless arkitektur som bruker FaaS som AWS Lambda og meldingskøer som SQS, skiller det seg fra mikrotjenestearkitektur ved å fokusere på små, selvstendige funksjoner og kun faktureres per bruk, i stedet for å ha en service kjørende hele tiden og konstant koste penger for bedriften. <br> 
Det kan være store fordeler når det kommer til kostnadskontroll, der det passer seg, og ved skalerbarhet, spesielt ved systemer som har uforutsigbare belastninger.

En serverless arkitektur krever høyere grad av overvåkning og logging siden applikasjonen består av mange små komponenter. Dette kan føre til mer innviklet feilsøking. <br> 
I forhold til mikrotjenester, som vanligvis består av større, mer selvstendige komponenter, blir det enklere å observere hver tjeneste siden det overvåkes som én enhet i stedet for mange små. <br>
Kostnadskontroll og skalerbarhet krever mer tanke bak det; man må allokere ressurser basert på hvor mye trafikk man forventer. Dette kan ofte føre til overbetaling eller underbetaling hvis man beregner feil. Skalerbarheten i en mikrotjenestearkitektur krever mer manuell konfigurasjon, mens en serverless arkitektur skalerer automatisk opp eller ned basert på etterspørsel.

Når det gjelder CI/CD, gir serverless større fleksibilitet ved å kunne utvikle og teste funksjoner uten at det påvirker andre deler av systemet. På den andre siden gir det større antallet komponenter mer kompleksitet rundt pipeline-administrasjon, siden hver av disse funksjonene krever sin egen pipeline, samt håndtering av versjonskontroll for hver enkelt funksjon. <br>
Mikrotjenester derimot, som er større og færre, gir enklere pipelines, men krever hele utrullinger for små endringer. Dette kan redusere hastigheten på kontinuerlig distribusjon (CD).

I forhold til eierskap og ansvar vil teamet ha mindre kontroll over selve infrastrukturen i en serverless arkitektur og kan heller fokusere mer på kode og forretningslogikk enn infrastrukturen. <br>
I en mikrotjenestearkitektur har teamet større kontroll over infrastrukturen, noe som kan være en fordel for optimalisering og sikkerhetskrav. Dette er et double edged sword, siden teamet også må håndtere sikkerhetsoppdateringer og generell vedlikehold av infrastrukturen, noe som ikke kreves like mye i en serverless arkitektur da infrastrukturen blir håndtert av skyleverandøren.

