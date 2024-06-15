# Funkcionális specifikáció

## Bevezetés

A megrendelő részéről kaptunk néhány weboldal linket, amihez hasonlót szeretne a főbb funkciókkal.

## Célok

A weboldal elsődleges célja kártyák bemutatása rendezhetően és az egyszerű vásárlási lehetőség.

A vásárláshoz a vevőknek regisztrációra van szükség, vásárolni kizárólag regisztrált felhasználóknak szabad, de a
későbbiekben is visszatérhetnek az oldalra.

A vásárlói adatbázisból elérhetők az e-mail adatok, ahova megkeresések, értesítések küldhetők.

A megrendelő egy eladói profillal tudjon belépni és űrlapszerűen újabb kártyákat felvinni, módosítani, törölni.

Vevő: kereshet, rendezhet és megrendelhet, valamint kapcsolatba léphet az eladóval

Eladó: új terméket vehet fel, módosíthat, törölhet

## Jelenlegi helyzet

Megrendelőnk jelenleg nem rendelkezik semmilyen weboldallal, jellemzően a Facebook Marketplace-t használja
értékesítéshez, ahol számos csaló és szélhámos keseríti meg a dolgát. Erre szeretne megoldást.

A felmerülő problémák megoldásai:

Átlátható, egyszerűen kezelhető felület mind az eladónak, mind a vevőknek.

A potenciális visszaélések kiszűrésének minimalizálása kötelező regisztrációval, valamint előre utalással.

Rendezhető, kategorizálható terméklista.

Egyszerű vásárlási folyamat.

Fenntartási költség minimalizálás.

## Követelménylista

Felhasználói szintek:

- látogatóként a terméklista nem elérhető
- regisztrált felhasználók láthatják a terméklistát és az árakat is, valamint vásárolhatnak
- eladóként elérhető a termék adminisztrációs felület is
- eladó tudja a felhasználókat is adott esetben törölni

## Használati esetek

Szereplők:

Eladó

Vevő

Látogató

Tevékenységek:
Eladó:

- Jogosultsága alapbeállítás a rendszerben
- Bejelentkezés eladóként, mindenhez hozzáfér
- Felhasználókat tud törölni
- Új termékeket tud a terméklistához hozzáadni
- Meglévő termékeket tud a terméklistában módosítani
- Meglévő terméket tud a terméklistáról törölni

Vevő:

- Regisztráció
- Bejelentkezés vevőként
- Termékek megtekintése
- Vásárlói kosárhoz termék hozzáadása
- Termékek módosítása a kosárban
- Termékek eltávolítása a kosárból
- Megrendelés véglegesítése
- Elfelejtett jelszó esetén új kérése
- Jelszó változtatása


## Képernyőtervek

Kezdőoldal látványos kép elemekkel, de alapvetően nem kattintható, csak egy ízelító a kínálatból és a tevékenységről.

Fejléc:
Cég logo baloldalon a fejlécben, minden oldalon látható.
Fejlécben a menüsor, benne Kezdőoldal/Termékek/Új termék hozzáadása/Készítsd el a saját
bakelited/Rólunk/Kapcsolatfelvétel. Új termék hozzáadása csak az Eladó felhasználónál látszik.
Fejléc jobb oldalon kattintható Kosár és Felhasználó ikonok.
Bejelentkezés után válik elérhetővé a terméklista és Vevő felhasználók részére a vásárlási lehetőség, addig „A termékek
megtekintéséhez regisztráció és bejelentkezés szükséges” tájékoztató látható.
A menüsorban bejelentkezés ikonnal lehet a felhasználóknak bejelentkezni.
A kosár ikonra kattintva érhető el a vevők által már kosárba helyezett termékek
A vásárlási folyamat illusztrált bemutatása.
Néhány ízelítő kártya a kínálatból, Youtube vagy Spotify linkkel a belehallgatáshoz.
A lábjegyzetben a szokásos hivatkozások (Adatkezelési szabályzat, Felhasználói feltételek, Támogatás stb.)