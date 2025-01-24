def function_while(cond, act):
    """
    Eine rekursive Schleifenfunktion, die rein funktional arbeitet.
    
    param cond: Eine Funktion, die den Zustand überprüft und True zurückgibt, wenn die Schleife fortgesetzt werden soll.
    param act:  Eine Funktion, die den Zustand verändert und einen neuen Zustand zurückgibt.
    return: Gibt eine Schleifenfunktion zurück, die den Zustand solange verändert,
            bis die Bedingung (cond) nicht mehr erfüllt ist.
    """
    def loop(state):
        if cond(state):  # Prüfe, ob die Bedingung erfüllt ist
            return loop(act(state))  # Rekursiver Aufruf mit verändertem Zustand
        else:
            return state  # Gibt den Endzustand zurück
    return loop


# Bedingung: Solange der aktuelle Wert kleiner oder gleich als 10 ist, läuft die Schleife weiter
def condition(state):
    # Der erste Wert im Tupel ist der aktuelle Zustand
    return state[0] < 10

# Aktion: Fügt das Quadrat des aktuellen Werts zum Tupel hinzu und gibt einen neuen Zustand zurück
def action(state):
    current, squares = state  # Tupel entpacken
    new_squares = squares + (current ** 2,)  # Neues Tupel erstellen (mit aktuellem Quadrat)
    return (current + 1, new_squares)  # Neuer Zustand als Tupel: aktueller Wert +1, neues Tupel

# Anfangszustand: Ein Tupel mit Startwert (0) und leerem Tupel für die Quadrate
initial_state = (0, ())

# Erstelle die Schleifenfunktion
func_result = function_while(condition, action)

# Starte die Schleife mit dem Anfangszustand
result = func_result(initial_state)

# Ausgabe der Ergebnisse
print(f'Quadrate: {result[1]}')  # Zeigt das Tupel der Quadrate
print(f'Anzahl Iterationen: {len(result[1])}')  # Zeigt die Anzahl der Iterationen
