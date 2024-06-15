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



