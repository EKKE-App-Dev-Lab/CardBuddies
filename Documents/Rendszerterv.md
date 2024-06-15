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


