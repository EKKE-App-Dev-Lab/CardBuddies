# Tesztelési jegyzőkönyv

## Adatok

- Tesztelő: __Kovács Erik__
- Teszteléshez használt fiók: __almafa__

## Környezet

- Operációs rendszer: __WINDOWS__ __11 22H2__ (64 bit)
- Böngésző: __MICROSOFT EDGE__ __120.0.2210.133__ (64 bit)

## Tesztesetek:

| Azonosító   | Teszt leírása                                                          | Elvárt viselkedés                                                                            | Eredmény |
|-------------|------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|----------|
| TEST1_00300 | A bejelentkező felület elérése                                         | A felület legyen elérhető                                                                    |        |
| TEST1_00301 | A bejelentkező felület kipróbálása helyes adatokkal                    | Sikeres bejelentkezés                                                                        |        |
| TEST1_00302 | A bejelentkező felület kipróbálása helytelen adatokkal, Felhasználónév | Sikertelen bejelentkezés, hiba jelzése                                                       |        |
| TEST1_00303 | A bejelentkező felület kipróbálása helytelen adatokkal, Jelszó         | Sikertelen bejelentkezés, hiba jelzése                                                       |        |
| TEST1_00304 | A bejelentkező felület kipróbálása nem létező felhasználói adatokkal   | Sikertelen bejelentkezés, nem létező felhasználó jelzése                                     |        |
| TEST1_00305 | A bejelentkező felületen, Elfelejtett jelszó kérelem                   | Új oldal megjelenítés ahol emailt kell megadni, sikeres email kiküldés új generált jelszóval |        |
| TEST1_00306 | A bejelentkező felületen, Ideiglenes jelszó generálás                  | Email kiküldés új jelszóval                                                                  |        |
| TEST1_00307 | A bejelentkező felületen, Bejelentkezés újraküldött generált jelszóval | Email kiküldés új jelszóval                                                                  |        |
