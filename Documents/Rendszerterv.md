# Rendszerterv

## 1. Rendszer célja

Egy olyan weboldal létrehozása, ahol a felhasználók modern, átlátható és kereshető felületen böngészhetnek és
vásárolhatnak football kártyákat. Az oldalon regisztrált eladók és vásárlók kölcsönösen megbízható forrásokból származó,
ellenőrzött minőségű és eredetiségű termékeket kínálnak és vásárolnak. A cél, hogy a vevők könnyedén találjanak rá a
kívánt termékekre, és az eladók könnyen kezelhessék kínálatukat.

Az oldalon történő vásárláshoz egy regisztrált és e-mail címmel megerősített felhasználói fiók szükséges. Az űrlapon
megadott adatokkal tud a felhasználó később bejelentkezni, hogy vásárlást tudjon indítani, valamint elfelejtett jelszó
esetén jelszót helyreállítani. A regisztrációnál számítógépes robot szűrés is történik reCaptcha megerősítéssel.

Kétféle felhasználónk van:

Az adminisztrátor/super user, aki hozzáfér mindenhez, az adatbázishoz is.
A vásárlók és eladók, akik rendelkeznek érvényes regisztrációval és megrendelést is tudnak leadni.
A sima látogatók csak böngészni tudnak az oldalon vagy kapcsolatba lépni az eladóval, de megrendelést nem tudnak leadni.

A kártyák, valamint a felhasználók és a megrendelések egy adatbázisban vannak tárolva, ehhez csak megrendelőnknek van
hozzáférése, hogy új termékeket tudjon felvinni, módosítani, törölni közvetlenül az adatbázisban is, és a szükségtelen
felhasználókat is törölni tudja. Ugyanakkor megrendelőnk jogosultságával a weboldalon keresztül is tud termékeket
felvinni/módosítani/törölni, ami közvetlenül az adatbázisba íródik.

## 2. Projekt terv

A projekt egy weboldal, ami PHP alapokon nyugszik, de használ HTML, CSS, Bootstrap, JavaScript elemeket, valamint MySQL
adatbázist a felhasználók, termékek és vásárlási adatok rögzítéséhez. Öt fejlesztő dolgozik egyszerre a
megvalósításon, ezért a konfliktusok kezelésére projektmenedzsment és kollaborációs eszközöket használunk.

A feladatok nyomon követésére a Trello-ban létrehozott felületet használjuk.

A folyamatos kommunikációhoz és a projekt megbeszélésekhez, valamint az azonnali problémamegoldáshoz a Discord-on
létrehozott projekt szervert használjuk. Az itt rendelkezésre álló eszközök, úgymint chat, fájlmegosztás,
képernyőmegosztás és telefon/videókonferencia hívás extenzíven támogatják a feladat megvalósítását.

A kódon végzett változtatásokat és az esetleges párhuzamosan végzett módosítások konfliktusait a GitHub használatával
orvosoljuk, és itt követjük nyomon a kódfejlesztés előrehaladását.

## 3. Üzleti folyamatok modellje

### 3.1 Üzleti szereplők

A rendszert regisztrációval nem rendelkező felhasználók (látogatók) is eredményesen használhatják; számos statikus
tartalom elérhető számukra, amelyek révén információkat szerezhetnek az eladókról, általuk kínált szolgáltatásokról és
termékekről. Emellett kapcsolatfelvételi lehetőség is adódik számukra.

A regisztrált felhasználók, akiket vásárlóknak vagy eladóknak tekintünk, képesek online kiválasztani és megvásárolni a
kívánt terméket, vagy eladásra kínálni saját kártyáikat. Ezt követően lehetőségük van a kifizetésre, valamint a
kiszállítás a megadott címre történik.

Az adminisztrátor vagy a super-user jogosultságokkal rendelkező felhasználó figyelemmel követheti a megrendeléseket,
frissítheti az online árukészletét, és naprakész információkat oszthat meg a szolgáltatásával kapcsolatban.

### 3.2 Üzleti folyamatok

Bejelentkezés minden felhasználó számára elérhető a megfelelő menüpont alatt:
A ’Belépés’ ikonra kattinta megjelenik ’Felhasználó név’ és ’Jelszó’ beviteli űrlap. Ezek megadása után van lehetőség a
belépésre. Sikertelen belépésről figyelmeztető üzenetben tájékoztatja a felhasználót a weboldal. Ha a belépés sikeres, a
felhasználó megkapja a belépett felhasználó jogait.

