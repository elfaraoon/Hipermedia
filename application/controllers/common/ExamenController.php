<?php defined('BASEPATH') or exit('No direct script access allowed');

class ExamenController extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('common/Examen');
	}

	public function pedazos($array, $regex)
	{
		$keys = array_keys($array);
		$filteredKeys  = preg_grep($regex, $keys);

		$filteredArray = array_filter($array, function ($v, $k) use ($filteredKeys) {
			if (in_array($k, $filteredKeys)) {
				return $v;
			}
		}, ARRAY_FILTER_USE_BOTH);

		return $filteredArray;
	}

	public function total_de_pedazos($array)
	{
		$keys = array_keys($array);
		$filteredKeys = preg_grep("/^tipo_pregunta/", $keys);

		return count($filteredKeys);
	}

	public function registrar_preguntas()
	{
		$formData    = $this->input->post();
		$temaid  	 = $formData['tema'];
		$fechaPretty = $formData['fecha'];
		$fecha       = $formData['fecha_submit'];
		$duracion    = $formData['duracion'];
		$puntuacion  = $formData['puntuacion'];

		$totalPedazos = $this->total_de_pedazos($formData);

		$this->Examen->guardar_examen($puntuacion, $fecha, $fechaPretty, $duracion, $temaid);

		for ($i = 1; $i <= $totalPedazos; $i++) {
			$preguntaInfo = $this->pedazos($formData, "/[" . $i . "]+$/");
			$this->Examen->guardar_preguntas_examen($preguntaInfo, $i); // $temaid
		}

		redirect('/docente/evaluaciones');
	}

	public function examen_en_tema()
	{
		$temaid = $this->input->post('temaid');
		$bool   = $this->Examen->traer_examen($temaid);

		if ($bool) {
			echo json($bool);
		}
	}


	//METODOS DE PRUEBA, SALIDAS EN FORMATO JSON

	public function traer_examen($temaid)
	{
		$examen = $this->Examen->traer_examen($temaid);

		echo json($examen);
	}

	// funcion registrada en test routes
	public function traer_examenes()
	{
		$seccion   = $this->session->userdata()['seccion'];
		$preguntas = $this->Examen->traer_examenes($seccion);

		$idtema = [];

		foreach ($preguntas as $pregunta) {
			$idtema[] = $pregunta->idtema;
		}

		$sinDobleTema = array_unique($idtema);
		$temas_id     = array_values($sinDobleTema); // contiene los tema de las preguntas sin repeticion y con los indices restaurados

		$arr  = [];

		foreach ($preguntas as $key => $value) {
			for ($i = 0; $i < count($temas_id); $i++) {
				if ($value->idtema == $temas_id[$i]) {
					$arr["examen-" . $i][] = $value;
				}
			}
		}

		echo json($arr);
	}

	public function sendtest_respaldo()
	{
		$postdata   = $this->input->post();
		$idusuario  = $this->input->post('idusuario');
		$examenid   = $this->input->post('idexamen');
		$puntuacion = 0;

		$idk = ['examen' => []];

		$respuestas = $this->Examen->respuestas($examenid);

		$keys 		  = array_keys($postdata);
		$filteredKeys = preg_grep("/pregunta/", $keys);
		$longitud 	  = count($filteredKeys);

		for ($i = 1; $i <= $longitud; $i++) {
			$pedazos[] = $this->pedazos($postdata, "/[" . $i . "]+$/");

			// Si la respuesta es correcta se le suma su valor y se mantiene en la siguiente iteracion
			if (isset($pedazos[$i - 1]["respuesta-$i"])) {
				if ($pedazos[$i - 1]["respuesta-$i"] == $respuestas[$i - 1]->respuesta) {
					$puntuacion += $respuestas[$i - 1]->valor;
				}
			}
		}

		// registar participacion del estudiante en la prueba en cuestin
		$this->Examen->tomar_examen($puntuacion, $examenid, $idusuario);

		foreach ($respuestas as $value) {
			array_push($idk['examen'], [
				'pregunta'  => $value->pregunta,
				'respuesta' => $value->respuesta
			]);
		}

		$idk['puntuacion'] = $puntuacion;

		jsondie($idk);
	}

	public function sendtest()
	{
		$postdata   = $this->input->post();
		$idusuario  = $this->input->post('idusuario');
		$examenid   = $this->input->post('idexamen');
		$puntuacion = 0;

		$idk = ['examen' => []];

		$respuestas = $this->Examen->respuestas($examenid);

		$keys         = array_keys($postdata);
		$filteredKeys = preg_grep("/pregunta/", $keys);
		$longitud     = count($filteredKeys);

		// 1. REGISTRAMOS EL INTENTO PRIMERO para obtener el ID (inicia con 0 puntos)
		$id_examen_tomado = $this->Examen->tomar_examen(0, $examenid, $idusuario);

		for ($i = 1; $i <= $longitud; $i++) {
			$pedazos[] = $this->pedazos($postdata, "/[" . $i . "]+$/");

			$respuesta_alumno = isset($pedazos[$i - 1]["respuesta-$i"]) ? $pedazos[$i - 1]["respuesta-$i"] : '';
			$tipo_pregunta    = $respuestas[$i - 1]->tipo;
			$pregunta_id      = $respuestas[$i - 1]->id;

			// 2. EVALUAMOS SEGÚN EL TIPO DE PREGUNTA
			if ($tipo_pregunta == 'Desarrollo') {
				// Si es desarrollo, guardamos el texto en la nueva tabla
				$this->Examen->guardar_respuesta_desarrollo($id_examen_tomado, $pregunta_id, $respuesta_alumno);
			} else {
				// Si es de selección o V/F, autocalificamos
				if ($respuesta_alumno == $respuestas[$i - 1]->respuesta) {
					$puntuacion += $respuestas[$i - 1]->valor;
				}
			}
		}

		// 3. ACTUALIZAMOS LA NOTA FINAL (Solo incluye los puntos automáticos por ahora)
		$this->Examen->actualizar_puntuacion_examen($id_examen_tomado, $puntuacion);

		foreach ($respuestas as $value) {
			array_push($idk['examen'], [
				'pregunta'  => $value->pregunta,
				'respuesta' => $value->respuesta
			]);
		}

		$idk['puntuacion'] = $puntuacion; // Esta es la nota parcial (sin el desarrollo)

		jsondie($idk);
	}
	public function add_visto()
	{
		$idexamen = $this->input->post('idexamen');
		$this->Examen->add_visto($idexamen);
	}

	public function add_aprobado()
	{
		$idexamen = $this->input->post('idexamen');
		$this->Examen->add_aprobado($idexamen);
	}

	public function add_reprobado()
	{
		$idexamen = $this->input->post('idexamen');
		$this->Examen->add_reprobado($idexamen);
	}

	public function eliminar($idexamen)
	{
		// Es importante que el nombre de la variable coincida con el $1 de la ruta
		$this->Examen->eliminar_examen($idexamen);
		redirect('docente/evaluaciones');
	}

	// Obtener la lista para el modal respuestas_pendientes
	public function respuestas_pendientes()
	{
		$seccion = $this->session->userdata('seccion');
		$pendientes = $this->Examen->traer_respuestas_pendientes_profesor($seccion);

		echo json_encode($pendientes);
	}

	// Recibir la calificación que envíe el profesor
	public function calificar_respuesta_examen()
	{
		$id_respuesta = $this->input->post('id_respuesta');
		$id_examen_tomado = $this->input->post('id_examen_tomado');
		$puntos = $this->input->post('puntos');

		$this->Examen->guardar_nota_desarrollo($id_respuesta, $puntos, $id_examen_tomado);

		echo json_encode(['status' => 'success']);
	}
}
