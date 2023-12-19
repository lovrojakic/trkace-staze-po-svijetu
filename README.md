# Trkaće staze po svijetu
Otvoreni skup podataka o trkaćim stazama po svijetu.

- licencija: CC0 1.0 Universal
- autor: Lovro Jakić
- verzija skupa podataka: v1.0
- jezik: hrvatski

## Opis atributa

### Staza
- "id": identifikacijski broj staze u bazi podataka
- "naziv": naziv staze
- "oznaka_države": ISO 3166-1 Alpha-3 oznaka države u kojoj se nalazi staza
- "datum_otvorenja": ISO 8601 datum otvorenja staze
- "podloga": vrsta podloge staze
- "duljina_km": duljina staze u kilometrima
- "broj_zavoja": broj zavoja na stazi
- "url": URL službene web stranice staze
- "kapacitet_gledatelja": maksimalni broj gledatelja na stazi
- "rekord": objekt koji sadrži informacije o rekordu za najbrži krug staze
- "natjecanja": niz objekata koji sadrže informacije o održanim natjecanjima na stazi

### Rekord
- "vrijeme": vrijeme za najbrži krug
- "vozilo": vozilo koje je postiglo rekord
- "vozač": objekt koji sadrži informacije o vozaču koji je postigao rekord

### Vozač
- "ime": ime vozača
- "prezime": prezime vozača
- "datum_rodenja": datum rođenja vozača
- "oznaka_drzave": ISO 3166-1 Alpha-3 oznaka države porijekla vozača

### Natjecanja
- "naziv": naziv natjecanja
- "godina": godina održavanja natjecanja