### Üzleti folyamatok regisztrálatlan felhasználók számára:

##### Keresés az eladó termékek között:

A regisztrálatlan felhasználók a Termékek lapon tudnak keresni a megvásárolható termékek között, de a megvásárolni
kívánt tételt nem tudják a kosarukba helyezni.

#### Regisztráció a rendszerben:

A még nem regisztrált vásárlók számára a következő adatok megadása szükséges a regisztráció során:

| Megnevezés     
|----------------|
| Felhasználónév |
| Keresztnév     
| Vezetéknév     
| Email          
| Jelszó         
| Jelszó újra    

Miután a felhasználó megfelelően kitöltötte az adatokat és a rendszer sikeresen validálta azokat, értesítést kap a fiók
megerősítési kötelezettségéről. A regisztráció érvényessé válik, amikor a felhasználó az e-mailben megadott címen
megerősíti azt. Ezt követően a felhasználót hivatalosan regisztráltnak tekintjük.

A felhasználó valamennyi személyes adata biztonságban van, mivel azok jelszóval védett adatbázisban tárolódnak. A
felhasználó jelszava további adatvédelmi intézkedéseket tartalmaz, ugyanis hash algoritmus segítségével kerül tárolásra,
ezzel maximalizálva a biztonságot. Ezen eljárások együttesen hozzájárulnak ahhoz, hogy a felhasználók személyes
információi védettek és biztonságban maradjanak a rendszerben.

### Üzleti folyamatok regisztrált felhasználók számára

#### Bejelentkezés:

### Üzleti folyamatok regisztrált felhasználók számára

#### Bejelentkezés:

Regisztrált felhasználóinknak lehetőségük van bejelentkezni a rendszerbe, megadva az azonosítójukat (felhasználónév) és
jelszavukat.

#### Kijelentkezés:

A felhasználó bejelentkezve a felhasználó ikonra kattintva az adminisztrációs felületre jut, ahol a kijelentkezés gombra
kattintva tud kijelentkezni a felületről.

#### Jelszó helyreállítása:

Ha a regisztrált felhasználó elfelejtette jelszavát, lehetősége van a jelszó helyreállítására. Ebben az esetben egy új,
ideiglenes jelszó kerül kiküldésre a felhasználó által regisztrált email címre. Az ideiglenes jelszó segítségével
történik a bejelentkezés, majd lehetőség adódik a jelszó azonnali cseréjére a felhasználó által választott,
biztonságosabb jelszóra.

#### Regisztrált felhasználói fiók adatainak módosítása:

A regisztrált felhasználónak lehetősége van a felhasználó ikonra kattintva megváltoztatni az adatait, nevét,
telefonszámát, címét vagy jelszót tud módosítani.

#### Regisztrált felhasználói fiók törlése:

A regisztrált felhasználónak leheetősége van törölni a fiókját. Minden a felhasználóhoz kapcsolódó a rendszerben tárolt
adat törlésre kerül. A törlés fizikai törlés azaz nincsen lehetőség a törölt felhasználó visszaállítására.

#### Keresés az eladó termékek között regisztrált felhasználóként:

A regisztrált felhasználók a Termékek lapon tudnak keresni a megvásárolható termékek között és a megvásárolni kívánt
tételt a kosarukba helyezni.

#### Vásárlás:

A vásárlás során a felhasználónak lehetősége van a keresés során visszakapott termékekből vásárolni.
Ennek a lépései a következőek:

- A megvásárolandó termék kikeresése.
- A megvásárolandó termék vásárlói kosárba helyezése.
- A kosár véglegesítése. A véglegesítés során lehetősége van a regisztrált felhasználónak (vásárlónak) még egyszer
  meggyőződni a kosár tartalmáról. A vásárlás véglegesítéséhez az alábbi adatok szükségesek:

| Szükséges adatok         
|--------------------------|
| Számlázási cím           
| Szállítási cím           
| Fizetési mód választása  
| Fizetési adatok megadása |

- Validáció után a rendszer regisztrálja a vásárlási szándékot, értesíti, mind az eladót és a vásárlót a vásárlásról,
  majd a frissíti a készletinformációkat is.
- A felhasználót a rendszer a felületen értesíti a vásárálás sikerességéről, majd üríti a vásárlói kosarat, hiszen az
  ottani termékek már megvásárlásra kerültek.

### Üzleti folyamatok admin (super user) felhasználók számára

