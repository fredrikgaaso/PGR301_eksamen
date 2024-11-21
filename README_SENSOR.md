# Eksamen README

## Oppgave 1

- **A)** HTTP-endepunkt: Image Generator API: https://fm5ds1cg1h.execute-api.eu-west-1.amazonaws.com/Prod/generate-image

  For å generere et bilde, bruk følgende POST body:  
  `{ "prompt": "Prompt for image generator here" }`

- **B)** GitHub workflow: GitHub Actions Run: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11822299007

## Oppgave 2

- **Lenke til main branch workflow:** Main Branch Workflow: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11878937718
- **Lenke til lambda branch workflow:** Lambda Branch Workflow: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11879037325/job/33100444545
- **Lenke til SQS kø:** SQS Lambda Queue: https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75

## Oppgave 3

- **Tagge strategi:**
  Jeg valgte å bruke `github.run_number` som tag for Docker-containere fordi det gir god oversikt over versjonskontroll. Dette gir en tag på `v0.0.(antall ganger workflowen har kjørt)`, altså hver gang workflowen kjører opprettes en ny Docker-image.

  Samtidig pushet jeg også en `latest`-tag, slik at andre utviklere alltid vet hvilken versjon som er den nyeste.

- **Container-image:** `fredrikgaaso/imagegenerator-75`

- **SQS URL:** Lambda SQS Queue URL: https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75

- **Docker Run Kommando:**
  Siden min Mac kjører på `arm64`-arkitektur må jeg spesifisere plattform når jeg kjører Docker-containeren:
  ```sh
  docker run --platform linux/amd64 -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=yyy -e SQS_QUEUE_URL=<SQS_QUEUE_URL> _dockerhub_user/repo_ "me on top of a pyramid"
  ```

## Oppgave 4

- For testing kan du endre på `email` i `variables.tf` for å se at det fungerer, eller justere `threshold` i `sqs.tf` til en lavere verdi for enklere testing.

## Oppgave 5: Sammenligning av Serverless og Mikrotjenestearkitektur

I en serverless-arkitektur som bruker FaaS som AWS Lambda og meldingskøer som SQS, skiller det seg fra en mikrotjenestearkitektur ved å fokusere på små, selvstendige funksjoner som faktureres per bruk, i stedet for å ha en service kjørende kontinuerlig som koster penger. Dette gir store fordeler for kostnadskontroll der det passer seg, og ved skalerbarhet, spesielt ved uforutsigbare belastninger.

En serverless-arkitektur krever en høyere grad av overvåkning og logging siden applikasjonen består av mange små komponenter, noe som kan gjøre feilsøking mer komplekst. Mikrotjenester består derimot av større, mer selvstendige komponenter, noe som gjør overvåkningen enklere ettersom man kun overvåker én tjeneste om gangen i stedet for mange små.

Når det gjelder skalerbarhet og kostnadskontroll, krever mikrotjenester at ressurser allokeres basert på forventet trafikk, noe som kan føre til feilberegning og over- eller underbetaling. En serverless-arkitektur skalerer derimot automatisk etter etterspørsel.

I CI/CD gir serverless større fleksibilitet siden man kan utvikle og teste funksjoner isolert uten å påvirke resten av systemet. Den store mengden små komponenter kan imidlertid gi økt kompleksitet for pipeline-administrasjon. Mikrotjenester, som er større og færre, gir enklere pipelines, men krever hele utrullinger ved små endringer, noe som kan redusere hastigheten på kontinuerlig distribusjon.

Når det gjelder eierskap og ansvar, har teamet mindre kontroll over infrastrukturen i en serverless-arkitektur, men kan fokusere mer på kode og forretningslogikk. I en mikrotjenestearkitektur har teamet større kontroll over infrastrukturen, noe som kan være både en fordel og en ulempe, da teamet også må håndtere sikkerhetsoppdateringer og vedlikehold, noe som i mindre grad kreves i en serverless-arkitektur da skyleverandøren håndterer infrastrukturen.


| Oppgave | Beskrivelse                                                                                                                                                                                                                                                                                                                                                           |
|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Oppgave 1 | Implementasjon av HTTP-endepunkt for bildegenerering og GitHub workflow-lenke. HTTP-endepunkt: https://fm5ds1cg1h.execute-api.eu-west-1.amazonaws.com/Prod/generate-image, GitHub Actions Run: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11822299007.                                                                                               |
| Oppgave 2 | Lenker til workflows for hoved- og lambda-brancher samt SQS-kø. Main Branch Workflow: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11878937718, Lambda Branch Workflow: https://github.com/fredrikgaaso/PGR301_eksamen/actions/runs/11879037325/job/33100444545, SQS Lambda Queue: https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75. |
| Oppgave 3 | Tagge strategi for Docker-containere, container-image informasjon og Docker run kommando. Container-image: fredrikgaaso/imagegenerator-75 SQS lenke: https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75.                                                                                                                                            |
| Oppgave 4 | Testing ved å justere variabler i Terraform-filer.                                                                                                                                                                                                                                                                                                                    |
| Oppgave 5 | Sammenligning av serverless- og mikrotjenestearkitekturer.                                                                                                                                                                                                                                                                                                            |
