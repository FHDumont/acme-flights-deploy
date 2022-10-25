window["adrum-start-time"] = new Date().getTime();

// CONFIGURAÇÕES INICIAIS
(function (config) {
  config.adrumExtUrlHttp = "http://cdn.appdynamics.com";
  config.adrumExtUrlHttps = "https://cdn.appdynamics.com";

  config.appKey = "XXX";
  config.beaconUrlHttp = "http://pdx-col.eum-appdynamics.com";
  config.beaconUrlHttps = "https://pdx-col.eum-appdynamics.com";

  config.maxUrlLength = 512;
  config.xd = { enable: true };
  config.xhr = { maxPerPageView: "UNLIMITED" };
  config.channel = { bufferMode: false };

  config.spa = { spa2: true, clearResTiming: false };
  config.isZonePromise = true;
  config.angular = true;
})(window["adrum-config"] || (window["adrum-config"] = {}));

// CUSTOMIZAÇÕES LOADERS
(function (config) {
  let city = getCookie("location-city");
  let region = getCookie("location-region");
  let country = getCookie("location-country");
  let ipSource = getCookie("location-ipSource") || "192.168.1.100";

  if (city != undefined && region != undefined && country != undefined) {
    config.geo = {
      localIP: `${ipSource}`,
      city: `${city}`,
      region: `${region}`,
      country: `${country}`,
    };
  }
})(window["adrum-config"] || (window["adrum-config"] = {}));

function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(";");
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

// PERSONALIZAÇÕES ADICIONAIS

// AGENTE
document.write(
  '<script type="text/javascript" charset="UTF-8" src="//cdn.appdynamics.com/adrum/adrum-latest.js" ></script>'
);

// CAPTURA DE ERROS NO window.onerror
document.write("<script>ADRUM.listenForErrors();</script>");
