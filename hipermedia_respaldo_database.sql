#
# TABLE STRUCTURE FOR: archivos
#

DROP TABLE IF EXISTS `archivos`;

CREATE TABLE `archivos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tamano` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ext` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ruta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `seccion_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seccion_id` (`seccion_id`),
  CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`seccion_id`) REFERENCES `secciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `archivos` (`id`, `tipo`, `nombre`, `tamano`, `ext`, `ruta`, `icon`, `descripcion`, `seccion_id`, `created_at`) VALUES (1, 'image/jpeg', 'descarga.jpg', '0.01', '.jpg', 'C:/xampp/htdocs/hipermedia/application/uploads/files/descarga.jpg', 'file-image', 'redes', 1, '2025-11-09');
INSERT INTO `archivos` (`id`, `tipo`, `nombre`, `tamano`, `ext`, `ruta`, `icon`, `descripcion`, `seccion_id`, `created_at`) VALUES (2, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Antropología,_Gregory,_Naiber_y_Maria.docx', '0.02', '.docx', 'C:/xampp/htdocs/hipermedia/application/uploads/files/Antropología,_Gregory,_Naiber_y_Maria.docx', 'file-word', '4234234', 3, '2025-11-17');
INSERT INTO `archivos` (`id`, `tipo`, `nombre`, `tamano`, `ext`, `ruta`, `icon`, `descripcion`, `seccion_id`, `created_at`) VALUES (3, 'image/png', 'descarga.png', '0.01', '.png', 'C:/xampp/htdocs/hipermedia/application/uploads/files/descarga.png', 'file-image', '', 1, '2025-11-19');
INSERT INTO `archivos` (`id`, `tipo`, `nombre`, `tamano`, `ext`, `ruta`, `icon`, `descripcion`, `seccion_id`, `created_at`) VALUES (4, 'image/jpeg', '1002663236.jpg', '0.08', '.jpg', 'C:/xampp/htdocs/hipermedia/application/uploads/files/1002663236.jpg', 'file-image', 'inf', 1, '2013-01-01');


#
# TABLE STRUCTURE FOR: asignacion_usuario
#

DROP TABLE IF EXISTS `asignacion_usuario`;

CREATE TABLE `asignacion_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `asignacion_id` int NOT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT 'asignada',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignacion_id` (`asignacion_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `asignacion_usuario_ibfk_1` FOREIGN KEY (`asignacion_id`) REFERENCES `asignaciones` (`id`),
  CONSTRAINT `asignacion_usuario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (1, 2, 1, 'asignada', '2025-11-09 19:43:42');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (2, 2, 2, 'asignada', '2026-04-12 17:50:10');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (3, 2, 3, 'asignada', '2026-04-15 08:26:37');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (4, 5, 4, 'asignada', '2026-04-15 10:52:07');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (5, 5, 5, 'asignada', '2026-05-06 17:57:32');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (6, 5, 6, 'asignada', '2026-05-30 17:27:57');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (7, 2, 7, 'entregada', '2026-06-11 14:13:55');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (8, 4, 7, 'asignada', '2026-06-11 14:13:55');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (9, 5, 7, 'entregada', '2026-06-11 14:13:55');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (10, 2, 8, 'asignada', '2026-06-16 05:43:05');
INSERT INTO `asignacion_usuario` (`id`, `usuario_id`, `asignacion_id`, `estado`, `created_at`) VALUES (11, 2, 9, 'asignada', '2026-06-16 05:43:05');


#
# TABLE STRUCTURE FOR: asignaciones
#

DROP TABLE IF EXISTS `asignaciones`;

CREATE TABLE `asignaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `seccion_id` int NOT NULL,
  `deleted` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (1, 'anabel', 'evaluacion', 1, 'true', '2025-11-09 19:43:42');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (2, 'Javier de la Rosa', 'easa', 1, 'true', '2026-04-12 17:50:10');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (3, 'PRUEBA', 'CORTA', 1, 'true', '2026-04-15 08:26:37');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (4, 'PRUEBA', 'WWEEEEEFFFFFQQQQQQQQQQQQQQQQ', 1, 'true', '2026-04-15 10:52:07');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (5, 'tarea 1', 'esta es una tarea especial', 1, 'false', '2026-05-06 17:57:32');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (6, 'raymond', 'moto buena', 1, 'true', '2026-05-30 17:27:57');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (7, 'investigacion', 'investigacion referente a tema tal', 1, 'false', '2026-06-11 14:13:55');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (8, '444', 'hghhhhghg', 1, 'false', '2026-06-16 05:43:05');
INSERT INTO `asignaciones` (`id`, `nombre`, `descripcion`, `seccion_id`, `deleted`, `created_at`) VALUES (9, '444', 'hghhhhghg', 1, 'false', '2026-06-16 05:43:05');


#
# TABLE STRUCTURE FOR: chat
#

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `usuario_id` int NOT NULL,
  `seccion_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_ibfk_1` (`usuario_id`),
  KEY `chat_ibfk_2` (`seccion_id`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`seccion_id`) REFERENCES `secciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `chat` (`id`, `mensaje`, `usuario_id`, `seccion_id`, `created_at`) VALUES (1, 'hola profesor', 2, 2, '2013-01-01 07:09:57');
INSERT INTO `chat` (`id`, `mensaje`, `usuario_id`, `seccion_id`, `created_at`) VALUES (2, 'buenas tardes', 1, 1, '2013-01-01 06:03:56');


#
# TABLE STRUCTURE FOR: chat_counter
#

DROP TABLE IF EXISTS `chat_counter`;

CREATE TABLE `chat_counter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contador` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `chat_counter_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (1, 0, 1);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (2, 2, 2);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (3, 2, 3);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (4, 2, 4);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (5, 0, 5);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (6, 0, 6);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (7, 0, 7);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (8, 0, 8);
INSERT INTO `chat_counter` (`id`, `contador`, `usuario_id`) VALUES (9, 0, 9);


#
# TABLE STRUCTURE FOR: contenido_inicial
#

DROP TABLE IF EXISTS `contenido_inicial`;

CREATE TABLE `contenido_inicial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `contenido` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `rutaimg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `seccion_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seccion_id` (`seccion_id`),
  CONSTRAINT `contenido_inicial_ibfk_1` FOREIGN KEY (`seccion_id`) REFERENCES `secciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `contenido_inicial` (`id`, `titulo`, `contenido`, `image`, `rutaimg`, `seccion_id`, `created_at`) VALUES (7, 'ELECTIVA DE ÁREA DE ADMINISTRACIÓN EN REDES I', 'En la carrera de Ingeniería de Sistemas es el punto de partida fundamental para comprender, diseñar, configurar y mantener la infraestructura de comunicación de cualquier organización. En esta materia pasas de la teoría abstracta de \"cómo viajan los datos\" a la práctica real de conectar y asegurar dispositivos.\r\n\r\nEn la Ingeniería de Sistemas, no todo es programar software. Esta electiva te da el conocimiento para:\r\n\r\nSoportar Aplicaciones: Un software en la nube o una base de datos distribuida no sirve de nada si la red que los sostiene falla.\r\n\r\nPreparación para Certificaciones: Es el trampolín directo para certificaciones internacionales muy demandadas en el mercado laboral, como el CCNA (Cisco Certified Network Associate).\r\n\r\nPerfil DevOps / Cloud: Hoy en día, la infraestructura en la nube (AWS, Azure, Google Cloud) requiere que sepas configurar VPCs, subredes y tablas de enrutamiento virtuales. Todo eso se basa en lo que aprendes en esta materia.', 'descarga_(1).jpg', 'http://127.0.0.1/hipermedia/application/uploads/images/descarga_(1).jpg', 1, '2026-01-24 21:27:46');


#
# TABLE STRUCTURE FOR: contenidos
#

DROP TABLE IF EXISTS `contenidos`;

CREATE TABLE `contenidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tema_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tema_id` (`tema_id`),
  CONSTRAINT `contenidos_ibfk_1` FOREIGN KEY (`tema_id`) REFERENCES `temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (14, '<h4 style=\"text-align:center;\"><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i><strong>Introducción de una Red a Configuración</strong></i></span></h4><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">La configuración de red es el proceso de establecer políticas, controles y parámetros de comunicación para permitir que los dispositivos informáticos se comuniquen. Garantiza un flujo de datos eficiente y seguro entre sistemas.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Para comprender los conceptos fundamentales de la configuración de red, repasaremos los siguientes elementos clave:</span></p><ol><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Elementos de una Red:</span></li></ol><p style=\"text-align:justify;\"><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Son los componentes físicos (hardware) y lógicos (software) que interactúan para permitir la comunicación.</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Dispositivos Finales (Hosts): Son los puntos de origen o destino de los datos. Ejemplos: computadoras, smartphones, impresoras de red y servidores.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Dispositivos Intermedios: Conectan los dispositivos finales y gestionan el flujo de datos a través de la red.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch (Conmutador): Conecta dispositivos dentro de una misma red local (LAN).</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Router (Enrutador): Conecta diferentes redes entre sí (por ejemplo, tu casa con Internet) y decide la mejor ruta para los datos.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Medios de Red: El canal por el cual viaja la información (cables o frecuencias de radio).</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Software de Red: Sistemas operativos de red y protocolos que permiten que el hardware entienda qué hacer con los datos.</span></li></ul><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Procesos de una Red</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Son las reglas, protocolos y acciones que aseguran que los datos viajen de forma segura, ordenada y eficiente.</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Direccionamiento (IP): Asignar una identidad única a cada dispositivo en la red. Se usan direcciones IPv4 (ej. 192.168.1.1) o IPv6.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Enrutamiento: El proceso que realizan los routers para dirigir los paquetes de datos desde la red de origen hasta la red de destino.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Asignación de IP (DHCP): Proceso automático mediante el cual un servidor o router asigna configuraciones de red (IP, máscara de subred) a los dispositivos que se van conectando sin intervención manual.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Resolución de Nombres (DNS): Traduce nombres de dominio legibles (como google.com) a direcciones IP que las computadoras pueden entender.</span></li></ul><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. Conexiones</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Define cómo se unen físicamente o lógicamente los elementos de la red.</span></p><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Conexiones Cableadas (Guiadas):</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Cable de par trenzado (Ethernet/RJ45): El más común para redes locales por su balance entre costo y velocidad.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Fibra óptica: Utiliza pulsos de luz. Es ideal para largas distancias y altísimas velocidades de transmisión.</span></li></ul><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Conexiones Inalámbricas (No Guiadas):</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Wi-Fi: Utiliza ondas de radio para conectar dispositivos sin cables en áreas locales.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Bluetooth: Para conexiones de corto alcance y baja velocidad (periféricos).</span></li></ul><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">4. Diseño de una Red</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Es la planificación y arquitectura de la red antes de su implementación física. Un buen diseño garantiza escalabilidad, seguridad y rendimiento.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Shutterstock</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Topología Física: Cómo están distribuidos geográficamente los cables y dispositivos. Las más comunes son:</span></li></ul><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Estrella: Todos los dispositivos se conectan a un punto central (un switch). Si un cable falla, solo ese dispositivo se desconecta.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Malla: Los dispositivos están interconectados entre sí, ideal para alta disponibilidad (si una ruta falla, hay otra).</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Topología Lógica: Cómo fluyen los datos a través de la red de forma virtual, independientemente de su conexión física.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Segmentación (VLANs): Dividir una red física en subredes lógicas más pequeñas para mejorar la seguridad y reducir el tráfico innecesario.</span></li></ul><p style=\"text-align:center;\"><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Seguridad: Diseño de firewalls, políticas de contraseñas y zonas de red (como redes para invitados) para proteger la información.</span></p>', 14, '2026-05-16 19:00:28', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (16, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Tipos de Tecnologías de Red</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Las redes se clasifican principalmente por su alcance geográfico y por el medio de transmisión que utilizan.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Por Alcance Geográfico</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">PAN (Personal Area Network): Redes de corto alcance (pocos metros) para dispositivos personales. Ejemplo: Bluetooth conectando unos auriculares al móvil.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">LAN (Local Area Network): Conecta equipos en un área limitada como una casa, oficina o edificio. Son de alta velocidad. Ejemplo: El Wi-Fi de tu hogar.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">MAN (Metropolitan Area Network): Cubre una ciudad o un municipio entero. Ideal para conectar sedes gubernamentales o universitarias.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">WAN (Wide Area Network): Redes de gran alcance que conectan países o continentes. El ejemplo más claro es Internet.</span></li></ul><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Por Medio de Transmisión</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Guiadas (Cableadas): Utilizan medios físicos para guiar la señal.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Coaxial: Usado antiguamente y todavía presente en la televisión por cable.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Par Trenzado (Ethernet - RJ45): El cable de red común en oficinas y hogares.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Fibra Óptica: Transmite pulsos de luz. Es la más rápida y resistente a interferencias.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">No Guiadas (Inalámbricas): La señal viaja a través del aire mediante ondas electromagnéticas.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Wi-Fi (IEEE 802.11): Para redes locales inalámbricas.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Redes Móviles: 4G, 5G y 6G para conectividad celular de largo alcance.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Satital: Para zonas remotas donde no llega el cableado.</span></li></ul><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Modo de Trabajo (Arquitectura y Comunicación)</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El modo de trabajo define cómo interactúan los dispositivos entre sí y cómo se gestionan los recursos de la red.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Según la Arquitectura de Red</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Cliente-Servidor: Existe un equipo centralizado (Servidor) que almacena los recursos y datos, y varios dispositivos (Clientes) que solicitan esos servicios. Es el modelo que usas al navegar por una web o consultar tu banco.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">P2P (Peer-to-Peer / Punto a Punto): Todos los nodos de la red tienen el mismo estatus y actúan como clientes y servidores a la vez. No hay un punto central de fallo. Se usa para compartir archivos (ej. BitTorrent) o en redes Blockchain.</span></li></ul><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Según el Modo de Transmisión (Flujo de Datos)</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Simplex: Los datos viajan en un solo sentido. El emisor solo emite y el receptor solo recibe. Ejemplo: La radio comercial o la televisión tradicional.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Half-Duplex: Los datos viajan en ambos sentidos, pero no al mismo tiempo. Si uno transmite, el otro debe escuchar. Ejemplo: Los walkie-talkies o el estándar Wi-Fi original.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Full-Duplex: Los datos viajan en ambos sentidos simultáneamente. Es el modo más eficiente. Ejemplo: Una llamada telefónica o las conexiones Ethernet modernas.</span></li></ul><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. Características de Funcionamiento</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Para medir qué tan eficiente, rápida o segura es una tecnología de red, se evalúan las siguientes variables técnicas:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Característica&nbsp;&nbsp;&nbsp; Descripción</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Ancho de Banda (Bandwidth)&nbsp;&nbsp; La capacidad máxima teórica de datos que un medio puede transmitir en un tiempo determinado (se mide en Mbps o Gbps).</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Tasa de Transferencia (Throughput)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La cantidad real de datos que se transmiten con éxito, la cual suele ser menor al ancho de banda debido a interferencias o congestión.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Latencia (Ping)&nbsp;El tiempo que tarda un paquete de datos en ir desde el emisor hasta el receptor y volver. Crucial para videojuegos online o videollamadas.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Topología&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La forma física o lógica en la que se organizan los nodos (en Estrella, Malla, Árbol, Bus, o Anillo). Hoy en día, la Estrella y la Malla son las más utilizadas.</span></li></ul>', 16, '2026-05-16 19:29:13', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (17, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El cableado de red estructurado es fundamental para garantizar una conexión estable y veloz. Cuando nos enfrentamos a una instalación (o al mantenimiento de una), hay cuatro pilares clave que debemos dominar: <strong>Rastreo, Verificación, Identificación y el Código de colores</strong>.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. Código de Colores (Normas T568A y T568B)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Es el punto de partida. Para que los cables UTP (Ethernet) funcionen correctamente, los hilos internos de cobre deben seguir un orden estricto en el conector RJ45.&nbsp;</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Tip de red:</strong></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Cable Directo:</strong> Usa la misma norma en ambos extremos (ej. T568B a T568B). Se usa para conectar dispositivos diferentes (PC a Switch).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Cable Cruzado:</strong> Usa T568A en un extremo y T568B en el otro. Se usa para conectar dispositivos iguales (PC a PC).</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Rastreo de Cableado</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El rastreo consiste en localizar el recorrido de un cable específico dentro de un manojo, canaleta o a través de las paredes, especialmente cuando no están etiquetados.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>La Herramienta:</strong> Se utiliza un <strong>generador de tonos y sonda</strong> (popularmente llamado \"pollito\" o <i>fox &amp; hound</i>).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Cómo se hace:</strong> Conectas el generador de tonos en un extremo del cable (por ejemplo, en la roseta de la oficina) y usas la sonda inductiva en el rack de comunicaciones. Al acercar la sonda al cable correcto, esta emitirá un pitido audible.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. Verificación de Red</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Una vez ponchado el cable, debes asegurarte de que hay continuidad eléctrica y de que no hay hilos cruzados o rotos.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Verificación Básica:</strong> Se usa un <strong>tester de red LED</strong>. Este parpadea del 1 al 8 en ambos extremos. Si un número no enciende o va en desorden, el cable está mal armado.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Verificación Profesional (Certificación):</strong> Se usan equipos de flúke (certificadores) que no solo ven si pasa corriente, sino que miden la atenuación, el ruido, la longitud del cable y si cumple con la categoría (Cat 5e, Cat 6, etc.) para soportar ciertas velocidades.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">4. Identificación (Etiquetado)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El peor enemigo de un administrador de redes es un rack lleno de cables sin nombres. La identificación consiste en marcar de forma clara el origen y destino de cada punto de red.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Dónde se identifica:</strong></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">En la roseta/jack de la pared (donde el usuario conecta su PC).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">En ambos extremos del propio cable (con etiquetas termoencogibles o banderas).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">En el Patch Panel (panel de paracheo) dentro del rack.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Buenas Prácticas:</strong> Usar códigos lógicos. Por ejemplo, la etiqueta <strong>A-01-04</strong> podría significar: <i>Piso A, Rack 01, Puerto 04</i>.</span></p><h2>&nbsp;</h2>', 17, '2026-05-18 13:51:41', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (18, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Los modelos <strong>OSI</strong> (Open Systems Interconnection) y <strong>TCP/IP</strong> son los marcos de referencia fundamentales que permiten que las computadoras se comuniquen entre sí a través de redes. Piensa en ellos como los \"manuales de instrucciones\" globales para el internet.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. Funcionamiento</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Ambos modelos utilizan un enfoque de <strong>arquitectura en capas</strong>. Cada capa tiene una función específica y se comunica con la capa superior e inferior. Cuando envías un dato, este baja por las capas del emisor (encapsulamiento) y sube por las capas del receptor (desencapsulamiento).</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Modelo OSI (7 Capas)</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Es un modelo teórico y didáctico creado por la ISO.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Aplicación (7):</strong> Interfaz que ve el usuario (navegador web, correo).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Presentación (6):</strong> Traduce, cifra y comprime los datos (ej. convertir formato de caracteres).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Sesión (5):</strong> Mantiene y controla el diálogo entre los dos dispositivos.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Transporte (4):</strong> Segmenta los datos y garantiza que lleguen sin errores (ej. TCP o UDP).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Red (3):</strong> Determina la mejor ruta física para los datos (Enrutamiento e IPs).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Enlace de Datos (2):</strong> Direccionamiento físico (MAC) y detección de errores en el medio físico.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa Física (1):</strong> Transmisión de bits puros a través del cable, fibra óptica o Wi-Fi.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Modelo TCP/IP (4 Capas)</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Es el modelo práctico y real sobre el que se construyó el Internet actual.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Aplicación:</strong> Agrupa las capas 5, 6 y 7 del modelo OSI. Define los protocolos que usan las apps.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Transporte:</strong> Igual que en OSI, gestiona la transmisión de datos de extremo a extremo.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Internet:</strong> Equivalente a la capa de Red de OSI. Se encarga del direccionamiento IP y enrutamiento.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa de Acceso a la Red:</strong> Agrupa las capas 1 y 2 de OSI. Maneja cómo se envían los datos físicamente por el cable o el aire.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El nivel de Aplicación en ambos modelos</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Mientras que OSI es un modelo teórico y muy detallado, TCP/IP es el modelo práctico sobre el que está construida la internet actual.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>En el Modelo TCP/IP:</strong> Existe una única <strong>Capa de Aplicación</strong> (Capa 4 o 5, según el autor). Esta capa engloba todo lo que el usuario ve y con lo que interactúa, asumiendo también las funciones de presentación y sesión del modelo OSI.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>En el Modelo OSI:</strong> El trabajo se divide en tres capas superiores distintas para dar más granularidad:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa 7 (Aplicación):</strong> Interfaz directa con el software (navegador, cliente de correo).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa 6 (Presentación):</strong> Se encarga del formato de los datos (cifrado, compresión, traducción de formatos como JPEG, MP3, etc.).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Capa 5 (Sesión):</strong> Establece, gestiona y finaliza las conexiones (sesiones) entre las aplicaciones locales y remotas.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Protocolos de Aplicación más comunes (Ejemplos Reales)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Cuando abres tu navegador o envías un mensaje, estás usando protocolos de la capa de aplicación. Estos son los más importantes divididos por su función:</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Navegación Web</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>HTTP / HTTPS (HyperText Transfer Protocol / Secure):</strong> Es la base de la Web. Define cómo se formatean y transmiten los mensajes entre el navegador y el servidor web. La \"S\" añade cifrado (gracias a TLS/SSL, que operaría en la capa de Presentación de OSI).</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Correo Electrónico</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>SMTP (Simple Mail Transfer Protocol):</strong> Se usa para <strong>enviar</strong> correos electrónicos desde el cliente al servidor, o entre servidores.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>IMAP / POP3:</strong> Se usan para <strong>recibir</strong> correos. IMAP los mantiene sincronizados en el servidor, mientras que POP3 los descarga al dispositivo local.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Transferencia de Archivos</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>FTP / SFTP (File Transfer Protocol / Secure):</strong> Diseñado específicamente para mover archivos grandes entre un cliente y un servidor.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Servicios de Red Básicos (Infraestructura)</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>DNS (Domain Name System):</strong> El \"listín telefónico\" de internet. Traduce nombres de dominio legibles (como google.com) en direcciones IP numéricas que las computadoras entienden.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>DHCP (Dynamic Host Configuration Protocol):</strong> Asigna automáticamente una dirección IP y otros parámetros de red a tu dispositivo cuando te conectas a una red (como el Wi-Fi de tu casa).</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. Importancia</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">¿Por qué son tan cruciales estos modelos? Si no existieran, el mundo tecnológico sería un caos.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Estandarización Universal:</strong> Permiten que un iPhone hecho en EE. UU., una PC armada en China y un servidor en Europa se entiendan perfectamente, sin importar la marca o el sistema operativo.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Facilidad de Diagnóstico (Troubleshooting):</strong> Si no tienes internet, un ingeniero de redes no adivina. Sigue las capas: ¿Prende la luz del cable? (Capa Física). ¿Tengo IP? (Capa de Red). ¿Abre Google? (Capa de Aplicación). Permite aislar problemas fácilmente.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Desarrollo Modular:</strong> Los desarrolladores pueden crear una nueva aplicación web (Capa de Aplicación) sin preocuparse por cómo el Wi-Fi o la fibra óptica (Capa de Acceso) van a transmitir los bits. Cada capa trabaja de forma independiente.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Seguridad:</strong> Permite aplicar filtros y defensas en puntos específicos. Por ejemplo, un Firewall puede bloquear puertos en la Capa de Transporte o filtrar IPs en la Capa de Internet.</span></p>', 18, '2026-05-18 14:07:04', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (19, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El <strong>direccionamiento de red</strong> es la base de las telecomunicaciones modernas. Permite que los dispositivos se identifiquen y se comuniquen entre sí dentro de una red local o a través de Internet.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. Direccionamiento Estático vs. Dinámico</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Son las dos formas en las que un dispositivo (computadora, teléfono, servidor) obtiene su dirección IP.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Direccionamiento Estático</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Consiste en asignar una dirección IP de forma <strong>manual</strong> y permanente a un dispositivo. Esta IP no cambia a menos que el administrador de la red la modifique manualmente.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Ideal para:</strong> Servidores, impresoras de red, routers o páginas web, ya que sus servicios deben estar siempre en la misma \"ubicación\" para que los usuarios puedan encontrarlos.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Desventaja:</strong> Requiere mantenimiento manual y puede generar conflictos si se asigna la misma IP a dos dispositivos por error.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Direccionamiento Dinámico</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El dispositivo obtiene su dirección IP de forma <strong>automática</strong> a través de un servidor mediante el protocolo <strong>DHCP</strong> (Dynamic Host Configuration Protocol). La IP se \"alquila\" por un tiempo determinado; cuando el dispositivo se desconecta, esa IP queda libre para otro.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Ideal para:</strong> Redes de hogares y oficinas (PCs, smartphones, laptops).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Ventaja:</strong> Automatiza la administración de la red y evita que se agoten o dupliquen las direcciones de forma accidental.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Subnetting (Subredes)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El <strong>Subnetting</strong> es el proceso de dividir una red física grande en varias redes lógicas más pequeñas (subredes).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Originalmente, las redes se dividían rígidamente por \"Clases\" (Clase A, B y C). El subnetting toma \"prestados\" bits de la porción de Host de una dirección IP para sumarlos a la porción de Red, creando así la máscara de subred.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>¿Por qué se usa?</strong></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Seguridad:</strong> Aísla los departamentos de una empresa (por ejemplo, que Recursos Humanos no vea la red de Finanzas).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Rendimiento:</strong> Reduce el tráfico de <i>broadcast</i> (mensajes masivos que saturan la red).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Desventaja tradicional:</strong> Con el subnetting clásico, todas las subredes creadas deben tener estrictamente el <strong>mismo tamaño</strong>, lo que suele desperdiciar muchas direcciones IP.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. VLSM (Variable Length Subnet Mask)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>VLSM</strong> (Máscara de Subred de Longitud Variable) es la evolución del subnetting clásico. Permite dividir una red en subredes de <strong>diferentes tamaños</strong>, adaptándose exactamente a la cantidad de hosts que necesita cada departamento.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Ejemplo práctico:</strong> Si tienes una red principal y necesitas una subred para 100 usuarios, otra para 20 y un enlace entre dos routers (que solo necesita 2 IPs), VLSM te permite crear máscaras a la medida para cada caso (por ejemplo, /25, /27 y /30) sin desperdiciar miles de direcciones.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">4. CIDR (Classless Inter-Domain Routing)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>CIDR</strong> (Enrutamiento Interdominio sin Clases) se introdujo para reemplazar el obsoleto sistema de enrutamiento basado en clases (A, B, C) que causaba un desperdicio masivo de IPs a nivel global en Internet.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">CIDR introdujo la <strong>notación de barra diagonal (/)</strong>, también conocida como prefijo de red. En lugar de escribir una dirección IP y su máscara completa (ej. 192.168.1.0 con máscara 255.255.255.0), CIDR lo simplifica a:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">$$\\text{192.168.1.0/24}$$</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El /24 indica que los primeros 24 bits pertenecen a la red, permitiendo una flexibilidad total para definir redes de cualquier tamaño en Internet, sin atarse a las reglas del viejo sistema de clases.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">5. Supernetting (Superredes)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El <strong>Supernetting</strong> (también llamado agregación de rutas o resumen de rutas) es exactamente el proceso inverso al Subnetting. Consiste en combinar varias redes contiguas más pequeñas en una sola red más grande (una \"superred\").</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>¿Para qué sirve?</strong> Se utiliza principalmente en los routers troncales de Internet. En lugar de que un router tenga que memorizar e indicar 4 rutas distintas en su tabla de enrutamiento:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">192.168.0.0/24</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">192.168.1.0/24</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">192.168.2.0/24</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">192.168.3.0/24</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El supernetting las resume todas en una sola línea: <strong>192.168.0.0/22</strong>. Esto ahorra memoria en los routers y hace que el tráfico de Internet sea mucho más rápido.</span></p>', 19, '2026-05-18 14:21:47', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (20, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Las redes en Linux son uno de los pilares más fuertes de este sistema operativo, utilizado tanto en servidores mundiales como en dispositivos empotrados. En Linux, todo el tráfico, las interfaces de hardware y las configuraciones se gestionan a través del kernel, pero nosotros interactuamos con él mediante comandos y archivos de configuración.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. Comandos Esenciales de Diagnóstico y Control</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Históricamente se utilizaba el paquete net-tools (comandos como ifconfig o route), pero hoy en día ha sido reemplazado por la suite <strong>iproute2</strong> (el comando ip).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">A continuación, los comandos que debes conocer divididos por su función:</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Exploración e Interfaces</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>ip a (o ip address):</strong> Muestra todas las interfaces de red (Ethernet, Wi-Fi, loopback) junto con sus direcciones IP (IPv4/IPv6) y estados.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>ip link:</strong> Muestra el estado físico de las interfaces (si el cable está conectado o la interfaz está encendida/apagada).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>ip link set dev &lt;interfaz&gt; up/down:</strong> Enciende o apaga una interfaz específica (ej. ip link set dev eth0 up).</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Conectividad y Rutas</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>ping &lt;IP_o_Dominio&gt; -c 4:</strong> Envía paquetes ICMP para verificar si un host destino está alcanzable. El parámetro -c 4 limita el envío a 4 paquetes.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>ip route (o ip r):</strong> Muestra la tabla de enrutamiento del sistema. Aquí puedes ver cuál es tu \"Gateway\" o puerta de enlace predeterminada.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>traceroute &lt;IP_o_Dominio&gt;:</strong> Muestra la ruta exacta (salto por salto) que toman los paquetes para llegar a un destino. Excelente para detectar dónde se corta la conexión.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Puertos y Conexiones Activas</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>ss -tuln:</strong> Reemplazo moderno de netstat. Muestra los puertos que están \"escuchando\" en la máquina.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">-t: TCP</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">-u: UDP</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">-l: Puertos en escucha (<i>listening</i>)</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">-n: Muestra números de puerto en lugar de nombres de servicio (ej. 80 en vez de http).</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Configuración de Red (Temporal vs. Permanente)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">En Linux, si usas comandos para asignar IPs, los cambios se perderán al reiniciar. Para que sean permanentes, debes editar archivos de configuración, los cuales varían según la distribución.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Configuración Temporal (En Caliente)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Las configuraciones temporales se aplican directamente en la <strong>memoria RAM</strong> del sistema. Son ideales para realizar pruebas rápidas o solucionar problemas momentáneos, ya que los cambios se aplican de forma inmediata sin necesidad de reiniciar servicios.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Persistencia:</strong> Se pierde por completo al reiniciar el equipo o el servicio de red.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Velocidad:</strong> Instantánea. No requiere recargar archivos de configuración.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Riesgo:</strong> Bajo. Si cometes un error que te deja sin conexión, un reinicio físico del servidor restaurará el estado anterior.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Comandos Comunes (Ejemplos en Linux)</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Para asignar una IP temporal o cambiar la ruta por defecto, se suele usar la suite de herramientas iproute2:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Asignar una dirección IP:</strong> sudo ip addr add 192.168.1.50/24 dev eth0</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Activar una interfaz:</strong> sudo ip link set dev eth0 up</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Agregar una puerta de enlace (Gateway):</strong> sudo ip route add default via 192.168.1.1</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Configuración Permanente (Persistente)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">La configuración permanente se escribe directamente en <strong>archivos de texto (archivos de configuración)</strong> ubicados en el disco de almacenamiento. El sistema operativo lee estos archivos cada vez que arranca o cuando se le ordena explícitamente reiniciar el servicio de red.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Persistencia:</strong> Se mantiene tras apagados, reinicios o caídas del sistema.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Velocidad:</strong> Requiere un paso adicional (reiniciar el servicio o el comando adecuado) para que los cambios surtan efecto.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Riesgo:</strong> Mayor. Si configuras mal un servidor remoto y aplicas los cambios, podrías perder el acceso de forma permanente hasta que tengas acceso físico o por consola de rescate.</span></p>', 20, '2026-05-18 14:56:48', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (21, '<h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. Comandos Básicos y Modos de Consola</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Cuando entras a la CLI (Línea de Comandos) de un switch o router Cisco, te encuentras en diferentes \"modos\". Navegar entre ellos es el primer paso:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Modo Usuario (Switch&gt;)</strong>: Modo de solo lectura. No puedes hacer cambios.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Modo Privilegiado / EXEC (Switch#)</strong>: Permite ver configuraciones y estados. Se accede con enable.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Modo de Configuración Global (Switch(config)#)</strong>: Aquí se realizan los cambios globales. Se accede con configure terminal.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Atajos útiles en la CLI:</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">?: Muestra los comandos disponibles o completa lo que sigue.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Tab: Completa automáticamente un comando a medio escribir.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">exit: Retrocede un nivel de modo.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">end o Ctrl + Z: Regresa directamente al Modo Privilegiado.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Configuración Básica de Switch y Router</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Lo primero que debes hacer al encender un dispositivo es darle una identidad y asegurar el acceso.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Los comandos son idénticos para ambos dispositivos:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Router&gt; enable</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Router# configure terminal</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Router(config)# hostname R1</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)#</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Asegurar el acceso:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# enable secret class &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ! Protege el modo privilegiado con la contraseña \"class\"</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# line console 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;! Entra a la configuración de la línea de consola</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-line)# password cisco &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ! Establece la contraseña \"cisco\"</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-line)# login &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;! Solicita la contraseña al conectar</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-line)# exit</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">&nbsp; &nbsp;Cifrar contraseñas y Mensaje del día (Banner):</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# service password-encryption &nbsp; &nbsp; ! Cifra las contraseñas en texto plano</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# banner motd #ACCESO RESTRINGIDO# ! Mensaje de advertencia legal</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. Configuración de Interfaces</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Las interfaces (puertos) permiten que los dispositivos se comuniquen.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">En un Router (Requieren IP y encenderse explícitamente):</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# interface gigabitEthernet 0/0</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-if)# ip address 192.168.1.1 255.255.255.0</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-if)# description Enlace a la LAN</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-if)# no shutdown &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;! Enciende la interfaz (por defecto vienen apagadas)</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">En un Switch (Para administración remota):</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Los switches no llevan IP en sus puertos físicos individuales, sino en una interfaz virtual (SVI):</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config)# interface vlan 1</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-if)# ip address 192.168.1.2 255.255.255.0</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-if)# no shutdown</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-if)# exit</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config)# ip default-gateway 192.168.1.1 ! IP del router para poder administrarlo desde otra red</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">4. Comandos de Verificación</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Para comprobar que todo funciona y solucionar problemas, los comandos show son tus mejores amigos (se ejecutan en el <strong>Modo Privilegiado #</strong>):</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">show ip interface brief: Muestra un resumen del estado físico y lógico (IP) de todas las interfaces.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">show running-config: Muestra la configuración actual en la memoria RAM (lo que está funcionando ahora).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">show vlan brief: (Solo en Switches) Muestra las VLANs creadas y qué puertos están asignados a ellas.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">show ip route: Muestra la tabla de enrutamiento del dispositivo.</span></p><blockquote><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">⚠️ <strong>¡Importante!</strong> Si no guardas la configuración, al reiniciar el dispositivo en Packet Tracer perderás todo. Guarda siempre con: write o copy running-config startup-config.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">5. Configuración de VLANs (Virtual LANs)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Las VLANs permiten segmentar una red física en múltiples redes lógicas independientes dentro de un switch para mejorar la seguridad y reducir el tráfico de broadcast.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Creación de VLANs:</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config)# vlan 10</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-vlan)# name Ventas</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config)# vlan 20</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-vlan)# name TI</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-vlan)# exit</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">&nbsp; &nbsp;Asignación de puertos a las VLANs (Modo Acceso):</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config)# interface fastEthernet 0/1</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-if)# switchport mode access</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-if)# switchport access vlan 10</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Configuración del Puerto Troncal (Trunk):</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Si los datos de las VLANs deben viajar hacia otro switch o hacia un router, el puerto de interconexión debe ser troncal:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config)# interface gigabitEthernet 0/1</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-if)# switchport mode trunk</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">6. Routing entre VLAN (Router-on-a-Stick)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Por defecto, los dispositivos en la VLAN 10 no pueden hablar con la VLAN 20. Para que se comuniquen, necesitamos un router que烏enrute el tráfico entre ellas. El método más común en Packet Tracer es <strong>Router-on-a-Stick</strong>, usando una sola interfaz física dividida en \"subinterfaces\".</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Configuración en el Switch:</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El puerto del switch conectado al router <strong>debe</strong> ser troncal:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config)# interface gigabitEthernet 0/2</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Switch(config-if)# switchport mode trunk</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Configuración en el Router:</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">La interfaz física se enciende sin IP, y luego se crean las subinterfaces para cada VLAN:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# interface gigabitEthernet 0/0</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-if)# no shutdown &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;! Enciende la interfaz física</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-if)# exit</span></p><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">! Subinterfaz para la VLAN 10</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# interface gigabitEthernet 0/0.10</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-subif)# encapsulation dot1Q 10 &nbsp; &nbsp; &nbsp; &nbsp;! Define el protocolo de tronco y el número de VLAN</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-subif)# ip address 192.168.10.1 255.255.255.0</span></p><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">! Subinterfaz para la VLAN 20</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config)# interface gigabitEthernet 0/0.20</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-subif)# encapsulation dot1Q 20</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">R1(config-subif)# ip address 192.168.20.1 255.255.255.0</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Nota: Las IPs asignadas a las subinterfaces del router serán los <strong>Default Gateways</strong> (Puertas de enlace) de las computadoras en sus respectivas VLANs.</span></p></blockquote>', 21, '2026-05-18 15:25:25', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (22, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Estos son los pilares fundamentales que permiten que Internet y las redes locales funcionen de forma fluida y transparente para el usuario.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. DHCP (Dynamic Host Configuration Protocol)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>El \"repartidor de identificaciones\"</i></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Imagínate que entras a un hotel y te asignan una habitación automáticamente. Eso hace DHCP en una red. Cuando conectas tu teléfono o computadora al Wi-Fi, DHCP le asigna una <strong>dirección IP</strong>, una máscara de subred y la puerta de enlace de forma automática.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Sin DHCP:</strong> Tendrías que configurar manualmente los números de red de cada dispositivo que conectes a tu casa. Un dolor de cabeza total.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. DNS (Domain Name System)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>La \"agenda telefónica\" de Internet</i></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Los humanos recordamos nombres (como google.com o wikipedia.org), pero las computadoras solo entienden números (direcciones IP como 142.250.190.46). El DNS se encarga de <strong>traducir los nombres de dominio en direcciones IP</strong>.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Cómo funciona:</strong> Cuando escribes una URL en el navegador, tu equipo le pregunta al servidor DNS: <i>\"¿Cuál es la IP de este sitio?\"</i>. El DNS responde y tu navegador puede cargar la página.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. HTTP / HTTPS (Hypertext Transfer Protocol)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>El \"mensajero\" de las páginas web</i></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Es el protocolo que permite la transferencia de información en la World Wide Web. Cuando navegas, HTTP es el encargado de <strong>pedir los textos, imágenes y videos</strong> al servidor web y traerlos a tu pantalla.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>HTTP vs. HTTPS:</strong> La \"S\" al final significa <i>Secure</i> (Seguro). Hoy en día casi todo usa HTTPS, lo que significa que la información viaja encriptada para que nadie pueda espiar tus contraseñas o datos bancarios.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">4. Correo Electrónico (E-mail)</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>El \"servicio postal\" digital</i></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">No es un solo protocolo, sino un conjunto de servicios que trabajan en equipo para que puedas enviar y recibir mensajes:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>SMTP (Simple Mail Transfer Protocol):</strong> Se encarga exclusivamente de <strong>enviar</strong> el correo desde tu dispositivo hacia el servidor.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>IMAP / POP3:</strong> Se encargan de la <strong>recepción</strong>. <i>IMAP</i> sincroniza tus correos en todos tus dispositivos (si borras uno en el celular, se borra en la PC), mientras que <i>POP3</i> los descarga y usualmente los borra del servidor.</span></p>', 22, '2026-05-27 10:03:36', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (23, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">La transferencia de archivos es el proceso de enviar datos digitales (documentos, fotos, videos) entre dispositivos o sistemas. Para hacerlo rápido y sin cables, puedes usar la nube, conectar un dispositivo por cable o hacerlo de manera local.&nbsp;</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. Acceso Remoto y SSH: El Canal Seguro</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El <strong>Acceso Remoto</strong> es la capacidad de conectarse a un equipo o servidor desde otra ubicación geográfica. En el mundo Linux, la herramienta rey para esto es <strong>SSH (Secure Shell)</strong>.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>¿Qué es SSH?</strong> Es un protocolo que permite administrar un servidor Linux de forma remota a través de una interfaz de comandos (CLI).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>¿Por qué es seguro?</strong> A diferencia de protocolos antiguos como Telnet, SSH <strong>cifra todo el tráfico</strong> (incluyendo contraseñas). Nadie que esté espiando la red podrá ver lo que haces.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Transferencia de Archivos: Moviendo Datos</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Cuando ya tienes acceso remoto, el siguiente paso lógico es mover archivos entre tu máquina local y el servidor Linux. Bajo el paraguas de SSH, existen dos métodos principales y seguros:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>SCP (Secure Copy Protocol):</strong> Ideal para enviar un archivo o carpeta de forma rápida mediante la línea de comandos.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>Ejemplo para enviar un archivo a Linux:</i> scp archivo.txt usuario@ip:/ruta/destino</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>SFTP (SSH File Transfer Protocol):</strong> Es más robusto que SCP. Permite navegar por los directorios del servidor, borrar, renombrar y transferir archivos. Puedes usarlo en la consola o mediante programas gráficos como <strong>FileZilla</strong> o <strong>WinSCP</strong>.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">3. El Entorno: Linux</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Linux</strong> es el sistema operativo que domina los servidores a nivel mundial. Es donde interactúan de forma nativa SSH y las transferencias de archivos.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">En Linux, SSH suele funcionar a través de un servicio llamado sshd (SSH Daemon).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Viene con herramientas nativas para gestionar permisos de archivos (chmod, chown), lo cual es crucial tras realizar una transferencia para asegurar que solo los usuarios correctos accedan a los datos.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">4. La Simulación: Cisco Packet Tracer</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Cisco Packet Tracer</strong> es una herramienta de simulación de redes. Te permite diseñar y probar todo lo anterior en un entorno virtual y seguro antes de llevarlo a equipos reales.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">¿Cómo se practica esto en Packet Tracer?</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Configurar la Red:</strong> Colocas un switch, una PC (que simula tu equipo local o un cliente Linux) y un Servidor.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Configurar SSH en el Servidor/Router:</strong> Activas el servicio SSH en el dispositivo de Cisco, creas un usuario, una contraseña y generas las llaves de cifrado (crypto key generate rsa).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Configurar servicios de archivos:</strong> Packet Tracer permite activar servicios como <strong>FTP</strong> o <strong>TFTP</strong> en sus servidores simulados.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Simular la conexión:</strong> Desde la \"Desktop\" de la PC simulada, abres la \"Command Prompt\" y usas el comando SSH para conectarte al router o servidor, o usas el cliente FTP para transferir archivos de prueba dentro de la simulación.</span></p>', 23, '2026-05-27 10:12:39', NULL);
INSERT INTO `contenidos` (`id`, `contenido`, `tema_id`, `created_at`, `updated_at`) VALUES (24, '<p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Un <strong>protocolo de enrutamiento</strong> es el conjunto de reglas que utilizan los routers para comunicarse entre sí y compartir información sobre la estructura de una red. Su objetivo principal es determinar el <strong>mejor camino (la ruta más eficiente)</strong> para enviar los paquetes de datos desde su origen hasta su destino.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1. Tipos de Enrutamiento</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El enrutamiento se divide principalmente en dos grandes categorías según cómo se crean y mantienen las rutas:</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">A. Enrutamiento Estático</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Las rutas son configuradas manualmente por un administrador de red. El router no cambia estas rutas a menos que el administrador intervenga.</span></p><h3><span style=\"font-family:Ubuntu, Arial, sans-serif;\">B. Enrutamiento Dinámico</span></h3><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Los routers utilizan protocolos avanzados para descubrir la red de forma automática, intercambiar tablas de enrutamiento y adaptar los caminos en tiempo real si un enlace se cae. Los protocolos dinámicos se clasifican en:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>IGP (Interior Gateway Protocols):</strong> Para enrutar tráfico dentro de una misma organización o Sistema Autónomo (AS).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>Vector de Distancia:</i> Basados en el número de saltos (ej. <strong>RIP</strong>).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>Estado de Enlace:</i> Basados en el estado de las conexiones y el ancho de banda (ej. <strong>OSPF</strong>, <strong>IS-IS</strong>).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>Híbridos:</i> Combinan lo mejor de ambos (ej. <strong>EIGRP</strong>).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>EGP (Exterior Gateway Protocols):</strong> Para enrutar tráfico entre diferentes Sistemas Autónomos (el núcleo de Internet). El estándar actual es <strong>BGP</strong>.</span></p><h2><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2. Características Clave</span></h2><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Para entender y comparar los protocolos de enrutamiento, se evalúan las siguientes métricas y conceptos:</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Métrica:</strong> El criterio cuantitativo que usa el protocolo para elegir la mejor ruta.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>RIP:</i> Cuenta de saltos (máximo 15).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>OSPF:</i> Costo (basado en el ancho de banda).</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><i>EIGRP:</i> Banda de ancho, retraso, carga y confiabilidad.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Distancia Administrativa (AD):</strong> El grado de confiabilidad de la fuente de la ruta (un número de 0 a 255). A menor número, más confiable es la ruta.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Conexión directa: 0</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Ruta Estática: 1</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">OSPF: 110</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">RIP: 120</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Convergencia:</strong> El tiempo que tardan los routers de la red en ponerse de acuerdo y actualizar sus tablas tras un cambio en la topología (por ejemplo, la caída de un cable). OSPF y EIGRP convergen muy rápido; RIP es muy lento.</span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Enrutamiento Estático</strong></span></p><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">El administrador de red configura manualmente las rutas en la tabla de enrutamiento de cada router. [</span><a href=\"https://www.youtube.com/watch?v=nuHUTToftoQ\"><span style=\"font-family:Ubuntu, Arial, sans-serif;\">1</span></a><span style=\"font-family:Ubuntu, Arial, sans-serif;\">, </span><a href=\"https://www.tp-link.com/cac/support/faq/3601/\"><span style=\"font-family:Ubuntu, Arial, sans-serif;\">2</span></a><span style=\"font-family:Ubuntu, Arial, sans-serif;\">]</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Ventajas:</strong></span><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Seguridad:</strong> No se anuncia información de la red a redes desconocidas.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Uso de recursos:</strong> Consume cero CPU o ancho de banda adicional en el router.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Control total:</strong> El administrador decide exactamente por dónde viaja el tráfico.</span></li></ul></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Desventajas:</strong></span><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Escalabilidad:</strong> Muy difícil de mantener en redes medianas o grandes. Si un enlace falla, no hay rutas alternativas automáticas.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Mantenimiento:</strong> Requiere intervención manual constante cada vez que cambia la topología de la red.</span></li></ul></li></ul><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Enrutamiento Dinámico</strong></span></p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Los routers utilizan protocolos para compartir información sobre la topología de la red automáticamente y decidir la mejor ruta en tiempo real.&nbsp;</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Ventajas:</strong></span><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Escalabilidad:</strong> Ideal para redes grandes. Se adapta automáticamente a cambios y fallos.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Convergencia rápida:</strong> Descubre nuevas rutas o descarta las caídas sin intervención humana.</span></li></ul></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Desventajas:</strong></span><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Uso de recursos:</strong> Consume CPU, memoria y ancho de banda constantemente para actualizar las tablas.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Seguridad:</strong> Requiere configuraciones adicionales para evitar anuncios no deseados o ataques.</span></li></ul></li></ul><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>Protocolos de Enrutamiento Dinámico Comunes</strong></span></p><p>&nbsp;</p><p><span style=\"font-family:Ubuntu, Arial, sans-serif;\">Se clasifican principalmente según su función:</span></p><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>IGP (Protocolos de Gateway Interior):</strong> Usados dentro de una misma red o sistema autónomo (AS).</span><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>OSPF (Open Shortest Path First):</strong> Protocolo de estado de enlace muy popular que calcula la ruta más corta.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>EIGRP (Enhanced Interior Gateway Routing Protocol):</strong> Protocolo avanzado patentado por Cisco que utiliza el algoritmo DUAL.</span></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>RIP (Routing Information Protocol):</strong> Protocolo antiguo basado en el conteo de saltos, ideal para redes pequeñas.</span></li></ul></li><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>EGP (Protocolos de Gateway Exterior):</strong> Usados para conectar diferentes redes a gran escala o en Internet.</span><ul><li><span style=\"font-family:Ubuntu, Arial, sans-serif;\"><strong>BGP (Border Gateway Protocol):</strong> El protocolo estándar que rige el tráfico en Internet a nivel mundial.</span></li></ul></li></ul>', 24, '2026-05-27 10:28:00', NULL);


#
# TABLE STRUCTURE FOR: examenes
#

DROP TABLE IF EXISTS `examenes`;

CREATE TABLE `examenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor_total` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fechaLimite` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fechaPretty` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `duracion` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `vistas` smallint DEFAULT '0',
  `aprobados` smallint DEFAULT '0',
  `reprobados` smallint DEFAULT '0',
  `tema_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tema_id` (`tema_id`),
  CONSTRAINT `examenes_ibfk_1` FOREIGN KEY (`tema_id`) REFERENCES `temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `examenes` (`id`, `valor_total`, `fechaLimite`, `fechaPretty`, `duracion`, `vistas`, `aprobados`, `reprobados`, `tema_id`, `created_at`) VALUES (6, '100', '2026-06-05', '5 Junio, 2026', '00:30:00', 0, 0, 0, 14, '2026-05-27 15:39:22');


#
# TABLE STRUCTURE FOR: examenes_tomados
#

DROP TABLE IF EXISTS `examenes_tomados`;

CREATE TABLE `examenes_tomados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `puntuacion` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `examen_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examen_id` (`examen_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `examenes_tomados_ibfk_1` FOREIGN KEY (`examen_id`) REFERENCES `examenes` (`id`),
  CONSTRAINT `examenes_tomados_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

#
# TABLE STRUCTURE FOR: herramientas
#

DROP TABLE IF EXISTS `herramientas`;

CREATE TABLE `herramientas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `enlace` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `seccion_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seccion_id` (`seccion_id`),
  CONSTRAINT `herramientas_ibfk_1` FOREIGN KEY (`seccion_id`) REFERENCES `secciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `herramientas` (`id`, `nombre`, `enlace`, `descripcion`, `imagen`, `seccion_id`, `created_at`) VALUES (2, 'tema', 'https://hireline.io/mx/enciclopedia-de-perfiles-de-tecnologia/administrador-de-redes', 'administrador de redes', 'que_hace_un_administrador_de_redes.jpg', 1, '2026-02-06 22:13:35');


#
# TABLE STRUCTURE FOR: password_resets
#

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

#
# TABLE STRUCTURE FOR: personas
#

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (1, '26464268', 'Kisbel J.', 'Pacheco P.', '0416-446-3321', '2013-01-01 05:41:00', '2026-05-27 10:35:14');
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (2, '31197620', 'Anabel', 'Pacheco', '0416-946-8644', '2013-01-01 06:02:14', '2026-06-16 05:35:36');
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (3, '20527431', 'Luis', 'Palacio', '', '2025-11-17 02:36:30', NULL);
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (4, '31197625', 'Naiber', 'Alvarez', '0412-454-4007', '2025-11-19 19:52:31', NULL);
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (5, '24240163', 'Ray', 'Garcia', '0424-447-2187', '2026-01-18 23:08:10', NULL);
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (6, '87942041', 'Raymond', 'Garcia', '0424-447-2187', '2026-05-06 16:26:35', NULL);
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (7, '18794204', 'Raymond', 'Garcia', '04244472187', '2026-05-06 16:50:39', NULL);
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (8, '', '', '', NULL, '2026-05-07 00:31:52', NULL);
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (12, '32549119', 'Paulimar', 'Martinez', '04124845621', '2026-06-16 06:05:37', NULL);
INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `created_at`, `updated_at`) VALUES (13, '20527432', 'Luis', 'Palacio', '04127379594', '2026-06-16 06:18:37', NULL);


#
# TABLE STRUCTURE FOR: pregunta_respuestas
#

DROP TABLE IF EXISTS `pregunta_respuestas`;

CREATE TABLE `pregunta_respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `valor` int NOT NULL,
  `pregunta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `respuesta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `examen_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examen_id` (`examen_id`),
  CONSTRAINT `pregunta_respuestas_ibfk_2` FOREIGN KEY (`examen_id`) REFERENCES `examenes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `pregunta_respuestas` (`id`, `tipo`, `valor`, `pregunta`, `respuesta`, `examen_id`, `created_at`) VALUES (7, 'Verdadero o Falso', 15, 'La configuración de red es el proceso de establecer políticas, controles y parámetros de comunicación para permitir que los dispositivos informáticos se comuniquen. Garantiza un flujo de datos eficiente y seguro entre sistemas.', 'verdadero', 6, '2026-05-27 15:39:22');
INSERT INTO `pregunta_respuestas` (`id`, `tipo`, `valor`, `pregunta`, `respuesta`, `examen_id`, `created_at`) VALUES (8, 'Verdadero o Falso', 15, 'Enrutamiento: Asignar una identidad única a cada dispositivo en la red. Se usan direcciones IPv4 (ej. 192.168.1.1) o IPv6.', 'falso', 6, '2026-05-27 15:39:22');
INSERT INTO `pregunta_respuestas` (`id`, `tipo`, `valor`, `pregunta`, `respuesta`, `examen_id`, `created_at`) VALUES (9, 'Verdadero o Falso', 20, 'Resolución de Nombres (DNS): Traduce nombres de dominio legibles (como google.com) a direcciones IP que las computadoras pueden entender.', 'verdadero', 6, '2026-05-27 15:39:22');
INSERT INTO `pregunta_respuestas` (`id`, `tipo`, `valor`, `pregunta`, `respuesta`, `examen_id`, `created_at`) VALUES (10, 'Verdadero o Falso', 30, 'Conexiones Inalámbricas (No Guiadas):  Wi-Fi: Utiliza ondas de radio para conectar dispositivos sin cables en áreas locales. Bluetooth: Para conexiones de corto alcance y baja velocidad (periféricos).', 'verdadero', 6, '2026-05-27 15:39:22');
INSERT INTO `pregunta_respuestas` (`id`, `tipo`, `valor`, `pregunta`, `respuesta`, `examen_id`, `created_at`) VALUES (11, 'Verdadero o Falso', 20, 'Malla: Todos los dispositivos se conectan a un punto central (un switch). Si un cable falla, solo ese dispositivo se desconecta.', 'falso', 6, '2026-05-27 15:39:22');


#
# TABLE STRUCTURE FOR: respuesta_asignacion
#

DROP TABLE IF EXISTS `respuesta_asignacion`;

CREATE TABLE `respuesta_asignacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nota` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `respuesta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `archivo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ext` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `asignacion_usuario_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignacion_usuario_id` (`asignacion_usuario_id`),
  CONSTRAINT `respuesta_asignacion_ibfk_1` FOREIGN KEY (`asignacion_usuario_id`) REFERENCES `asignacion_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `respuesta_asignacion` (`id`, `nota`, `respuesta`, `archivo`, `ext`, `icon`, `asignacion_usuario_id`, `created_at`) VALUES (1, NULL, 'prueba', 'test-hipermedia.docx', '.docx', 'file-word', 9, '2026-06-13 18:33:02');
INSERT INTO `respuesta_asignacion` (`id`, `nota`, `respuesta`, `archivo`, `ext`, `icon`, `asignacion_usuario_id`, `created_at`) VALUES (2, '100', 'investigacion lista', 'descarga.jpg', '.jpg', 'file-image', 7, '2026-06-13 19:12:34');


#
# TABLE STRUCTURE FOR: respuestas_incorrectas
#

DROP TABLE IF EXISTS `respuestas_incorrectas`;

CREATE TABLE `respuestas_incorrectas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `preg_resp_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tema_id` (`preg_resp_id`),
  CONSTRAINT `respuestas_incorrectas_ibfk_1` FOREIGN KEY (`preg_resp_id`) REFERENCES `pregunta_respuestas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

#
# TABLE STRUCTURE FOR: secciones
#

DROP TABLE IF EXISTS `secciones`;

CREATE TABLE `secciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seccion` int NOT NULL,
  `usuario_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (1, 1, 1, '2013-01-01 05:41:00');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (2, 1, 2, '2013-01-01 06:02:15');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (3, 3, 3, '2025-11-17 02:36:30');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (4, 1, 4, '2025-11-19 19:52:32');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (5, 1, 5, '2026-01-18 23:08:11');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (6, 1, 6, '2026-05-06 16:26:35');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (7, 1, 7, '2026-05-06 16:50:39');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (8, 1, 8, '2026-06-16 06:05:37');
INSERT INTO `secciones` (`id`, `seccion`, `usuario_id`, `created_at`) VALUES (9, 1, 9, '2026-06-16 06:18:37');


#
# TABLE STRUCTURE FOR: simuladores
#

DROP TABLE IF EXISTS `simuladores`;

CREATE TABLE `simuladores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `enlace` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `seccion_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seccion_id` (`seccion_id`),
  CONSTRAINT `simuladores_ibfk_1` FOREIGN KEY (`seccion_id`) REFERENCES `secciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `simuladores` (`id`, `nombre`, `descripcion`, `image`, `enlace`, `seccion_id`, `created_at`) VALUES (1, 'Cisco Packet Tracer', 'Cisco Packet Tracer es un software de simulación de redes informáticas para la enseñanza y el aprendizaje de habilidades de redes, IoT y ciberseguridad en un laboratorio virtual. Permite a los usuarios crear topologías de red virtuales, simular configurac', 'juliop.png', 'https://www.computernetworkingnotes.com/ccna-study-guide/download-packet-tracer-for-windows-and-linux.html', 1, '2026-02-06 21:38:07');


#
# TABLE STRUCTURE FOR: temas
#

DROP TABLE IF EXISTS `temas`;

CREATE TABLE `temas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lapso` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tema` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `seccion_id` int NOT NULL,
  `deleted` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT 'false',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seccion_id` (`seccion_id`),
  CONSTRAINT `temas_ibfk_1` FOREIGN KEY (`seccion_id`) REFERENCES `secciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (1, 'Tema 1', 'Redes y seguridad de redes', 1, 'true', '2025-11-09 19:23:57');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (2, 'Tema 2', 'La administración de servidores y redes', 1, 'true', '2025-11-19 19:41:21');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (3, 'Tema 3', ' gestiónde configuración de redes', 1, 'true', '2026-02-06 22:47:02');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (4, 'Tema 2', 'asa', 1, 'true', '2026-04-12 17:53:07');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (5, 'Tema 1', 'uu', 1, 'true', '2026-04-15 08:16:42');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (6, 'Tema 2', 'ghjghj', 1, 'true', '2026-05-06 14:38:05');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (7, 'Tema 1', 'ghfg', 1, 'true', '2026-05-06 14:53:10');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (8, 'Tema 3', 'sdfsdf', 1, 'true', '2026-05-06 15:12:30');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (9, 'Tema 3', 'sdfsdf', 1, 'true', '2026-05-06 15:12:48');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (10, 'Tema 3', 'sdfsdfsdf', 1, 'true', '2026-05-06 15:13:48');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (11, 'Tema 10', 'ghfgh', 1, 'true', '2026-05-06 15:48:30');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (12, 'Tema 7', 'ghfgh', 1, 'true', '2026-05-06 15:58:30');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (13, 'Tema 11', 'dfgdfg', 1, 'true', '2026-05-16 16:07:57');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (14, 'Tema 1', 'introducción a configuración de una red', 1, 'false', '2026-05-16 19:00:28');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (15, 'Tema 2', 'Tecnologias de red', 1, 'true', '2026-05-16 19:13:52');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (16, 'Tema 2', 'tipos de tecnologías de red', 1, 'false', '2026-05-16 19:29:13');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (17, 'Tema 3', 'Cableado de red', 1, 'false', '2026-05-18 13:51:41');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (18, 'Tema 4', 'Modelos OSI y TCP/P ', 1, 'false', '2026-05-18 14:07:04');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (19, 'Tema 5', 'Direccionamiento de red', 1, 'false', '2026-05-18 14:21:47');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (20, 'Tema 6', 'Introducción a las redes en Linux', 1, 'false', '2026-05-18 14:56:48');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (21, 'Tema 7', 'Introducción a las Redes en Packet Tracer', 1, 'false', '2026-05-18 15:25:25');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (22, 'Tema 8', 'Servicios de red', 1, 'false', '2026-05-27 10:03:36');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (23, 'Tema 9', 'Transferencias de archivos ', 1, 'false', '2026-05-27 10:12:39');
INSERT INTO `temas` (`id`, `lapso`, `tema`, `seccion_id`, `deleted`, `created_at`) VALUES (24, 'Tema 10', 'Protocolo de enrutamiento', 1, 'false', '2026-05-27 10:28:00');


#
# TABLE STRUCTURE FOR: usuarios
#

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `clave` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tipo` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL DEFAULT 'Docente',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT 'user.jpg',
  `persona_id` int NOT NULL,
  `deleted` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (1, 'kisbelpacheco@gmail.com', '$2y$10$3w0ttEIykNCOgwWdfj66k.d.nQ4guNC8.4IPBlztMUc162oXq77fq', 'Docente', 'user.jpg', 1, 'false', '2013-01-01 05:41:00', '2026-05-27 10:35:14');
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (2, 'anabelpacheco@gmail.com', '$2y$10$Qkjhfw0XxALX5nuuwxnqfe7uVQs2tF7E7jwai3/JOl6AMQ8NF94Em', 'Estudiante', 'user.jpg', 2, 'true', '2013-01-01 06:02:14', '2026-06-16 05:35:36');
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (3, 'la41020@gmail.com', '$2y$10$yU/ozdc2TyN0x07Z6QzdGeGMLfbdU4qQCpMibihDzkjhUB9kgZkJu', 'Docente', 'user.jpg', 3, 'false', '2025-11-17 02:36:30', NULL);
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (4, 'naiberalvarez622@gmail.com', '$2y$10$Bjc70.9I/irA0/WfvWo8N.EoSdn9IbxG.AHhHSi2LFn4FusBx9aPq', 'Estudiante', 'user.jpg', 4, 'true', '2025-11-19 19:52:32', NULL);
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (5, 'raymjoga@gmail.com', '$2y$10$LoFVPFKbT7yEf.G48d2VtuGyn9vtFvx62o87yaH/lhJ62Ud2nR0dK', 'Estudiante', 'user.jpg', 5, 'true', '2026-01-18 23:08:10', NULL);
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (6, 'raymjoga1@gmail.com', '$2y$10$NDvZNUqsExW5s5rWLoL29.e7X1Dyxe21LeJLAxcxROnjzG8pixU/O', 'Estudiante', 'user.jpg', 6, 'true', '2026-05-06 16:26:35', NULL);
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (7, 'raymjoga2@gmail.com', '$2y$10$KGAb8ML6tX7VeafzBrdJX.kH1nwSFpjcYqu3Nm4grUgGqvWCJelw.', 'Estudiante', 'user.jpg', 7, 'true', '2026-05-06 16:50:39', NULL);
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (8, 'paulimarmartinez9@gmail.com', '$2y$10$GKXn.KLGMdOwqW1OH7msbO0HOj/TWlU5ELWhtC8/P/cQa0TV.ZNBC', 'Estudiante', 'user.jpg', 12, 'true', '2026-06-16 06:05:37', NULL);
INSERT INTO `usuarios` (`id`, `correo`, `clave`, `tipo`, `avatar`, `persona_id`, `deleted`, `created_at`, `updated_at`) VALUES (9, 'palacioluis@gmail.com', '$2y$10$ITtKfgWnrv.Pq0QBWKAiu.ObdYnwXPKiiyMeg/4aVHLHXsICnktXW', 'Estudiante', 'user.jpg', 13, 'false', '2026-06-16 06:18:37', NULL);


#
# TABLE STRUCTURE FOR: visitas
#

DROP TABLE IF EXISTS `visitas`;

CREATE TABLE `visitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (1, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:41:18');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (2, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:51:40');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (3, 'kisbelpacheco@gmail.com', 'Docente', '2025-11-09 18:44:49');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (4, 'kisbelpacheco@gmail.com', 'Docente', '2025-11-09 19:40:57');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (5, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:36:52');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (6, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:57:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (7, 'la41020@gmail.com', 'Docente', '2025-11-17 02:37:05');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (8, 'kisbelpacheco@gmail.com', 'Docente', '2025-11-19 17:16:55');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (9, 'anabelpacheco@gmail.com', 'Estudiante', '2025-11-19 17:48:42');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (10, 'kisbelpacheco@gmail.com', 'Docente', '2025-11-19 18:32:29');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (11, 'naiberalvarez622@gmail.com', 'Estudiante', '2025-11-19 20:07:35');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (12, 'kisbelpacheco@gmail.com', 'Docente', '2025-11-19 20:10:22');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (13, 'anabelpacheco@gmail.com', 'Estudiante', '2025-11-19 20:58:43');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (14, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:43:54');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (15, 'kisbelpacheco@gmail.com', 'Docente', '2025-11-21 13:46:12');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (16, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:35:01');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (17, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 06:44:25');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (18, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 06:58:58');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (19, 'la41020@gmail.com', 'Docente', '2013-01-01 07:05:53');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (20, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 07:06:11');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (21, 'anabelpacheco@gmail.com', 'Estudiante', '2013-01-01 07:08:21');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (22, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-14 16:32:55');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (23, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-18 15:08:09');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (24, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-18 21:12:23');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (25, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-18 21:48:34');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (26, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-18 22:17:14');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (27, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-18 22:54:28');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (28, 'raymjoga@gmail.com', 'Estudiante', '2026-01-18 23:09:13');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (29, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-19 00:01:52');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (30, 'kisbelpacheco@gmail.com', 'Docente', '2026-01-24 21:10:48');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (31, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:53:00');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (32, 'kisbelpacheco@gmail.com', 'Docente', '2013-01-01 05:53:01');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (33, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-06 21:27:07');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (34, 'anabelpacheco@gmail.com', 'Estudiante', '2026-02-06 22:18:01');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (35, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-06 22:46:03');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (36, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-07 02:45:34');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (37, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-06 15:53:02');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (38, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-07 23:19:50');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (39, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-07 23:44:56');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (40, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:26:22');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (41, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:35:43');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (42, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:36:27');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (43, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:36:59');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (44, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:38:54');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (45, 'anabelpacheco@gmail.com', 'Estudiante', '2026-02-08 17:39:47');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (46, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:45:07');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (47, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:45:57');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (48, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:46:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (49, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:47:30');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (50, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:49:37');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (51, 'la41020@gmail.com', 'Docente', '2026-02-08 17:51:23');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (52, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:53:14');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (53, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:55:59');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (54, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:57:06');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (55, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 17:57:41');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (56, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:04:17');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (57, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:04:36');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (58, 'la41020@gmail.com', 'Docente', '2026-02-08 18:07:10');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (59, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:07:25');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (60, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:07:26');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (61, 'la41020@gmail.com', 'Docente', '2026-02-08 18:08:02');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (62, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:08:09');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (63, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:08:10');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (64, 'la41020@gmail.com', 'Docente', '2026-02-08 18:10:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (65, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:10:31');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (66, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:10:32');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (67, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:12:01');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (68, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:12:17');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (69, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:13:53');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (70, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:13:53');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (71, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:14:21');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (72, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:14:22');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (73, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:23:27');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (74, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:23:28');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (75, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:42:00');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (76, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:42:02');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (77, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 18:53:32');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (78, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 19:01:49');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (79, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 19:01:50');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (80, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-08 19:02:06');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (81, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-09 03:50:33');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (82, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-09 07:32:37');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (83, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-09 07:35:01');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (84, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-11 13:40:17');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (85, 'kisbelpacheco@gmail.com', 'Docente', '2026-02-11 13:40:17');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (86, 'kisbelpacheco@gmail.com', 'Docente', '2026-03-25 15:10:18');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (87, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-05 12:19:44');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (88, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-05 20:04:34');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (89, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-05 20:44:52');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (90, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-05 20:50:56');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (91, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-05 20:54:38');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (92, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-05 20:54:39');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (93, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-05 21:01:24');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (94, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-06 07:02:12');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (95, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-06 07:02:57');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (96, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-06 07:27:01');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (97, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-06 07:29:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (98, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-06 07:29:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (99, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-06 07:56:03');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (100, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-09 08:30:42');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (101, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-12 17:48:12');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (102, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-12 17:49:06');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (103, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-12 17:53:54');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (104, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-15 07:55:16');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (105, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-15 08:01:57');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (106, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-15 10:42:51');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (107, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-15 11:26:34');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (108, 'kisbelpacheco@gmail.com', 'Docente', '2026-04-19 08:18:39');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (109, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-06 14:37:36');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (110, 'raymjoga@gmail.com', 'Estudiante', '2026-05-06 17:58:48');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (111, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-06 18:15:15');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (112, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-06 18:16:13');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (113, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-07 08:54:36');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (114, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-07 08:56:18');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (115, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-07 08:56:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (116, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-07 08:56:22');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (117, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-07 08:58:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (118, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-07 08:58:21');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (119, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-07 09:18:23');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (120, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-09 11:52:55');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (121, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-09 11:52:56');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (122, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-11 05:54:45');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (123, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-11 06:44:23');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (124, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-11 07:28:20');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (125, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-16 13:48:54');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (126, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-16 16:07:33');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (127, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-16 18:26:43');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (128, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-16 20:45:47');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (129, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-17 08:32:02');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (130, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-18 13:41:47');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (131, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-27 09:56:39');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (132, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-27 15:21:18');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (133, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-27 15:26:10');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (134, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-27 15:26:11');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (135, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-30 16:49:26');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (136, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-31 10:00:08');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (137, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-31 18:27:40');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (138, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-31 18:42:15');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (139, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-31 20:18:40');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (140, 'kisbelpacheco@gmail.com', 'Docente', '2026-05-31 21:15:10');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (141, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 01:09:02');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (142, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 01:10:17');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (143, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 01:48:15');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (144, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 01:49:14');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (145, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 05:37:25');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (146, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 08:02:03');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (147, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 08:02:34');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (148, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-01 08:02:35');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (149, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 05:50:06');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (150, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 05:51:58');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (151, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 06:25:53');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (152, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 06:26:13');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (153, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 06:36:16');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (154, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 06:42:44');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (155, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 06:43:23');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (156, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 06:49:04');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (157, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-02 17:15:04');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (158, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-11 12:55:41');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (159, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-11 13:15:55');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (160, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-11 13:17:05');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (161, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-11 13:20:14');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (162, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-11 13:21:52');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (163, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-11 13:21:53');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (164, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-11 14:11:54');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (165, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-11 14:11:55');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (166, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-11 18:52:03');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (167, 'raymjoga@gmail.com', 'Estudiante', '2026-06-11 19:44:58');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (168, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-11 20:00:03');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (169, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-11 20:00:34');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (170, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-11 20:00:35');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (171, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-13 04:21:55');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (172, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-13 11:32:28');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (173, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-13 11:33:30');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (174, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-13 11:38:36');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (175, 'raymjoga@gmail.com', 'Estudiante', '2026-06-13 18:31:09');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (176, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-13 19:11:32');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (177, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-13 19:11:50');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (178, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-13 19:14:32');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (179, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-13 19:15:46');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (180, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-13 19:16:42');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (181, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-13 19:18:06');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (182, 'anabelpacheco@gmail.com', 'Estudiante', '2026-06-13 19:40:18');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (183, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-13 19:42:18');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (184, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-16 05:27:24');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (185, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-16 05:56:45');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (186, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-16 06:10:11');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (187, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-16 09:13:40');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (188, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-16 09:15:18');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (189, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-16 11:33:59');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (190, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-16 12:11:51');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (191, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-19 15:08:58');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (192, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-20 20:45:04');
INSERT INTO `visitas` (`id`, `usuario`, `tipo`, `created_at`) VALUES (193, 'kisbelpacheco@gmail.com', 'Docente', '2026-06-21 09:34:23');


