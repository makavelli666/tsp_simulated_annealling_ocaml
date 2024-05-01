# Définition de la variable OCaml
OCAML = ocaml

# Définition de la variable OCaml Compiler
OCAMLC = ocamlc

# Définition de la variable OCaml Bytecode Interpreter
OCAMLRUN = ocamlrun

# Définition de la variable pour les fichiers sources
SOURCES = simulated_annealing.ml

# Définition de la variable pour le nom du programme
PROGRAM = simulated_annealing

# Définition de la variable pour les fichiers objets
OBJECTS = $(SOURCES:.ml=.cmo)

# Définition de la variable pour les fichiers bytecode
BYTES = $(SOURCES:.ml=.cmx)

# Définition de la variable pour les fichiers dépendances
DEPS = $(OBJECTS:.cmo=.cmi)

# Règle pour compiler le programme
all: $(PROGRAM)

# Règle pour créer le fichier exécutable
$(PROGRAM): $(OBJECTS)
	$(OCAMLC) -o $(PROGRAM) $(OBJECTS)

# Règle pour créer les fichiers objets
.ml.cmo:
	$(OCAMLC) -c $<

# Règle pour créer les fichiers bytecode
.ml.cmx:
	$(OCAMLC) -c $<

# Règle pour nettoyer les fichiers générés
clean:
	rm -f $(PROGRAM) $(OBJECTS) $(BYTES) $(DEPS)

# Règle pour exécuter le programme
run: $(PROGRAM)
	$(OCAMLRUN) $(PROGRAM)

# Indique que les fichiers .cmi sont générés automatiquement
.PHONY: $(DEPS)
