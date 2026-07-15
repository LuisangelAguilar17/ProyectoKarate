function fn() {
  var env = karate.env; 
  karate.log('Ambiente activo para ejecución:', env);

  if (!env) {
    env = 'dev'; 
  }

  var config = {
    env: env,
    baseUrl: 'https://jsonplaceholder.typicode.com'
  };

  // Timeouts globales
  karate.configure('connectTimeout', 8000);
  karate.configure('readTimeout', 8000);

  // Cabeceras limpias con User-Agent para mayor seguridad
  karate.configure('headers', { 
    'Content-Type': 'application/json', 
    'Accept': 'application/json',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
  });

  return config;
}