Az adminisztrátor/eladó jogosultságú felhasználónak lehetősége van az alábbiakra:

- új termékek felvitele
- termékek adatainak módosítása
- termékek törlése

### 3.3. Üzleti entitások

- futball kártya
- megrendelés

## 4. Követelmények

Egy PHP-t futtatni képes webszerver MySQL adatbázissal, valamint e-mail küldéssel a regisztrációhoz, egy modern böngésző
felület.

## 5. Funkcionális terv

### 5.1 Rendszerszereplők

- nem regisztrált böngésző
- regisztrált vásárló
- eladó/adminisztrátor

### 5.2 Rendszerhasználati esetek

#### Keresés az eladó termékek között (nem regisztrált felhasználóknak)

#### Regisztráció

#### Bejelentkezés

#### Jelszó helyreállítása

#### Felhasználói fiók adatainak módosítása

#### Regisztrált felhasználói fiók törlése

#### Keresés az eladó termékek között regisztrált felhasználóként

#### Vásárlás

#### Felhasználó kijelentkezés

#### Adminisztrátor új termék felvitele/módosítása/törlése

[//]: # (TODO)

### 5.3 Menühierarchiák

A menürendszert egy, a weboldal fejléce alatt található vízszintes, lenyíló menüket is tartalmazó navigációs sávban
építettük fel.

A menünek kétféle megjelenése van a megtekintő eszköz felbontásának függvényében, de a két menürendszer csak kinézetben
tér el egymástól.

A rendszerbe való bejelentkezés előtt elérhető oldalak a menüből:

- Kezdőlap
- Termékek
- Készíts saját fociskártyát
- Rólunk
- Kapcsolatfelvétel
- Bejelentkezés, csak ikonnal jelezve

A rendszerbe való bejelentkezés után elérhető oldalak a menüből:

- Bevásárolókosár, csak ikonnal jelezve. Ezen látszik az is, hogy hány terméket tartalmaz a kosár

Láblécben is találhatóak további menüpontok, amelyek minden eszközön elérhetőek, ezek a következőek:

- Adatkezelési tájékoztató
- Felhasználói feltételek

### 5.4 Képernyőtervek

A CardBuddies webshop tervezési folyamata azzal kezdődött, hogy alaposan feltérképeztük a fociskártyák piacát,
figyelembe véve az európa bajnokság aktualitását és a célcsoport igényeit. A kutatás eredményeként kialakítottuk a
tervezés alapelveit, melyek közé tartozott a modern és fiatalos dizájn hangsúlyozása.

A design fázisában elsődleges szempontként kezeltük az élénk és sportos színpaletta használatát, amely tükrözi a
CardBuddies dinamizmusát és innovatív hozzáállását. Az olvasható betűtípusok és az áttekinthető elrendezés kialakítása
mellett a könnyen kezelhető és átlátható felületre helyeztük a hangsúlyt, hogy a látogatók gyorsan és egyszerűen
megtalálhassák a keresett termékeket.

A funkcionalitás és esztétika szorosan összefonódott a tervezési folyamat minden szakaszában. A webshop felépítésénél
odafigyeltünk arra, hogy az oldalak ne csak esztétikusak, hanem praktikusak is legyenek. Az egyszerű vásárlási folyamat
és a logikus információelrendezés garantálják a zökkenőmentes felhasználói élményt.

Így született meg a CardBuddies webshop, amely nem csupán egy online felület, hanem inspiráló tér is. A forma és a
funkcionalitás harmonikusan egyesül ebben a modern, fiatalos és könnyen kezelhető webshopban, létrehozva ezzel egy
kivételes vásárlási élményt a látogatók számára.

Főbb oldalak:

* **index.php**, amely minden felhasználó számára először jelenik meg.

* **products.php**, regisztrált és nem regisztrált felhasználók is ezen az oldalon böngészhetik a webshop kínálatát. A
  kártyák rendezése és nemzetiség szerinti szűrése is eléhető funkció.

* **makeyourcard.php**, amely egy páratlan szolgáltatást lehetőségét mutatja be a vásárló számára

* **about.php**, a csapat tagjait és a céget bemutató oldal

* **contact.php**, a kapcsolatfelvétel részleteinek bemutatására
* **cart.php**, a bejelentkezett felhasználó kosár tartalmának megjelenítéséhez

## 6. Fizikai környezet

Kliens oldalon egy modern böngészőt futtatni képes operációs rendszerre van szükség (és ettől függően egy megfelelő
hardverrel ellátott eszközre). Az oldal struktúrájáért a HTML, a megjelenítésért a CSS valamint Bootstrap és az
interakciókért a JavaScript felelős.

## 7. Absztrakt domain modell

## 8. Architekturális terv

A rendszer folyamatosan bővíthető az eladó által. Új termékeket vihet fel, valamint módosíthatja és törölheti a
meglévőket.

Biztonsági funkciók közé tartozik, hogy van adminisztrátori fiók. Az adminisztrátor minden regisztrált felhasználó
adatát láthatja és kezelheti, kivéve a jelszót, mivel az titkosítva van eltárolva. Minden felhasználó csak a saját
adatait módosíthatja.

## 9. Adatbázis terv

A CardBuddies webshop által használt MySQL adatbázis, a cardbuddiesdb, egy olyan adatbázis-rendszer, amelyet úgy
terveztünk, hogy kezelje az online fociskártyabolt adatait. A struktúra több táblát tartalmaz, mint például products,
nationality, product_category, types, product_nationality, user, cart, cartitem, userorder, orderitem, és transaction.

Ebben a rendszerben a products tábla tárolja az eladásra kínált kártyák adatait, beleértve az játékos nevét,
nemzetiségét, leírását, állapotát, védő és támadó pontját, árát, és a kártya képét. A nationality és types táblák
különböző nemzetiségeket és típusokat definiálnak, amelyeket aztán a product_nationalizy és product_type táblákon
keresztül kapcsolnak össze a termékekkel.

A user tábla a felhasználók adatait tárolja, beleértve a felhasználónevet, jelszót, nevet, e-mail címet, címet,
telefonszámot, és további információkat. A vásárlási folyamatot a cart, cartitem, userorder, orderitem, és transaction
táblák kezelik, amelyek a kosárba helyezett termékeket, a megrendeléseket és a tranzakciókat követik nyomon.

Az alábbi ábra mutatja az adatbázis felépítését:

![img.png](adatbazis.png)

## 10. Tesztterv

A tesztelés során felmerült hibákra a Trello-ban hibajegyeket rögzítünk a tesztszámnak megfelelően. A hibajavítás
folyamatos, de a teszt esetek újratesztelése minden egyes tesztciklusban megtörétnik, biztosítva, hogy az adott
hibajavítás nem okoz máshol hibát, ami korábban működött.

### Tesztesetek:

| Azonosító   | Teszt leírása                                                                                     | Elvárt viselkedés                                                                                                                |
|-------------|---------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| TEST1_00100 | A weboldal Kezdőoldal megnyitása                                                                  | A weboldal sikeresen jelenjen meg                                                                                                |
| TEST1_00101 | A Kezdőoldal menü megjelenése                                                                     | A weboldal menüje megfelelő módon jelenjen meg                                                                                   |
| TEST1_00102 | A Kezdőoldal slider megjelenése                                                                   | A slider megfelelő módon jelenjen meg                                                                                            |
| TEST1_00103 | A Kezdőoldal slider működése                                                                      | A slider cserélje a képeket és a szöveget                                                                                        |
| TEST1_00104 | A Kezdőoldal különleges ajánlatai szekció megjelenése                                             | A szekció megfelelő módon jelenjen meg                                                                                           |
| TEST1_00105 | A Kezdőoldal különleges ajánlat szekció visszaszámlálása                                          | A számláló működjön                                                                                                              |
| TEST1_00106 | A Kezdőoldal különleges ajánlat szekció "Vásárolj most" gomb kipróbálása                          | Jelenjenek meg a termékek                                                                                                        |
| TEST1_00107 | A Kezdőoldal megrendelés menete szekció megjelenése                                               | A szekció megfelelő módon jelenjen meg                                                                                           |
| TEST1_00108 | A Kezdőoldal csapatunk szekció megjelenése                                                        | A szekció megfelelő módon jelenjen meg                                                                                           |
| TEST1_00109 | A Kezdőoldal térkép szekció megjelenése                                                           | A térkép megfelelő módon jelenjen meg                                                                                            |
| TEST1_00110 | A Kezdőoldal térkép szekció cím mutatása                                                          | A térkép a megfelelő cimmel jelenjen meg                                                                                         |
| TEST1_00111 | A Kezdőoldal kapcsolatfelvétel szekció megjelenése                                                | A szekció megfelelő módon jelenjen meg                                                                                           |
| TEST1_00112 | A Kezdőoldal kapcsolatfelvétel szekció üzenet küldés kipróbálása adatok nélkül                    | Sikertelen üzenet küldés, hiba jelzése                                                                                           |
| TEST1_00113 | A Kezdőoldal kapcsolatfelvétel szekció üzenet küldés kipróbálása helytelen adatokkal, Email       | Sikertelen üzenet küldés, hiba jelzése                                                                                           |
| TEST1_00114 | A Kezdőoldal kapcsolatfelvétel szekció üzenet küldés kipróbálása helytelen adatokkal, Telefonszám | Sikertelen üzenet küldés, hiba jelzése                                                                                           |
| TEST1_00115 | A Kezdőoldal kapcsolatfelvétel szekció üzenet küldés kipróbálása helytelen adatokkal, Név         | Sikertelen üzenet küldés, hiba jelzése                                                                                           |
| TEST1_00116 | A Kezdőoldal kapcsolatfelvétel szekció üzenet küldés kipróbálása helytelen adatokkal, Email       | Sikertelen üzenet küldés, hiba jelzése                                                                                           |
| TEST1_00117 | A Kezdőoldal kapcsolatfelvétel szekció üzenet küldés kipróbálása helyes adatokkal, Email          | Sikeres üzenet küldés és visszajelzés                                                                                            |
| TEST1_00118 | A Kezdőoldal hírlevél szekció megjelenése megfelelő módon                                         | A szekció megfelelő módon jelenjen meg                                                                                           |
| TEST1_00119 | A Kezdőoldal hírlevél szekció felíratkozás kipróbálása helytelen adatokkal                        | Sikertelen felíratkozás, hiba jelzése                                                                                            |
| TEST1_00120 | A Kezdőoldal hírlevél szekció felíratkozás kipróbálása helyes adatokkal, regisztráció nélkül      | Sikertelen felíratkozás, hiba jelzése                                                                                            |
| TEST1_00121 | A Kezdőoldal hírlevél szekció felíratkozás kipróbálása, már felíratkozottként                     | Sikertelen felíratkozás, hiba jelzése                                                                                            |
| TEST1_00122 | A Kezdőoldal hírlevél szekció felíratkozás kipróbálása, regisztrálás nélkül                       | Sikertelen felíratkozás, hiba jelzése                                                                                            |
| TEST1_00123 | A Kezdőoldal hírlevél szekció felíratkozás kipróbálása, regisztráltként, nem felíratkozottként    | Sikeres felíratkozás, visszajelzés                                                                                               |
| TEST1_00124 | A Kezdőoldal lábléc szekció megjelenése                                                           | A weboldal menüje megfelelő módon jelenjen meg                                                                                   |
| TEST1_00200 | A regisztrációs felület elérése                                                                   | A felület legyen elérhető                                                                                                        |
| TEST1_00201 | A regisztrációs felület kipróbálása helyes adatokkal                                              | Sikeres regisztráció, megerősítő email kiküldése                                                                                 |
| TEST1_00202 | A regisztrációs felület kipróbálása helytelen adatokkal, Felhasználónév                           | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00203 | A regisztrációs felület kipróbálása helytelen adatokkal, Vezetéknév                               | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00204 | A regisztrációs felület kipróbálása helytelen adatokkal, Keresztnév                               | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00205 | A regisztrációs felület kipróbálása helytelen adatokkal, Email                                    | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00206 | A regisztrációs felület kipróbálása helytelen adatokkal, Jelszó                                   | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00207 | A regisztrációs felület kipróbálása helytelen adatokkal, Jelszó újra                              | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00208 | A regisztrációs felület kipróbálása helytelen adatokkal, ReCaptcha                                | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00209 | A regisztrációs felület kipróbálása létező felhasználói adatokkal                                 | Sikertelen regisztráció, hiba jelzése                                                                                            |
| TEST1_00300 | A bejelentkező felület elérése                                                                    | A felület legyen elérhető                                                                                                        |
| TEST1_00301 | A bejelentkező felület kipróbálása helyes adatokkal                                               | Sikeres bejelentkezés                                                                                                            |
| TEST1_00302 | A bejelentkező felület kipróbálása helytelen adatokkal, Felhasználónév                            | Sikertelen bejelentkezés, hiba jelzése                                                                                           |
| TEST1_00303 | A bejelentkező felület kipróbálása helytelen adatokkal, Jelszó                                    | Sikertelen bejelentkezés, hiba jelzése                                                                                           |
| TEST1_00304 | A bejelentkező felület kipróbálása nem létező felhasználói adatokkal                              | Sikertelen bejelentkezés, nem létező felhasználó jelzése                                                                         |
| TEST1_00305 | A bejelentkező felületen, Elfelejtett jelszó kérelem                                              | Új oldal megjelenítés ahol emailt kell megadni, sikeres email kiküldés új generált jelszóval                                     |
| TEST1_00306 | A bejelentkező felületen, Ideiglenes jelszó generálás                                             | Email kiküldés új jelszóval                                                                                                      |
| TEST1_00307 | A bejelentkező felületen, Bejelentkezés újraküldött generált jelszóval                            | Email kiküldés új jelszóval                                                                                                      |
| TEST1_00400 | A felhasználó admin felületen, Helyes jelszó változtatás                                          | Sikeres jelszó változtatás                                                                                                       |
| TEST1_00401 | A felhasználó admin felületen, Helytelen jelszó változtatás                                       | Sikertelen jelszó változtatás                                                                                                    |
| TEST1_00402 | A felhasználó admin felületen, Helyes vezetéknév változtatás                                      | Sikeres jelszó változtatás                                                                                                       |
| TEST1_00403 | A felhasználó admin felületen, Helytelen vezetéknév változtatás                                   | Sikertelen jelszó változtatás                                                                                                    |
| TEST1_00404 | A felhasználó admin felületen, Helyes keresztnév változtatás                                      | Sikeres jelszó változtatás                                                                                                       |
| TEST1_00405 | A felhasználó admin felületen, Helytelen keresztnév változtatás                                   | Sikertelen jelszó változtatás                                                                                                    |
| TEST1_00406 | A felhasználó admin felületen, Kijelentkezés                                                      | Sikeres kijelentkezés                                                                                                            |
| TEST1_00500 | A weboldal Termékek megnyitása                                                                    | A felület legyen elérhető                                                                                                        |
| TEST1_00501 | A weboldal Termékek sorbarendezése                                                                | Terméklista sorrend változik és a címsorban is megjelenik a választott opció                                                     |
| TEST1_00502 | A weboldal Termékek kategória választás                                                           | Terméklista kínálat változik és a címsorban is megjelenik a választott opció                                                     |
| TEST1_00503 | A weboldal Termékek termékre kattintás                                                            | Termék részletei betöltődnek, valamint látszik a rendelhető mennyiség                                                            |
| TEST1_00600 | A weboldal Termék részleteknél Mennyiség változtatás                                              | Mennyiség növelhető-csökkenthető                                                                                                 |
| TEST1_00601 | A weboldal Termék részleteknél Kosárba gombra kattintás                                           | Adott mennyiség a kosárba kerül, a jobb felső sarokban a kosár ikonnál látszik a kosárban lévő összmennyiség száma               |
| TEST1_00602 | A weboldal Termék részleteknél Folytatás gombra kattintás                                         | Visszatér az előző terméklista oldalra, a termék nem kerül a kosárba                                                             |
| TEST1_00700 | A felhasználói kosár megnyitása                                                                   | A felület legyen elérhető                                                                                                        |
| TEST1_00701 | A felhasználói kosár tartalma                                                                     | Listázza ki a kosárba helyezett termékeket                                                                                       |
| TEST1_00702 | A felhasználói kosárból termék eltávolítása                                                       | Törlődik a termék a kosárból, a kosár ikonnál változik a kosárban lévő mennyiség                                                 |
| TEST1_00703 | A felhasználói kosár összesítő                                                                    | Látszódik a részösszeg, a kiszállítás alapdíja valamint a fizetendő végösszeg                                                    |
| TEST1_00703 | A felhasználói kosár Pénztár                                                                      | Rendelési összesítő oldal betöltődik                                                                                             |
| TEST1_00801 | A Rendelési összesítő Keresztnév helyes megadása                                                  | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00802 | A Rendelési összesítő Vezetéknév helyes megadása                                                  | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00803 | A Rendelési összesítő Cím helyes megadása                                                         | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00804 | A Rendelési összesítő Irányítószám helyes megadása                                                | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00805 | A Rendelési összesítő Email helyes megadása                                                       | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00806 | A Rendelési összesítő Fizetési mód választható                                                    | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00807 | A Rendelési összesítő Kártyán szereplő név helyes megadása                                        | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00808 | A Rendelési összesítő Bankkártya szám helyes megadása                                             | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00809 | A Rendelési összesítő Lejárati dátum Hónap helyes megadása                                        | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00810 | A Rendelési összesítő Lejárati dátum Év helyes megadása                                           | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00811 | A Rendelési összesítő Lejárati dátum CVV helyes megadása                                          | Nincs hiba, ha az összes adat helyes a Tovább a pénztárhoz gombra kattintva                                                      |
| TEST1_00812 | A Rendelési összesítő Keresztnév helytelen megadása                                               | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00813 | A Rendelési összesítő Vezetéknév helytelen megadása                                               | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00814 | A Rendelési összesítő Cím helytelen megadása                                                      | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00815 | A Rendelési összesítő Irányítószám helytelen megadása                                             | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00816 | A Rendelési összesítő Email helytelen megadása                                                    | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00817 | A Rendelési összesítő Kártyán szereplő név helytelen megadása                                     | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00818 | A Rendelési összesítő Bankkártya szám helytelen megadása                                          | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00819 | A Rendelési összesítő Lejárati dátum Hónap helytelen megadása                                     | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00820 | A Rendelési összesítő Lejárati dátum Év helytelen megadása                                        | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00821 | A Rendelési összesítő Lejárati dátum CVV helytelen megadása                                       | Hiba a Tovább a pénztárhoz gombra kattintva                                                                                      |
| TEST1_00822 | A Rendelési összesítő Kosár tételenkéni összesítés                                                | A felsorolás, a tételenkénti teljes összegek valamint a Végösszeg helyes                                                         |
| TEST1_00900 | A weboldal Készíts saját fociskártyát oldal megnyitása                                            | A felület legyen elérhető és reszponzív                                                                                          |
| TEST1_00901 | A weboldal Készíts saját fociskártyát oldal tetején Menüsor                                       | A menüsor megjelenik                                                                                                             |
| TEST1_00902 | A weboldal Készíts saját fociskártyát oldal tetején Menüsor                                       | KÜLÖNLEGES SZOLGÁLTATÁSUNK szekció megjelenik                                                                                    |
| TEST1_00903 | A weboldal Készíts saját fociskártyát oldal tetején Menüsor                                       | AJÁNLATUNK szekció megjelenik                                                                                                    |
| TEST1_00904 | A weboldal Készíts saját fociskártyát oldal tetején Menüsor                                       | AJÁNLATUNK szekcióban link kattitntható és megfelelő email klienssel megnyitható                                                 |
| TEST1_00905 | A weboldal Készíts saját fociskártyát oldal Lábjegyzet szekció megjelenítés                       | Cégnév, címadatok, elérhetőségek látszódnak                                                                                      |
| TEST1_00906 | A weboldal Készíts saját fociskártyát oldal Lábjegyzet Adatkezelési tájékoztató és ÁSZF           | Kattintásra a dokumentumok megnyílnak a böngészőben                                                                              |
| TEST1_01000 | A weboldal Rólunk oldal megnyitása                                                                | A felület legyen elérhető és reszponzív                                                                                          |
| TEST1_01001 | A weboldal Rólunk oldal tetején Menüsor                                                           | A menüsor megjelenik                                                                                                             |
| TEST1_01002 | A weboldal Rólunk oldal Cégtulajdonos szekció                                                     | Fotó, bemutatkozás, aláírás megjelenik                                                                                           |
| TEST1_01003 | A weboldal Rólunk oldal Kitüntetések szekció                                                      | Legutóbbi kitüntetések évszámmal, leírással megjelenik                                                                           |
| TEST1_01004 | A weboldal Rólunk oldal Csapatunk szekció                                                         | Csapat tagjainak fotói, neve, beosztása, mottója és ikonok közösségi oldalaikhoz megjelenik                                      |
| TEST1_01005 | A weboldal Rólunk oldal Itt találhatsz meg minket szekció                                         | Google maps térkép megjelenik a cég címével                                                                                      |
| TEST1_01006 | A weboldal Rólunk oldal Kapcsolatfelvétel űrlap szekció                                           | Űrlap megfelelően megjelenik                                                                                                     |
| TEST1_01007 | A weboldal Rólunk oldal Kapcsolatfelvétel űrlap adatok helyes megadása                            | Küldés gombra kattintva üzenet küldés a beállított e-mail címre                                                                  |
| TEST1_01008 | A weboldal Rólunk oldal Kapcsolatfelvétel űrlap adatok helytelen megadása                         | Hibaüzenet, javítás kérése a megfelelő mező adatainak                                                                            |
| TEST1_01009 | A weboldal Rólunk oldal Hírlevél szekció helyes e-mail cím megadása                               | Feliratkozom gombra kattintás esetén hozzáadás az adatbázishoz és megerősítő üzenet a képernyőre sikeres feliratkozásról         |
| TEST1_01010 | A weboldal Rólunk oldal Hírlevél szekció helytelen e-mail cím megadása                            | Hibaüzenet a Feliratkozom gombra kattintás esetén                                                                                |
| TEST1_01011 | A weboldal Rólunk oldal Lábjegyzet szekció megjelenítés                                           | Cégnév, címadatok, elérhetőségek látszódnak                                                                                      |
| TEST1_01012 | A weboldal Rólunk oldal Lábjegyzet Adatkezelési tájékoztató és ÁSZF                               | Kattintásra a dokumentumok megnyílnak a böngészőben                                                                              |
| TEST1_01100 | A weboldal Kapcsolat megnyitása                                                                   | A felület legyen elérhető                                                                                                        |
| TEST1_01100 | A weboldal Kapcsolat oldal megnyitása                                                             | A felület legyen elérhető és reszponzív                                                                                          |
| TEST1_01101 | A weboldal Kapcsolat oldal tetején Menüsor                                                        | A menüsor megjelenik                                                                                                             |
| TEST1_01105 | A weboldal Kapcsolat oldal Itt találhatsz meg minket szekció                                      | Google maps térkép megjelenik a cég címével                                                                                      |
| TEST1_01106 | A weboldal Kapcsolat oldal Kapcsolatfelvétel űrlap szekció                                        | A kapcsolatfelvételi szekcióban minden szükséges mező (név, email, telefon, megrendelőszám, üzenet, küldés gomb stb.) megjelenik |
| TEST1_01107 | A weboldal Kapcsolat oldal Kapcsolatfelvétel űrlap adatok helyes megadása                         | Küldés gombra kattintva üzenet küldés a beállított e-mail címre                                                                  |
| TEST1_01108 | A weboldal Kapcsolat oldal Kapcsolatfelvétel űrlap adatok helytelen megadása                      | Hibaüzenet, javítás kérése a megfelelő mező adatainak                                                                            |
| TEST1_01109 | A weboldal Kapcsolat oldal Hírlevél szekció helyes e-mail cím megadása                            | Feliratkozom gombra kattintás esetén hozzáadás az adatbázishoz és megerősítő üzenet a képernyőre sikeres feliratkozásról         |
| TEST1_01110 | A weboldal Kapcsolat oldal Hírlevél szekció helytelen e-mail cím megadása                         | Hibaüzenet a Feliratkozom gombra kattintás esetén                                                                                |
| TEST1_01111 | A weboldal Kapcsolat oldal Lábjegyzet szekció megjelenítés                                        | Cégnév, címadatok, elérhetőségek látszódnak                                                                                      |
| TEST1_01112 | A weboldal Kapcsolat oldal Lábjegyzet Adatkezelési tájékoztató és ÁSZF                            | Kattintásra a dokumentumok megnyílnak a böngészőben                                                                              |

## 11. Telepítési terv

Helyi gépre való telepítés esetén a következőkre lesz szükség:

- Egy webszerver környezetre, ami tudja az Apache/PHP/MySQL hármast.
- Egy modern böngészőt futtatni képes operációs rendszer (és az ehhez megfelelő hardverrel ellátott eszköz).
- Egy modern böngésző.

Webtárhelyre való telepítés esetén a következőkre lesz szükség:

- Egy a Apache/PHP/MySQL hármast támogató tárhely.
- Egy program, amivel FTP kapcsolaton keresztül feltölthetők a webalkalmazás fájljai.
- Egy modern böngésző.

## 12. Karbantartási terv

A platform nem igényel jelentős karbantartást. Főként az adatok és az adatbázis szerver felügyeletével kapcsolatos
teendők kapcsolódhatnak a karbantartáshoz.
Bejövő adatbázis kéréseket monitorozni kell és esetenként optimalizálni, amennyiben nagy a terheltség.
Funkcionalitás bővítése esetén merülhetnek fel problémák, ezen problémák elkerülésének érdekében bővítés esetén precízen
kell megtervezni az új verziókat.

