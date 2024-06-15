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

