## Funktionale Programmierung

* Programmierstyle wie z.B. OOP
* Funktionen nicht nur definiert und angewendet werden können, sondern auch wie Daten miteinander verknüpft, als Parameter verwendet und als Funktionsergebnisse auftreten können
* Vorteile
    * Bessere Testbarkeit & Wartbarkeit
    * Parallelisierbarkeit
    * Verständlichkeit
* Nachteile
    * Komplexere Denkweise
    * Rekursive Ansätze (statt Schleifen)
    * Performance-Overhead durch Immutability —> zusätzliche/höhere Rechenlast
* Funktionale Programmiersprachen
    * Haskell
    * Racket
    * LISP
    * Elixir
* Funktionale Aspekte in „Mainstream“ Sprachen
    * map(), filter(), reduce()
    * Lambdas, streams
* Funktionen geben immer ein Resultat zurück
* Zustand des Programms wird nicht verändert
* möglichst frei von Seiteneffekten —> macht code einfacher zu testen und verhalten lässt sich zuverlässiger vorhersagen
    * Keine globale variablen ändern
    * Externen Prozess ausführen/auf externe Ressource zugreifen
* Bei identischen eingaben liefert eine Funktion identische Ergebnisse zurück
* Daten gelten als unveränderlich —> einmal erstellt werden nicht geändert
* Stattdessen neue Datenstrukturen schaffen die abgeleitet werden von den bereits existierenden Daten —> z.b map() oder filter() verwendet
* Code sollte dadurch weniger fehleranfällig werden
* Rekursive Funktionen um wiederkehrende aufgaben zu bewältigen
* High-Order Funktionen —> Funktionen können als Parameter oder Rückgabewerte verwendet werden
* Funktionen welche andere Funktionen als Eingabe akzeptieren oder als Ausgabe liefern nennt man high-order Funktionen
* Deklarativer code --> Schwerpunkt liegt auf WAS erreicht werden soll und nicht WIE
* Code soll die gewünschte Funktionalität beschreiben anstatt detaillierte schrittweise Anweisungen zur Umsetzung zu liefern
* Verwendet reine Funktionen
* Reine Funktionen Merkmale
    * Funktion hängt von input ab und nicht externen Datenänderungen
    * Also wenn eine Funktion sich nicht mehr verhaltet wie sie soll weil eine globale variable nicht geändert wurde dann ist die Funktion NICHT rein
    * Keine side effects
* Lambda Funktionen
    * sind anonyme Funktionen
    * klein & einmalig
    * Kann man „on the fly“ definieren
    * Beispiel (Python): lambda x: x + 1
    * Hier definiert lambda eine Funktion, die eine Eingabe x nimmt und x + 1 zurückgibt. Diese Funktion kann direkt als Argument in höherwertigen Funktionen (wie map, filter etc.) verwendet werden —> hier haben wir wieder unsere tollen high-order Funktionen
* Abstraktion
    * Bestimmte details eines Algorithmus/Datenstruktur zu verbergen
    * Input und Output sind von Bedeutung
    * Resultat —> allgemeinere, wiederverwendbarere Bausteine
    * Implementierungsdetails belieben verborgen
    * Gestalten Systeme verständlicher und modularer —> fördert Wiederverwendbarkeit und Wartbarkeit des Codes
    * Abstraktion ist das Konzept und Funktionen ist die konkrete Anwendung davon
* Avoid Shared State and Mutations
* Mutations (JS const)
    * Const kann man keine neue werte hinzufügen —> Beispiel mit num
    * Kann aber Objekte verändern (mutable) —> Beispiel mit array
    * Const arr = [3, 4, 2, 5, 1, 6]; const sortArray = function(arr) { return arr.sort(); }; const newNums = sortArray(arr); console.log(newNums); console.log(arr);
    * Man müsste/sollte das Objekt klonen
