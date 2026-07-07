<?php
defined('BASEPATH') or exit('No direct script access allowed');


$route['default_controller']   = 'common/LoginController';
$route['404_override'] 		   = '';
$route['translate_uri_dashes'] = FALSE;

// Auth Routes
$route['login']['post'] 		   	   = 'common/LoginController/login';
$route['register']['post']  	   	   = 'common/LoginController/register';
$route['verificar_cedula']['post'] 	   = 'common/LoginController/verificar_cedula';
$route['verificar_correo']['post'] 	   = 'common/LoginController/verificar_correo';
$route['logout']['post']  		   	   = 'common/LoginController/logout';
$route['recuperar_contrasena']['post'] = 'common/LoginController/recuperar_contrasena';
$route['cambiar_clave']['post'] 	   = 'common/LoginController/cambiar_clave';
$route['recuperar/(:any)']['get'] 	   = 'common/LoginController/restoring_password/$1';
$route['getsession']['get']		   	   = 'common/LoginController/getsession';

// Estudiantes Routes
$route['estudiante']['get'] 		          = 'common/StudentController/index';
$route['estudiante/contenidos']['get']        = 'common/StudentController/contenidos';
$route['estudiante/evaluaciones']['get'] 	  = 'common/StudentController/evaluaciones';
$route['estudiante/recursos']['get'] 	 	  = 'common/StudentController/recursos';
$route['estudiante/herramientas']['get'] 	  = 'common/StudentController/herramientas';
$route['estudiante/evaluacion/(:num)']['get'] = 'common/StudentController/evaluacion/$1';
$route['estudiante/simuladores']['get']       = 'common/StudentController/simuladores';
$route['estudiante/asignaciones']['get']      = 'common/StudentController/asignaciones';

// routes for both contenidoInicial 
// $route['contenido/([a-z0-9_]+)']['get'] = 'common/ContenidoController/contenido/$1';
$route['contenido/(:any)']['get']	    = 'common/ContenidoController/mostrar_contenido/$1';
$route['traer_contenido']['post'] 	    = 'common/ContenidoController/traer_contenido';
$route['traer_temas']['post'] 	        = 'common/ContenidoController/traer_temas';
$route['eliminarContenido']['post']    	= 'common/ContenidoController/eliminarContenido';
$route['perfil']['get'] 	            = 'common/LoginController/perfil';
$route['updateProfile']['post'] 	    = 'common/LoginController/updateProfile';
$route['deleteProfile']['post'] 	    = 'common/LoginController/deleteProfile';
$route['uploadResource']['post'] 	    = 'common/ResourceController/uploadResource';
$route['deleteResource/(:num)']['post'] = 'common/ResourceController/deleteResource/$1';
$route['cambiarAvatar']['post'] 		= 'common/LoginController/cambiarAvatar';
$route['validar_tema']['post']          = 'common/ExamenController/examen_en_tema';
$route['sendtest']['post']         	 	= 'common/ExamenController/sendtest';
$route['add_visto']['post']         	= 'common/ExamenController/add_visto';
$route['add_aprobado']['post']         	= 'common/ExamenController/add_aprobado';
$route['respuestas_pendientes']['get']         	= 'common/ExamenController/respuestas_pendientes';
$route['calificar_respuesta_examen']['post']         	= 'common/ExamenController/calificar_respuesta_examen';
$route['add_reprobado']['post']        	= 'common/ExamenController/add_reprobado';
$route['registrar_herramienta']['post']	= 'common/TeacherController/registrar_herramienta';
$route['eliminar_herramienta']['post']	= 'common/TeacherController/eliminar_herramienta';
$route['editarContenidoInicial']['post'] = 'common/TeacherController/editarContenidoInicial';
$route['editarcontenido']['post'] = 'common/ContenidoController/editar_contenido';
$route['registrar_simulador']['post']	= 'common/TeacherController/registrar_simulador';
$route['eliminar_simulador']['post']	= 'common/TeacherController/eliminar_simulador';
$route['anadir_asignacion']['post']		= 'common/TeacherController/anadir_asignacion';
$route['editarasignacion']['post'] = 'common/TeacherController/editar_asignacion';
$route['borrar_asignacion']['post']		= 'common/TeacherController/borrar_asignacion';
$route['responder_asignacion']['post']  = 'common/StudentController/responder_asignacion';
$route['calificar_asignacion']['post']  = 'common/TeacherController/calificar_asignacion';
$route['reporte']['get']                = 'common/TeacherController/reporte_examen';
$route['contenidoInicial']['post']      = 'common/TeacherController/contenidoInicial';
$route['delContenidoInicial']['post']   = 'common/TeacherController/borrar_contenido_inicial';
$route['chat']['get']                   = 'common/ChatController/index';
$route['mensajear']['post']             = 'common/ChatController/registrar_mensaje';
$route['traer_mensajes/(:num)/(:num)']['get']  = 'common/ChatController/traer_mensajes/$1/$2';
$route['delTemaContenido']['post']      = 'common/ContenidoController/delTemaContenido';

// Profesor Routes
$route['docente']['get']  	  		        = 'common/TeacherController/index';
$route['docente/evaluaciones']['get']       = 'common/TeacherController/evaluaciones';
$route['docente/evaluacion/(:num)']['get']  = 'common/TeacherController/evaluacion/$1';
$route['docente/estudiantes']['get']        = 'common/TeacherController/estudiantes';
$route['docente/contenidos']['get']     	= 'common/TeacherController/contenidos';
$route['docente/recursos']['get']           = 'common/TeacherController/recursos';
$route['docente/herramientas']['get']       = 'common/TeacherController/herramientas';
$route['traer_estudiantes']['get']          = 'common/TeacherController/traer_estudiantes';
$route['anadir_estudiante']['post']         = 'common/TeacherController/anadir_estudiante';
$route['addContent']['post']    	        = 'common/ContenidoController/agregar_contenido';
$route['questionForm']['post']    	        = 'common/ExamenController/registrar_preguntas';
$route['docente/simuladores']['get']        = 'common/TeacherController/simuladores';
$route['docente/asignaciones']['get']       = 'common/TeacherController/asignaciones';
$route['docente/visitas']['get']            = 'common/TeacherController/visitas';
$route['docente/eliminar/(:num)']['get'] = 'common/ExamenController/eliminar/$1';

// migla's routes
if (! $this->config->item('owner')) {
	$route['restaurar_clave']['get']   			   = 'm/LoginController/recuperar_clave';
	$route['docente/evaluaciones/crear']['get']    = 'm/TeacherControllerM/crear_evaluaciones';
	$route['docente/contenido/crear']['get']  	   = 'm/TeacherControllerM/crear_contenido';
	$route['docente/estudiantes/registrar']['get'] = 'm/TeacherControllerM/registrar_estudiante';
	$route['registrar']['get'] 					   = 'm/LoginController/registrar';
}

// TEst ROutes
$route['evaluacion/(:num)']['get'] = 'common/ExamenController/traer_examen/$1';
$route['evaluaciones']['get'] 	   = 'common/ExamenController/traer_examenes';
$route['test']['get'] = 'common/LoginController';


$route['backup']['get'] = 'common/TeacherController/dbbackup';
