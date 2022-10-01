package tec;

public class PassagerStandard implements Passager {

    private String nom;
    private int destination;
    private Position maPosition;

    public PassagerStandard(String nom, int destination) {
        this.nom = nom;
        this.destination = destination;
        this.maPosition = Position.dehors();
    }

    public String nom() {
        return nom;
    }

    public boolean estDehors() {
        return maPosition.estDehors();
    }

    public boolean estAssis() {
        return maPosition.estAssis();
    }

    public boolean estDebout() {
        return maPosition.estDebout();
    }

    public void changerEnDehors() {
        maPosition = Position.dehors();
    }

    public void changerEnAssis() {
        maPosition = Position.assis();
    }

    public void changerEnDebout() {
        maPosition = Position.debout();
    }

    public void monterDans(Vehicule v) {
        if (v.aPlaceAssise()) {
            v.monteeDemanderAssis(this);
        } else if (v.aPlaceDebout()) {
            v.monteeDemanderDebout(this);
        }
    }

    public void nouvelArret(Vehicule v, int numeroArret) {
        if (numeroArret == destination)
            v.arretDemanderSortie(this);
    }

    public String toString() {
        return nom + " " + maPosition;
    }
}
