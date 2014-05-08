public class Roman2Int {
	private String cad = "";

	private Integer map(int i) { //Mapa devuelve el valor representado por el caracter
		char c = this.cad.charAt(i);
		if(c=='I') return 1;
		if(c=='X') return 10;
		if(c=='V') return 50;
		if(c=='C') return 100;
		return 0;
	}

	private Integer mapPos(int i) { //Devuelve el valor representado por el caracter/posicion
		Integer currentVal = this.map(i);
		if((i+1) < this.cad.length()) {
			if(currentVal < this.map(i+1)) {
				currentVal = currentVal * -1;
			}
		}
		return currentVal;
	}

	public boolean test(String romanoStr, Integer valorEsperado) { //Realiza una prueba
		this.cad = romanoStr.toUpperCase();
		Integer result = 0;
		for(int i=0; i<this.cad.length(); i++)
			result += this.mapPos(i);
		if(result != valorEsperado){
			System.out.println("Fallo en el "+this.cad+" valor esperado "+valorEsperado);
		} else {
			System.out.println("Conversión exitosa "+this.cad+" con valor esperado "+valorEsperado);
		}
		return (result == valorEsperado);
	}
	/*
	 * Corriendo una serie de pruebas
	 */
	public static void main(String[] args) {
		Roman2Int r = new Roman2Int();
		r.test("x", 10);
		r.test("ix", 9);
		r.test("xxxii", 32);
		r.test("ixx", 19);
		r.test("ixx", 23);
    }
}