# Követelmény specifikáció

## Bevezetés

2024-ben rendezik Németországban a football Európa Bajnokságot, mindemellett Magyarországon a foci töretlen népszerűségnek örvend mind gyerekek és felnőttek körében is. A fiatalabbak szívesen gyűjtik az egyes focistákról megjelenő kártyákat, míg az idősebbek szívesen nosztalgiáznak gyermekeikkel vagy mutogatják korábbi kártyáikat. Emelett jelen vannak profi gyűjtők is, akik egy-egy ritkaságnak számító kártyáért nagyobb összegeket is hajlandóak fizetni, főleg, ha azon az adott játékos aláírása is szerepel. A kártyák iránti érdeklődés és kereslet folyamatos, amit egy-egy nagyobb rendezvény, EB, VB, Olimpia vagy egyéb bajnokságok szintén tudnak erősíteni.

## Jelenlegi helyzet

Megrendelőnk egy jelentősebb gyűjteményt halmozott fel az évtizedek során, de emellett hobbijává is vált, hogy internetről is összegyűjtsön ritkább kártya példányokat, dedikált darabokat. Ezen gyűjtés során született meg a felismerés, hogy nincs egyedül ezzel a hobbinak indult tevékenységgel és tekintve, hogy néhány Facebook csoportot leszámítva nincs erre specializálódott felület, ahol a vevők átláthatóan tudnának keresni. Jelenleg az idő nagy részét az utánajárás, kutatás és böngészés, valamint az utólagos minőség valamint eredetiség ellenőrzés teszi ki.

## Vágyálomrendszer

Egy olyan szurkolói futballkártyákra specializálódott modern felület létrehozása, ahol az eladók termékei és a vevők egymásra találhatnak, az elérhető termékek ellenőrzött minőségűek, a relikviák bizonyíthatóan eredetiek.
A minőséget a vevők a feltöltött jó minőségű fotókat tudják megnézni valamint eredetiséget igazoló tanusítványok alapján ellenőrizni tudják és az eladó garanciája mellett tudnak vásárolni a felületen.
Potenciális eladók pedig kapcsolatba tudnak lépni a céggel és felajánlani megvásárlásra egyéb gyűjteményüket megrendelőnknek.

## Megrendelői cél:

1. Modern, könnyen átlátható, kereshető vásárlói felület
2. Vásárlók regisztrálása az elérés javításához, marketinghez
3. A megrendelőnk számára minél egyszerűbb fizetési mód bevezetése ahol alacsonyak a költségek, hogy versenyképes árakat
   adhasson meg, nagyobb hasznot érhessen el.

## Megrendelői követelmény:

1. Bemutató oldal, ahol vevők meggyőződhetnek az eladó megbízhatóságáról, láthatják a korábbi értékeléseket, vevői
   visszajelzéseket.
2. A kártyák könnyen listázhatóak, kereshetőek legyenek.
3. A stílus harmonizáljon a football világával, külön csapat vagy ország melletti elköteleződés nélkül.
4. Levelezőlista és hírlevél kiküldés a regisztrált vásárlóknak.

## Funkcionális követelmények
Weboldal létrehozása hozzá kapcsolódó adatbázissal, bemutatkozás, regisztráció, belépés
1. Felhasználói regisztráció (eladó/vásárló)
2. Vásárló regisztráció (felhasználónév, jelszó, e-mail cím elég)
3. Terméklistázás
    1. kategória menedzsment (focista neve, csapat, ország, állapot)
    2. kártyakép megjelenítés
    3. rendezési lehetőség (név, csapat, ár)
    4. oldalanként változtatható mennyiségi megjelenítési lehetőség (10/25/mind) és lapozás
4. Bejelentkezés (felhasználói név, jelszó, elfelejtett jelszó újraküldése a regisztrált e-mail címre)
5. Vásárói kosár (hozzáadás/módosítás/törlés)
6. Checkout (itt kell megadni a megrendelő adatait, magánszemély vagy cég, cím adatok, szállítási cím adatok ugyanaz vagy másik)
7. Megrendelés visszaigazolása: e-mail generálás vevőnek a fizetési instrukciókkal