package karate;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    @Karate.Test
    Karate testUsers() {
        // Ejecuta todas las features dentro de la carpeta de usuarios
        return Karate.run("users/users").relativeTo(getClass());
    }
}