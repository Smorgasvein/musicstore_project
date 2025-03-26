# musicstore_project

# Oliver Aldorsson
# YH24
# Music Store

Det här projektet är en databas för en musikbutik. Jag har skapat tabeller för album, artister och låtar.

Varför MySQL?
Jag har valt MySQL som databas eftersom det är en relationsdatabas som hanterar strukturerad data effektivt och erbjuder hög prestanda. MySQL följer SQL-standarden och har starkt stöd för transaktioner, vilket är viktigt i min databas där jag hanterar ordrar, kunder och produkter.

MySQL är ett av världens mest använda databassystem och erbjuder alla funktioner jag behöver, inklusive primära och främmande nycklar, indexering och transaktionshantering. Eftersom jag redan är bekant med MySQL gör det utvecklingen smidigare.

Varför inte NoSQL?
NoSQL-databaser som MongoDB hanterar ostrukturerad data med en flexibel datamodell, vilket gör dem bra för dynamiska system där datan ofta förändras. De använder inbäddade dokument istället för relationer och saknar stöd för SQL-frågor och JOINs.

I min databas, där jag har tydligt definierade relationer mellan kunder, ordrar och produkter, är MySQL mer lämpligt. MySQL säkerställer dataintegritet och konsekvens, medan NoSQL skulle kunna leda till duplicerad data och svårare hantering av relationer.

För system där datarelationer är viktiga och måste vara korrekta, som i en e-handelsdatabas, är en relationsdatabas som MySQL det bästa valet.

 - Säkerhetsåtgärder:
Jag har skapat användare till databasen, admin och customer. Kunder som registreras blir automatiskt customer om inget annat anges. Admin tillåts att göra allt. Kunder kan bara läsa visa tabeller. Alla konton loggar in med lösenord.

 - Vad jag har gjort:

Skapat databasen och tabeller med information om album, artister och specifika album.

Lagt till data med INSERT.

Skapat index på artist, genre och album för att förbättra sökhastigheten.

Skapat en lagrad procedur för att kunna söka album baserat på artist.

Skapat användare (admin och customer) och tilldelat olika behörigheter där admin kan göra allt och customer bara kan läsa vissa tabeller.

Exempel på användning:

Hämta alla album från en viss artist med:
CALL GetAlbumsByArtist('TOOL');

Hämta album och visa vilket land artisten kommer ifrån genom att använda JOIN mellan tabellerna.

Räkna album per genre med GROUP BY.

Priset i orders och order_lines är automatiserat. Priset läggs inte till på orders förrän det lagts till i order_lines. Väl i order_lines skriver du bara in order_id, produkt-ID och kvantitét så läggs priset in automatiskt, och även det totala priset, ifall du köper fler än ett album.

Syftet har varit att lära mig strukturera data, tänka på prestanda och säkerhet, och använda SQL:s olika funktioner.

 - Installation & Användning:
Ladda ner MySQL Workbench och starta din lokala databas. Öppna SQL-filen till musikaffären. Kör den och eventuellt lägg in egen data om du vill. Du kan använda den här till en egen musikaffär liknande denna. Ändra bara om datan så det stämmer in på din musikaffär.

Väldigt kul att göra dock!

//Smorgasvein
